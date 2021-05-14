#!/bin/sh
cd $(dirname $0)
REVISION=$(svn info http://llvm.org/svn/llvm-project/llvm/trunk | grep Revision | gawk 'BEGIN{FS=": "}{print $2}')
cd ~/extra/llvm-clang-4/llvm
svn up -r$REVISION
(cd ./projects/compiler-rt; svn up -r$REVISION)
(cd ./projects/libcxx; svn up -r$REVISION)
(cd ./projects/libcxxabi; svn up -r$REVISION)
#(cd ./tools/lldb; svn up -r$REVISION)
(cd ./tools/clang; svn up -r$REVISION)
(cd ./tools/clang/tools/extra; svn up -r$REVISION)
