#!/bin/bash

cd `dirname ${BASH_SOURCE-$0}`
. env_peer.sh

export CORE_PEER_ID=vp$2
export CORE_PEER_DISCOVERY_ROOTNODE=$1:7051
export CORE_PEER_ADDRESSAUTODETECT=true
export CORE_PEER_NETWORKID=dev2
export CORE_PEER_VALIDATOR_CONSENSUS_PLUGIN=pbft
export CORE_PEER_FILE_SYSTEM_PATH=$HL_DATA/hyperledger
export CORE_VM_ENDPOINT=http://localhost:2375
export CORE_PBFT_GENERAL_MODE=batch

$FABRIC_DIR/build/bin/peer node start
