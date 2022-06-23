TARGET?=main
SHELL=bash
SHELL?=bash
CXX=clang++
CXX?=clang++
ifdef OS
CXX_FLAGS=-std=c++20
else
CXX_FLAGS=-std=c++20 -fpic
endif
CXX_EXTRA?=
CTAGS_I_PATH?=./
LD_FLAGS= -include-pch header.hpp.gch
EXTRA_LD_FLAGS?=
ADD_SANITIZERS_CC= -g -fsanitize=address -fno-omit-frame-pointer
ADD_SANITIZERS_LD= -g -fsanitize=address
MEM_SANITIZERS_CC= -g -fsanitize=memory -fno-omit-frame-pointer
MEM_SANITIZERS_LD= -g -fsanitize=memory
UB_SANITIZERS_CC= -g -fsanitize=undefined -fno-omit-frame-pointer
UB_SANITIZERS_LD= -g -fsanitize=undefined
FUZZ_SANITIZERS_CC= -fsanitize=fuzzer,address -g -fno-omit-frame-pointer
FUZZ_SANITIZERS_LD= -fsanitize=fuzzer,address -g -fno-omit-frame-pointer
COV_CXX= -fprofile-instr-generate -fcoverage-mapping
COV_LD= -fprofile-instr-generate
# BUILD_MODES are=RELEASE(default), DEBUG,ADDSAN,MEMSAN,UBSAN,FUZZ
BUILD_MODE?=RELEASE
#EXCLUSION_LIST='(\bdip)|(\bdim)'
EXCLUSION_LIST='xxxxxx'
OBJ_LIST:=$(patsubst %.cpp, %.o, $(shell find . -name '*.cpp' | grep -Ev $(EXCLUSION_LIST)))
OBJ_COV_LIST:=$(patsubst %.cpp, %.ocov, $(shell find . -name '*.cpp' | grep -Ev $(EXCLUSION_LIST)))
OBJ_DBG_LIST:=$(patsubst %.cpp, %.odbg, $(shell find . -name '*.cpp' | grep -Ev $(EXCLUSION_LIST)))
ASM_LIST:=$(patsubst %.cpp, %.s, $(shell find . -name '*.cpp' | grep -Ev $(EXCLUSION_LIST)))
WASM_LIST:=$(patsubst %.cpp, %.wasm, $(shell find . -name '*.cpp' | grep -Ev $(EXCLUSION_LIST)))
WAST_LIST:=$(patsubst %.cpp, %.wast, $(shell find . -name '*.cpp' | grep -Ev $(EXCLUSION_LIST)))
IR_LIST:=$(patsubst %.cpp, %.ir, $(shell find . -name '*.cpp' | grep -Ev $(EXCLUSION_LIST)))
JS_LIST:=$(patsubst %.cpp, %.js, $(shell find . -name '*.cpp' | grep -Ev $(EXCLUSION_LIST)))
AST_LIST:=$(patsubst %.cpp, %.ast, $(shell find . -name '*.cpp' | grep -Ev $(EXCLUSION_LIST)))

ifeq ($(BUILD_MODE), ADDSAN)
ifeq ($(CXX), g++)
$(error This build mode is only useable with clang++.)
endif
CXX_EXTRA+=$(ADD_SANITIZERS_CC)
EXTRA_LD_FLAGS+=$(ADD_SANITIZERS_LD)
endif

ifeq ($(BUILD_MODE), MEMSAN)
ifeq ($(CXX), g++)
$(error This build mode is only useable with clang++.)
endif
CXX_EXTRA+=$(MEM_SANITIZERS_CC)
EXTRA_LD_FLAGS+=$(MEM_SANITIZERS_LD)
endif

ifeq ($(BUILD_MODE), UBSAN)
ifeq ($(CXX), g++)
$(error This build mode is only useable with clang++.)
endif
CXX_EXTRA+=$(UB_SANITIZERS_CC)
EXTRA_LD_FLAGS+=$(UB_SANITIZERS_LD)
endif

ifeq ($(BUILD_MODE), FUZZ)
ifeq ($(CXX), g++)
$(error This build mode is only useable with clang++.)
endif
CXX_EXTRA+=$(FUZZ_SANITIZERS_CC)
EXTRA_LD_FLAGS+=$(FUZZ_SANITIZERS_LD)
endif

SRCS:=$(wildcard *.cpp)
HDRS:=$(wildcard *.h)
CXX_FLAGS+=$(CXX_EXTRA)
LD_FLAGS+=$(EXTRA_LD_FLAGS)

.DEFAULT:all

.PHONY:all clean help ASM SO TAGS WASM JS exe IR WAST A ADBG AST cppcheck DOCKER

all:exe

everything:$(TARGET) A ASM SO $(TARGET)-static $(TARGET)-dbg ADBG TAGS $(TARGET)-cov WASM JS IR WAST AST DOCKER

depend:.depend

.depend:$(SRCS)
	rm -rf .depend
	$(CXX) -MM $(CXX_FLAGS) $^ > ./.depend
	echo $(patsubst %.o:, %.odbg:, $(shell $(CXX) -MM $(CXX_FLAGS) $^)) | sed -r 's/[A-Za-z0-9\-\_]+\.odbg/\n&/g' >> ./.depend
	echo $(patsubst %.o:, %.ocov:, $(shell $(CXX) -MM $(CXX_FLAGS) $^)) | sed -r 's/[A-Za-z0-9\-\_]+\.ocov/\n&/g' >> ./.depend

-include ./.depend

.cpp.o: header.hpp.gch
	$(CXX) $(CXX_FLAGS) -c $< -o $@

%.odbg:%.cpp
	$(CXX) $(CXX_FLAGS) -g -c $< -o $@

%.ocov:%.cpp
	$(CXX) $(CXX_FLAGS) $(COV_CXX) -c $< -o $@

header.hpp.gch:header.hpp
	$(CXX) $(CXX_FLAGS) -c $< -o $@

exe: header.hpp.gch $(TARGET)

$(TARGET): $(OBJ_LIST)
	$(CXX) $(LD_FLAGS) $^ -o $@

$(TARGET)-static: $(OBJ_LIST)
	$(CXX) $(LD_FLAGS) $^ -static -o $@

$(TARGET)-dbg: $(OBJ_DBG_LIST)
	$(CXX) $(LD_FLAGS) $^ -g -o $@

$(TARGET)-cov: $(OBJ_COV_LIST)
	$(CXX) $(LD_FLAGS) $^ $(COV_LD) -o $@

cov: runcov
	@llvm-profdata merge -sparse ./default.profraw -o ./default.profdata
	@llvm-cov show $(TARGET)-cov -instr-profile=default.profdata

covrep: runcov
	@llvm-profdata merge -sparse ./default.profraw -o ./default.profdata
	@llvm-cov report $(TARGET)-cov -instr-profile=default.profdata

ASM:$(ASM_LIST)

SO:$(TARGET).so

A:$(TARGET).a

ADBG:$(TARGET).adbg

IR:$(IR_LIST)

WASM:$(WASM_LIST)

WAST:$(WAST_LIST)

JS:$(JS_LIST)

AST:$(AST_LIST)

TAGS:tags

#https://github.com/rizsotto/Bear
BEAR: clean
	bear -- make

tags:$(SRCS)
	$(shell $(CXX) -c -I $(CTAGS_I_PATH) -M $(SRCS)|\
		sed -e 's/[\\ ]/\n/g'|sed -e '/^$$/d' -e '/\.o:[ \t]*$$/d'|\
		ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q)

%.s: %.cpp
	$(CXX) -S $< -o $@
	# objdump -r -d -M intel -S $< > $@

%.ir: %.cpp
	$(CXX) -emit-llvm -S -o $@ $<

%.wasm: %.cpp
	em++ $< -o $@

%.wast: %.wasm
	wasm2wat $< > $@

%.js: %.cpp
	em++ $< -s FORCE_FILESYSTEM=1 -s EXIT_RUNTIME=1 -o $@

%.ast: %.cpp
	$(CXX) -Xclang -ast-dump -fsyntax-only $< > $@

$(TARGET).so: $(OBJ_LIST)
	$(CXX) $(LD_FLAGS) $^ -shared -o $@

$(TARGET).a: $(OBJ_LIST)
	ar rcs $(TARGET).a $(OBJ_LIST)

$(TARGET).adbg: $(OBJ_DBG_LIST)
	ar rcs $(TARGET).adbg $(OBJ_DBG_LIST)

runcov: $(TARGET)-cov
	"./$(TARGET)-cov"

test: $(TARGET)
	"./$(TARGET)"

run: $(TARGET)
	"./$(TARGET)"

valgrind: $(TARGET)
	- valgrind --track-origins=yes --leak-check=full --show-leak-kinds=all "./$(TARGET)"

cppcheck:
	cppcheck $(SRCS)

rundbg: $(TARGET)-dbg
	gdb --batch --command=./debug.dbg --args "./$(TARGET)-dbg"

format:
	- clang-format -i $(SRCS) $(HDRS)

DOCKER: Dockerfile
	docker buld -t proto ./

clean:
	- rm -f *.o *.dis *.odbg *.ocov *.js *.ir *~ $(TARGET) $(TARGET).so $(TARGET)-static \
		$(TARGET)-dbg $(TARGET).a $(TARGET)-cov *.wasm *.wast $(TARGET).adbg *.ast

deepclean: clean
	- rm tags
	- rm .depend
	- rm ./default.profraw ./default.profdata
	- rm vgcore.*
	- rm compile_commands.json
	- rm *.gch

help:
	@echo "--all is the default target, runs $(TARGET) target"
	@echo "--everything will build everything"
	@echo "--SO will generate the so"
	@echo "--ASM will generate assembly files"
	@echo "--TAGS will generate tags file"
	@echo "--BEAR will generate a compilation database"
	@echo "--IR will generate llvm IR"
	@echo "--$(TARGET) builds the dynamically-linked executable"
	@echo "--$(TARGET)-dbg will generate the debug build. BUILD_MODE should be set to DEBUG to work"
	@echo "--$(TARGET)-static will statically link the executable to the libraries"
	@echo "--$(TARGET)-cov is the coverage build"
	@echo "--cov will print the coverage report"
	@echo "--covrep will print the line coverage report"
	@echo "--A will build the static library"
	@echo "--TAGS will build the tags file"
	@echo "--clean"
	@echo "--deepclean will clean almost everything"
