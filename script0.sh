#!/bin/sh

./openethereum --config node0.startup.toml &
sleep 5 &&
curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["node0", "node0"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545 &&
curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["user", "user"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545 &&
sleep 5
kill $(ps faux | grep openethereum | awk '{print $1}')
wait $1
./openethereum --config node0.toml --jsonrpc-interface=0.0.0.0 --ws-interface=0.0.0.0