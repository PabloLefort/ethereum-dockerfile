# Ethereum Dockerfile for testing

Public image:
`docker pull lefortpablo/ethereum-test`

Run:
`docker run -itd -p 8545:8545 -p 30303:30303 --name eth lefortpablo/ethereum-test`

Build:
`docker build .`

## TODO
 - Identity name
 - Number of peers
