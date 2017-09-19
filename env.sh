export PATH=$PATH:$GOPATH/src/github.com/hyperledger/fabric/build/bin
export GOPATH=/opt/gopath

HL_HOME=/users/hanrc/hanrc/deploy_fabric
HOSTS=$HL_HOME/hosts
CLIENTS=$HL_HOME/clients
HL_SOURCE=$GOPATH/src/github.com/hyperledger/fabric
HL_DATA=/users/hanrc/hanrc/hl_data
LOG_DIR=$HL_HOME/benchmark_log
EXE_HOME=$HL_HOME/../../src/macro/kvstore/
BENCHMARK=ycsb

##comment these out for smallbank
#EXE_HOME=$HL_HOME/../../src/smallbank/hyperledger
#BENCHMARK=smallbank
