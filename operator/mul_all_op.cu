#include "caffe2/core/context_gpu.h"
#include "mul_all_op.h"
#include "../core/context_gpu.h"
#include "../core/operator.h"
#include "../core/registry.h"
#include "../core/common.h"
#include "../utils/math.h"


namespace caffe2{

namespace {

    __global__  void Mul_Kernel(const int N, const float* a, const float* b, float* y){
        CUDA_1D_KERNEL_LOOP(index,N){
          y[index] = a[index] * b[index];
        }
    }
}

template<>
bool MulAllOp<float, CUDAContext>::RunOnDevice(){

    auto& X = Input(0);
    auto* Y = Output(0);

    vector<TIndex> out_shape;

    for (int i = 0; i < X.ndim() ; ++i) {
    out_shape.push_back(X.dim32(i));
    }
    Y->Resize(out_shape);

    float *output_data = Y->mutable_data<float>();
    const int count = Y->size();
    long nthreads = 256;
    long no_elements = Y->size();
    long n_xblocks = min(max((int)ceil((float)no_elements / nthreads), 1), 65535);
    long n_yblocks = (long)ceil(
    (float)no_elements / (float)(n_xblocks * nthreads));
    CAFFE_ENFORCE(n_yblocks <= 65535);
    dim3 blocks(n_xblocks, n_yblocks);
    dim3 threads(nthreads);

    for (int i = 0; i < InputSize() ; ++i) {
        if (Y->dims() != Input(i).dims()) {
            CAFFE_THROW(
            "Check failed: output->dims() == Input(i).dims().",
            "Description: Input #",
            i,
            ", input dimension:",
            Input(i).dims(),
            " should match output dimension: ",
            Y->dims()); 
        }
    }
    Mul_Kernel<<<blocks,threads,0,context_.cuda_stream()>>>(count, X.data<float>(),Input(1).data<float>(),output_data);
    for (int i = 2; i <InputSize() ; ++i) {
        Mul_Kernel<<<blocks,threads,0,context_.cuda_stream()>>>(count, output_data,Input(i).data<float>(),output_data); 
    }
    return true;
}

template <>
    bool MulAllGradientOp<float, CUDAContext>::RunOnDevice(){

    auto & X = Input(1);
    auto & dY = Input(0);
    const float *gradOutput_data = dY.data<float>();

    for (int i = 1; i < InputSize() ; ++i) {
        auto& X = Input(i);
        auto* dX = Output(i-1);
        dX->ResizeLike(X);
        float * gradInput_data = dX->mutable_data<float>();

        long no_elements = dX->size();
        // cuda blocks & threads:
        long nthreads = 256;
        // Max number of blocks: http://en.wikipedia.org/wiki/CUDA
        // 65535 for SM 2.x, 2^32 -1 for >= 3.0
        // TODO: When we move to SM 3.5 we should update this
        long n_xblocks = min(max((int)ceil((float)no_elements / nthreads), 1), 65535);
        long n_yblocks = (long)ceil(
        (float)no_elements / (float)(n_xblocks * nthreads));
        CAFFE_ENFORCE(n_yblocks <= 65535);
        dim3 blocks(n_xblocks, n_yblocks);
        dim3 threads(nthreads);

        if(i == 1){
            math::CopyVector<float, CUDAContext >(dX->size(),Input(2).data<float>(),gradInput_data,&context_);
            for (int j = 3; j <InputSize() ; ++j)
            {
                Mul_Kernel<<<blocks,threads,0,context_.cuda_stream()>>>(dX->size(),Input(j).data<float>(),gradInput_data,gradInput_data);
            }
              Mul_Kernel<<<blocks,threads,0,context_.cuda_stream()>>>(dX->size(),gradInput_data,gradOutput_data,gradInput_data);
        }
         else{
                math::CopyVector<float, CUDAContext >(dX->size(),Input(1).data<float>(),gradInput_data,&context_);
                for (int j = 2; j <InputSize() ; ++j) {
                if (i==j){ continue;}
                        Mul_Kernel<<<blocks,threads,0,context_.cuda_stream()>>>(dX->size(),Input(j).data<float>(),gradInput_data,gradInput_data);
                }
                Mul_Kernel<<<blocks,threads,0,context_.cuda_stream()>>>(dX->size(),gradInput_data,gradOutput_data,gradInput_data);
            }

     }
     return true;

}
REGISTER_CUDA_OPERATOR(MulAll,MulAllOp<float, CUDAContext>);
REGISTER_CUDA_OPERATOR(MulAllGradient,MulAllGradientOp<float, CUDAContext>);
}