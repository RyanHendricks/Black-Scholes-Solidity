#!/bin/sh

rm -r build
mkdir build
mkdir build/compiled
mkdir build/markdocs
mkdir build/merged
mkdir build/solgraphs
mkdir build/temp
mkdir build/flow
touch build/compiled/.gitkeep
touch build/markdocs/.gitkeep
touch build/merged/.gitkeep
touch build/solgraphs/.gitkeep
touch build/temp/.gitkeep
touch build/flow/.gitkeep
npm init
npm install --save-dev chai chai-as-promised chai eslint eslint-config-prettier solidity-parser-antlr@^0.3.1 openzeppelin-solidity prettier-eslint sol-merger solc solidity-coverage solidity-parser-antlr solium solium-plugin-security solmd surya ganache-cli truffle
npm install --save-dev git+https://github.com/RyanHendricks/solidity-graph.git