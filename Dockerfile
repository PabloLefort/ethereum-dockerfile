FROM ubuntu

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y ethereum

COPY CustomGenesis.json /root/

EXPOSE 8545
EXPOSE 30303

CMD geth --identity "PrivateTestNode" --rpc --rpcaddr "0.0.0.0" --rpcapi="db,eth,net,web3,personal,web3" --port "30303" --nodiscover --maxpeers 0
