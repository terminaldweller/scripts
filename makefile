SOLC?=solc
NODE?=node
NPM?=npm
PKG_MAN?=dnf
TEST_SERVER?=testrpc
TEST_SERVER_OPTS?=-d &>/dev/null &
NODEJS_TEST?=test.js
LINTER?=solium
DOX?=doxity
EXTRA_BIN_FLAGS?=
EXTRA_ABI_FLAGS?=
CONTRACT_DIR?=./contracts
NODE_MIN_VERSION=7.6.0
SHELL?=/bin/bash

CONTRACTS=$(wildcard *.sol)
BIN_DIRS=$(wildcard *.bin)
BIN_FLAGS= --bin --overwrite
ABI_FLAGS= --abi --overwrite

BIN_FLAGS+=$(EXTRA_BIN_FLAGS)
ABI_FLAGS+=$(EXTRA_ABI_FLAGS)

.PHONY: all clean run runtestserver requirements rungeth loadgethjs killserver doxity solium init buld checknodeversion

.DEFAULT: all

all: $(patsubst %.sol, %.bin, $(wildcard *.sol)) runtestserver run

build: $(patsubst $(CONTRACT_DIR)/%.sol, $(CONTRACT_DIR)/%.bin, $(wildcard $(CONTRACT_DIR)/*.sol))

%.bin:%.sol
	$(SOLC) $(BIN_FLAGS) -o $@ $<
	$(SOLC) $(ABI_FLAGS) -o $@ $<

run:
	$(NODE) $(NODEJS_TEST)

init:
	mkdir .devi
	$(NPM) install

rungeth: makeattach
	geth --verbosity 6 --dev --rpc --rpcapi admin,miner,eth,net,web3,personal --rpcaddr "localhost" --rpcport "8545" --port "30303" --datadir /tmp/ethereum_dev_mode &>/dev/null &
	PID=$!
	sleep 2
	geth --exec 'loadScript("./.devi/gethconfig.js")' attach http://127.0.0.1:8545
	node $(NODEJS_TEST)
	kill -9 $(pgrep geth)
	kill -9 $$PID

makeattach:
	@echo "miner.setEtherbase(eth.accounts[0])" > ./.devi/gethconfig.js
	@echo "miner.start(2)" >> ./.devi/gethconfig.js

runparity:
	parity --chain dev --unlock 0x00a329c0648769a73afac7f9381e08fb43dbea72 --password ./password.txt 2>&1 &
	PID=$!

clean:
	rm -rf $(CONTRACT_DIR)/*.bin

doxity:
	if [[ -d ./scripts/doxity ]]; then :;else doxity init;fi && doxity build && doxity publish

lint:
	if [[ -d ./soliumrc.json ]]; then :; else solium --init;fi && solium --dir .

checknodeversion:
	@./vimeth/checknodeversion.sh

requirements:
	$(NPM) --version
	if [[ $$? != 0 ]]; then sudo $(PKG_MAN) install npm
	$(NODE)  --version
	if [[ $$? != 0 ]]; then sudo $(PKG_MAN) install nodejs
	# npm is known not to be able to install web3 globally on all systems
	$(NPM) install web3
	$(NPM) install log4js
	# install ethereum-testrpc
	sudo $(NPM) install -g ethereum-testrpc

runtestserver:
	$(shell if ! pgrep -x "testrpc" > /dev/null; then $(TEST_SERVER) $(TEST_SERVER_OPTS), disown, echo disowned, sleep 2; else :; fi)

killserver:
	$(shell kill -9 $(pgrep -x "testrpc"))

help:
	@echo '	the ide part thats missing for eth dev from vim.'
	@echo '	all: is the default target. builds bin, abi and runs node.'
	@echo '	build: builds the solidity contracts.'
	@echo '	run: just runs node on test.js.'
	@echo '	rungeth: will run geth.'
	@echo '	kilgeth: will kill geth.'
	@echo '	runtestserver: runs your test server. the default is testrpc.'
	@echo '	killserver will kill the testrpc server.'
	@echo '	requirements:  installs the requiremnts.'
	@echo '	clean: remove the bin and abi folder.'
	@echo '	lint will run the solium linter.'
	@echo '	doxity will build the docs.'
	@echo '	if you are not running an ancient shell, tab will give you the macros that you can change.'
