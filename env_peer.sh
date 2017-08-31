#!/bin/bash

cd `dirname ${BASH_SOURCE-$0}`
. env_all.sh

export CORE_VM_ENDPOINT=unix:///host/var/run/docker.sock
# export CORE_PEER_ID=peer0.org1.example.com
export CORE_LOGGING_PEER=debug
export CORE_PEER_ENDORSER_ENABLED=true

# MSP -> membership service provider
export CORE_PEER_LOCALMSPID=Org1MSP
export CORE_PEER_MSPCONFIGPATH=$EXTSTORAGE/hl_data/msp

export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_GOSSIP_USELEADERELECTION=true
export CORE_PEER_GOSSIP_ORGLEADER=false
export CORE_PEER_GOSSIP_EXTERNALENDPOINT=localhost:7051
export CORE_PEER_TLS_ENABLED=true

export CORE_PEER_TLS_KEY_FILE=$CORE_PEER_MSPCONFIGPATH/peer/tls/server.key
export CORE_PEER_TLS_CERT_FILE=$CORE_PEER_MSPCONFIGPATH/peer/tls/server.crt
export CORE_PEER_TLS_ROOTCERT_FILE=$CORE_PEER_MSPCONFIGPATH/peer/tls/ca.crt
export CORE_VM_DOCKER_HOSTCONFIG_NETWORKMODE=simplenetwork_default
