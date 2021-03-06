#ifndef BE_DEBUG_H
#define BE_DEBUG_H

#include "be_object.h"

struct bhookblock {
    void *data;
    bntvhook hook;
};

void be_dumpclosure(bclosure *cl);
void be_tracestack(bvm *vm);
void be_callhook(bvm *vm, int mask);
bbool be_debug_varname(bvm *vm, int level, int index);
bbool be_debug_upvname(bvm *vm, int level, int index);

#endif
