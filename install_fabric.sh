sudo rm -Rf $GOPATH/src/github.com/hyperledger 
mkdir -pv $GOPATH/src/github.com/hyperledger 
cd $GOPATH/src/github.com/hyperledger 
git clone http://gerrit.hyperledger.org/r/fabric 
git clone https://github.com/hyperledger/fabric-ca

cd $GOPATH/src/github.com/hyperledger/fabric 
git branch --all 
git fetch
make clean
make dist-clean
make configtxgen
make docker
make peer-docker
make orderer-docker
make couchdb

cd $GOPATH/src/github.com/hyperledger/fabric-ca
git branch --all
git fetch 
make clean
make dist-clean
make docker 
