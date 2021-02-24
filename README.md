# PoA-OpenEthereum
2 private nodes + monitoring dashboard

```docker-compose up```
Open ```http://localhost:3001/```

And that's it.

TODO: Implement the Node's Interconnector (to not do it manually anymore) - a component which sends from the node0:
```curl --data '{"jsonrpc":"2.0","method":"parity_enode","params":[],"id":0}' -H "Content-Type: application/json" -X POST openethereum_1:8545```
Then gets the result (replace ```enode://RESULT``` by the response) and sends it from the node1:
```curl --data '{"jsonrpc":"2.0","method":"parity_addReservedPeer","params":["enode://RESULT"],"id":0}' -H "Content-Type: application/json" -X POST openethereum_0:8545```

TODO: polish the Shell scripts (get rid of the redundant duplicates in the startup files)

