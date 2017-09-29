FROM ubuntu

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y ethereum

EXPOSE 8545
EXPOSE 30303

CMD cd /root/ && \
    mkdir data && \
    echo "testpassword" >> password.sec && \
    geth --datadir=/root/data account new --password password.sec && \
    geth account list && \
    geth --dev --identity "PrivateTestNode" --unlock 0 --password password.sec \
    --rpc --rpcaddr "0.0.0.0" --rpcapi="db,eth,net,web3,personal,web3" \
    --port "30303" --nodiscover --maxpeers 0 --datadir /root/data --mine \
    --etherbase 0
