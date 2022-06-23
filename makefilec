TARGET?=main
SHELL=bash
SHELL?=bash
CC=clang
CC?=clang
ifdef OS
CC_FLAGS=
else
CC_FLAGS=-fpic
endif
CC_EXTRA?=
CTAGS_I_PATH?=./
LD_FLAGS=
EXTRA_LD_FLAGS?=
ADD_SANITIZERS_CC= -g -fsanitize=address -fno-omit-frame-pointer
ADD_SANITIZERS_LD= -g -fsanitize=address
MEM_SANITIZERS_CC= -g -fsanitize=memory -fno-omit-frame-pointer
MEM_SANITIZERS_LD= -g -fsanitize=memory
UB_SANITIZERS_CC= -g -fsanitize=undefined -fno-omit-frame-pointer
UB_SANITIZERS_LD= -g -fsanitize=undefined
FUZZ_SANITIZERS_CC= -fsanitize=fuzzer,address -g -fno-omit-frame-pointer
FUZZ_SANITIZERS_LD= -fsanitize=fuzzer,address -g -fno-omit-frame-pointer
COV_CC= -fprofile-instr-generate -fcoverage-mapping
COV_LD= -fprofile-instr-generate
# BUILD_MODES are=RELEASE(default), DEBUG,ADDSAN,MEMSAN,UBSAN,FUZZ
BUILD_MODE?=RELEASE
#EXCLUSION_LIST='(\bdip)|(\bdim)'
EXCLUSION_LIST='xxxxxx'
OBJ_LIST:=$(patsubst %.c, %.o, $(shell find . -name '*.c' | grep -Ev $(EXCLUSION_LIST)))
OBJ_COV_LIST:=$(patsubst %.c, %.ocov, $(shell find . -name '*.c' | grep -Ev $(EXCLUSION_LIST)))
OBJ_DBG_LIST:=$(patsubst %.c, %.odbg, $(shell find . -name '*.c' | grep -Ev $(EXCLUSION_LIST)))
ASM_LIST:=$(patsubst %.c, %.s, $(shell find . -name '*.c' | grep -Ev $(EXCLUSION_LIST)))
WASM_LIST:=$(patsubst %.c, %.wasm, $(shell find . -name '*.c' | grep -Ev $(EXCLUSION_LIST)))
WAST_LIST:=$(patsubst %.c, %.wast, $(shell find . -name '*.c' | grep -Ev $(EXCLUSION_LIST)))
IR_LIST:=$(patsubst %.c, %.ir, $(shell find . -name '*.c' | grep -Ev $(EXCLUSION_LIST)))
JS_LIST:=$(patsubst %.c, %.js, $(shell find . -name '*.c' | grep -Ev $(EXCLUSION_LIST)))
AST_LIST:=$(patsubst %.c, %.ast, $(shell find . -name '*.c' | grep -Ev $(EXCLUSION_LIST)))

ifeq ($(BUILD_MODE), ADDSAN)
ifeq ($(CC), gcc)
$(error This build mode is only useable with clang.)
endif
CC_EXTRA+=$(ADD_SANITIZERS_CC)
EXTRA_LD_FLAGS+=$(ADD_SANITIZERS_LD)
endif

ifeq ($(BUILD_MODE), MEMSAN)
ifeq ($(CC), gcc)
$(error This build mode is only useable with clang.)
endif
CC_EXTRA+=$(MEM_SANITIZERS_CC)
EXTRA_LD_FLAGS+=$(MEM_SANITIZERS_LD)
endif

ifeq ($(BUILD_MODE), UBSAN)
ifeq ($(CC), gcc)
$(error This build mode is only useable with clang.)
endif
CC_EXTRA+=$(UB_SANITIZERS_CC)
EXTRA_LD_FLAGS+=$(UB_SANITIZERS_LD)
endif

ifeq ($(BUILD_MODE), FUZZ)
ifeq ($(CXX), g++)
$(error This build mode is only useable with clang++.)
endif
CXX_EXTRA+=$(FUZZ_SANITIZERS_CC)
EXTRA_LD_FLAGS+=$(FUZZ_SANITIZERS_LD)
endif

SRCS:=$(wildcard *.c)
HDRS:=$(wildcard *.h)
CC_FLAGS+=$(CC_EXTRA)
LD_FLAGS+=$(EXTRA_LD_FLAGS)

.DEFAULT:all

.PHONY:all clean help ASM SO TAGS WASM JS IR WAST A ADBG AST cppcheck DOCKER

all:$(TARGET)

everything:$(TARGET) A ASM SO $(TARGET)-static $(TARGET)-dbg ADBG TAGS $(TARGET)-cov WASM JS IR WAST AST DOCKER

depend:.depend

.depend:$(SRCS)
	rm -rf .depend
	$(CC) -MM $(CC_FLAGS) $^ > ./.depend
	echo $(patsubst %.o:, %.odbg:, $(shell $(CC) -MM $(CC_FLAGS) $^)) | sed -r 's/[A-Za-z0-9\-\_]+\.odbg/\n&/g' >> ./.depend
	echo $(patsubst %.o:, %.ocov:, $(shell $(CC) -MM $(CC_FLAGS) $^)) | sed -r 's/[A-Za-z0-9\-\_]+\.ocov/\n&/g' >> ./.depend

-include ./.depend

.c.o:
	$(CC) $(CC_FLAGS) -c $< -o $@

%.odbg:%.c
	$(CC) $(CC_FLAGS) -g -c $< -o $@

%.ocov:%.c
	$(CC) $(CC_FLAGS) $(COV_CC) -c $< -o $@

$(TARGET): $(OBJ_LIST)
	$(CC) $(LD_FLAGS) $^ -o $@

$(TARGET)-static: $(OBJ_LIST)
	$(CC) $(LD_FLAGS) $^ -static -o $@

$(TARGET)-dbg: $(OBJ_DBG_LIST)
	$(CC) $(LD_FLAGS) $^ -g -o $@

$(TARGET)-cov: $(OBJ_COV_LIST)
	$(CC) $(LD_FLAGS) $^ $(COV_LD) -o $@

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
	$(shell $(CC) -c -I $(CTAGS_I_PATH) -M $(SRCS)|\
		sed -e 's/[\\ ]/\n/g'|sed -e '/^$$/d' -e '/\.o:[ \t]*$$/d'|\
		ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q)

%.s: %.c
	$(CC) -S $< -o $@
	# objdump -r -d -M intel -S $< > $@

%.ir: %.c
	$(CC) -emit-llvm -S -o $@ $<

%.wasm: %.c
	emcc $< -o $@

%.wast: %.wasm
	wasm2wat $< > $@

%.js: %.c
	emcc $< -s FORCE_FILESYSTEM=1 -s EXIT_RUNTIME=1 -o $@

%.ast: %.c
	$(CC) -Xclang -ast-dump -fsyntax-only $< > $@

$(TARGET).so: $(OBJ_LIST)
	$(CC) $(LD_FLAGS) $^ -shared -o $@

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
	docker build -t proto ./

clean:
	- rm -f *.o *.s *.odbg *.ocov *.js *.ir *~ $(TARGET) $(TARGET).so $(TARGET)-static \
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
	@echo "--JS will make the js file"
	@echo "--AST will make the llvm ast file"
	@echo "--WASM will make the wasm file"
	@echo "--WAST will make the wasm text debug file"
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
