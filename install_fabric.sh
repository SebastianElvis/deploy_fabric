sudo apt install docker-compose
mkdir -p $GOPATH/src/github.com

sudo rm -Rf $GOPATH/src/github.com/hyperledger 
mkdir -pv $GOPATH/src/github.com/hyperledger 
cd $GOPATH/src/github.com/hyperledger 
git clone http://gerrit.hyperledger.org/r/fabric 
git clone https://github.com/hyperledger/fabric-ca

cd $GOPATH/src/github.com/hyperledger/fabric 
git branch --all 
git fetch
sudo make clean
sudo make dist-clean
sudo make configtxgen
sudo make docker
sudo make peer-docker
sudo make orderer-docker
sudo make couchdb
sudo make peer

cd $GOPATH/src/github.com/hyperledger/fabric-ca
git branch --all
git fetch 
sudo make clean
sudo make dist-clean
sudo make docker
sudo make fabric-ca-server
sudo make fabric-ca-client 
