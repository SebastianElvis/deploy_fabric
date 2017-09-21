#!/bin/bash
#arg: master ID

cd `dirname ${BASH_SOURCE-$0}`
. env.sh

export CORE_LOGGING_LEVEL=debug
export CORE_PEER_NETWORKID=dev
export CORE_PBFT_GENERAL_N=8
export CORE_PBFT_GENERAL_BATCHSIZE=2  # only useful when in batch mode
export CORE_PEER_ID=vp$2
export CORE_PEER_DISCOVERY_ROOTNODE=$1:7051
export CORE_PEER_ADDRESSAUTODETECT=true
export CORE_PEER_VALIDATOR_CONSENSUS_PLUGIN=pbft
export CORE_PEER_FILE_SYSTEM_PATH=$HL_DATA/hyperledger
#export CORE_VM_ENDPOINT=http://localhost:2375
export CORE_VM_ENDPOINT=unix:///var/run/docker.sock
export CORE_PBFT_GENERAL_MODE=batch

sudo rm -rf /data/dinhtta/hyperledger/production
sudo mkdir -p /data/dinhtta/hyperledger/production
sudo chmod -R 777 /data/dinhtta/hyperledger/production

rm -rf $CORE_PEER_FILE_SYSTEM_PATH
mkdir -p $CORE_PEER_FILE_SYSTEM_PATH
cd $HL_SOURCE/build/bin
nohup ./peer node start > $LOG_DIR/hl_log_$(hostname -s) 2>&1 &
