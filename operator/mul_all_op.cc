//
// Created by root on 18-5-25.
//
#include "caffe2/operators/utility_ops.h"
#include "mul_all_op.h"

namespace caffe2 {

    REGISTER_CPU_OPERATOR(MulAll, MulAllOp<float, CPUContext>);
    REGISTER_CPU_OPERATOR(MulAllGradient, MulAllGradientOp<float, CPUContext>);
    OPERATOR_SCHEMA(MulAll)
    .NumInputs(1, INT_MAX)
    .NumOutputs(1)
    .SetDoc(R"DOC(
Element-wise Mul of each of the input tensors. The first input tensor can be
used in-place as the output tensor, in which case the sum will be done in
place and results will be accumulated in input0. All inputs and outputs must
have the same shape and data type.
)DOC")
    .Input(0, "data_0", "First of the input tensors. Can be inplace.")
    .Output(0, "MulAll", "Output tensor. Same dimension as inputs.");


    OPERATOR_SCHEMA(MulAllGradient)
    .NumInputs(1,INT_MAX)
    .NumOutputs(1, INT_MAX)


    .SetDoc(R"DOC(The gradient of Mul all op)DOC")
    .Input(0, "dY", "Gradient of forward output 0 (Y).");

    class GetMulAllGradient : public GradientMakerBase{
        using GradientMakerBase::GradientMakerBase;
        vector<OperatorDef> GetGradientDefs() override {

            if (GradOut(0).IsEmpty()) {
                return {};
            }
            vector<string> input_vector;
            vector<string> grads;

            input_vector.push_back(GO(0));
            for (int i = 0; i < def_.input_size(); ++i) {

                input_vector.push_back(I(i));
                grads.push_back(GI(i));
            }
            return SingleGradientDef("MulAllGradient", "", input_vector, grads);
        }
    };
    REGISTER_GRADIENT(MulAll, GetMulAllGradient);
}
