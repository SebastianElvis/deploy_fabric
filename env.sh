HL_HOME=/users/hanrc/hanrc/deploy_fabric
HOSTS=$HL_HOME/hosts
CLIENTS=$HL_HOME/clients
HL_DATA=/users/hanrc/hanrc/go
HL_SOURCE=/users/hanrc/hanrc/go/src/github.com/hyperledger/fabric
LOG_DIR=$HL_HOME/benchmark_log
EXE_HOME=$HL_HOME/../../src/macro/kvstore/
BENCHMARK=ycsb

export PATH=$PATH:/users/hanrc/hanrc/go/src/github.com/hyperledger/fabric/build/bin
export GOPATH=/users/hanrc/hanrc/go

##comment these out for smallbank
#EXE_HOME=$HL_HOME/../../src/smallbank/hyperledger
#BENCHMARK=smallbank
