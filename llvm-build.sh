#!/bin/bash
"cmake" -G "Unix Makefiles" ../llvm -DLLVM_ENABLE_RTTI=1 -DCMAKE_BUILD_TYPE=Release -DLLDB_TEST_C_COMPILER=cc -DLLDB_TEST_CXX_COMPILER=g++ -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly -DLLVM_ENABLE_ASSERTIONS=1 -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;clang-tools-extra;compiler-rt;"
