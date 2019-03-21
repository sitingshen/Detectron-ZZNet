#ifndef CAFFE2_MUL_ALL_OP_H
#define CAFFE2_MUL_ALL_OP_H

#include "caffe2/core/context.h"
#include "caffe2/core/logging.h"
#include "caffe2/core/operator.h"
#include "caffe2/utils/math.h"

namespace caffe2 {

    template <typename T, class Context>
    class MulAllOp final : public Operator<Context> {
    public:
        MulAllOp(const OperatorDef& operator_def, Workspace* ws)
                : Operator<Context>(operator_def, ws){}
        USE_OPERATOR_CONTEXT_FUNCTIONS;

        bool RunOnDevice() override {
            // No CPU implementation for now
            CAFFE_NOT_IMPLEMENTED;
        }

    protected:
    };

    template <typename T, class Context>
    class MulAllGradientOp final : public Operator<Context> {
    public:
        MulAllGradientOp(const OperatorDef& def, Workspace* ws)
                : Operator<Context>(def, ws) {}
        USE_OPERATOR_CONTEXT_FUNCTIONS;

        bool RunOnDevice() override {
            // No CPU implementation for now
            CAFFE_NOT_IMPLEMENTED;
        }

    protected:
    };

} // namespace caffe2

#endif //CAFFE2_MUL_ALL_OP_H