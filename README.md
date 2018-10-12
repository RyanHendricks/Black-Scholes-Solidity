Contract Starter Repo

clone this repo
```
./initrepo.sh
```


useful package.json

```javascript
{
  "name": "union-protocol-contracts",
  "version": "0.0.1",
  "description": "Smart Contracts for the Union Protocol",
  "main": "README.md",
  "directories": {
    "test": "test"
  },
  "scripts": {
    "test": "null",
    "graph:flow": "surya graph contracts/**/*.sol | dot -Tpng > build/flow/flow.png",
    "graph:relate": "solidity-graph ./contracts --output ./build --colored",
    "flat": "make merged contract='OathMusic' dir='contracts'",
    "specs": "make specs contract='OathMusic' dir='build/merged/OathMusic'",
    "lint": "solium --dir ./contracts",
    "cleanup": "./scripts/cleanup.sh"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/TokenUnion/union-protocol-contracts.git"
  },
  "keywords": [
    "Union",
    "Protocol",
    "Staking",
    "Work",
    "Tokens",
    "Curators",
    "Bonding",
    "Distributed",
    "Work"
  ],
  "author": "tokenunion.io",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/TokenUnion/union-protocol-contracts/issues"
  },
  "homepage": "https://github.com/TokenUnion/union-protocol-contracts#readme",
  "devDependencies": {
    "babel-cli": "^6.26.0",
    "babel-core": "^6.26.3",
    "babel-eslint": "^8.2.6",
    "babel-polyfill": "^6.26.0",
    "babel-preset-es2015": "^6.24.1",
    "babel-preset-stage-2": "^6.24.1",
    "babel-preset-stage-3": "^6.24.1",
    "babel-register": "^6.26.0",
    "chai": "^4.1.2",
    "chai-as-promised": "^7.1.1",
    "chai-bignumber": "^2.0.2",
    "eslint": "^5.2.0",
    "eslint-config-prettier": "^2.9.0",
    "eslint-plugin-import": "^2.13.0",
    "eslint-plugin-promise": "^3.8.0",
    "openzeppelin-solidity": "1.11.0",
    "prettier-eslint": "^8.8.2",
    "sol-merger": "^0.1.2",
    "solc": "^0.4.24",
    "solidity-coverage": "^0.5.5",
    "solidity-graph": "git+https://github.com/RyanHendricks/solidity-graph.git",
    "solidity-parser-antlr": "^0.3.1",
    "solium": "^1.1.8",
    "solium-plugin-security": "^0.1.1",
    "solmd": "^0.3.0",
    "surya": "^0.2.7",
    "zeppelin-solidity": "^1.11.0"
  },
  "dependencies": {
    "eth-sig-util": "^2.0.1",
    "ganache-cli": "^6.1.6",
    "truffle": "^4.1.13"
  }
}
```
