specs:
	$(shell pwd -P)/node_modules/.bin/sol-merger $(shell pwd -P)/$(dir)/$(contract).sol $(shell pwd -P)/build/merged/$(contract)
	solc --abi --optimize-runs 200 --bin --overwrite $(shell pwd -P)/build/merged/$(contract)/$(contract).sol -o $(shell pwd -P)/build/compiled/$(contract)
	solgraph $(shell pwd -P)/build/merged/$(contract)/$(contract).sol | dot -Tpng > $(shell pwd -P)/build/temp/$(contract).png
	cp $(shell pwd -P)/build/temp/$(contract).png $(shell pwd -P)/build/solgraphs/$(contract).png
	rm $(shell pwd -P)/build/temp/$(contract).png
	$(shell pwd -P)/node_modules/.bin/solmd $(shell pwd -P)/build/merged/$(contract)/$(contract).sol
	cp $(shell pwd -P)/sol.md $(shell pwd -P)/build/markdocs/$(contract).md
	rm $(shell pwd -P)/sol.md

clean:
	rm -r $(shell pwd -P)/build/solgraphs/*.png
	rm -r $(shell pwd -P)/build/markdocs/*.md
	rm -r $(shell pwd -P)/build/*.png
	rm -r $(shell pwd -P)/build/*.abi
	rm -r $(shell pwd -P)/build/*.bin
	rm -r $(shell pwd -P)/build/merged/*
	rm -r $(shell pwd -P)/build/compiled/*

	


merged:
	$(shell pwd -P)/node_modules/.bin/sol-merger $(shell pwd -P)/$(dir)/$(contract).sol $(shell pwd -P)/build/merged/$(contract)
	$(bash echo "merged contracts save to build/merged/contractname")

mergeall:
	$(shell pwd -P)/node_modules/sol-merger/bin/sol-merger.js "$(shell pwd -P)/contracts/$(dir)/$(contract).sol" build/merged/$(dir)

compiled:
	solc --abi --optimize-runs 200 --bin --overwrite $(shell pwd -P)/$(dir)/$(contract).sol -o $(shell pwd -P)/build

solgraph:
	$(shell pwd -P)/node_modules/.bin/solgraph $(shell pwd -P)/contracts/$(dir)/$(contract).sol | dot -Tpng > $(shell pwd -P)/build/temp/$(contract).png
	cp $(shell pwd -P)/build/temp/$(contract).png $(shell pwd -P)/build/solgraphs/$(contract).png
	rm $(shell pwd -P)/build/temp/$(contract).png

graphdepends:
	$(shell pwd -P)/node_modules/solidity-graph/index.js $(shell pwd -P)/$(dir) --colored --output $(shell pwd -P)/build/temp/ -c
	cp $(shell pwd -P)/build/temp/graph.png $(shell pwd -P)/build/$(dir)_flow.png
	rm $(shell pwd -P)/build/temp/graph.png

markdoc:
	$(shell pwd -P)/node_modules/.bin/solmd $(shell pwd -P)/$(dir)/$(contract).sol
	cp $(shell pwd -P)/sol.md $(shell pwd -P)/build/markdocs/$(contract).md
	rm $(shell pwd -P)/sol.md

treemap:
	tree --noreport -L 9 -X -I "$(exclude)" $(shell pwd -P)/contracts/ | sed 's/directory/node/g'| sed 's/name/TEXT/g' | sed 's/tree/map/g' | sed '$d' | sed '$d' | sed '$d'|  sed "1d" | sed 's/report/\/map/g' | sed 's/<map>/<map version="1.0.1">/g' > map.mm

treespec:
	tree -L 9 -X -I tmp $(shell pwd -P)/contracts/$(directory)/ | sed 's/directory/node/g'| sed 's/name/TEXT/g' | sed 's/tree/map/g' | sed '$d' | sed '$d' | sed '$d'|  sed "1d" | sed 's/report/\/map/g' | sed 's/<map>/<map version="1.0.1">/g' > $(shell pwd -P)/contracts/$(directory)/Map.mm

# compile:
	solc --optimize-runs 200 --gas --overwrite --bin --bin-runtime --clone-bin $(shell pwd -P)/contracts/$(contract).sol > $ $(shell pwd -P)/build/$(contract)_bin.json
	solc --optimize-runs 200 --gas --overwrite --abi $(shell pwd -P)/contracts/$(contract).sol > $ $(shell pwd -P)/build/$(contract)_abi.json
	solc --optimize-runs 200 --gas --overwrite --hashes $(shell pwd -P)/contracts/$(contract).sol > $ $(shell pwd -P)/build/$(contract)_hashes.json
	solc --optimize-runs 200 --gas --overwrite --combined abi,asm,ast,bin,bin-runtime,clone-bin,hashes,interface,metadata,opcodes,srcmap $(shell pwd -P)/contracts/$(contract).sol > $ $(shell pwd -P)/build/$(contract)_combined.txt


flatdir:
#  $(shell pwd -P)/node_modules/.bin/sol-merger $(shell pwd -P)/contracts/$(dir)/*.sol $(shell pwd -P)/build/merged/$(dir)

build-contract:
#  $(shell pwd -P)/node_modules/sol-merger/bin/sol-merger.js $(shell pwd -P)/contracts/$(dir)/$(contract).sol $(shell pwd -P)/build/merged/$(contract)

flat:
#  solidity_flattener $(shell pwd -P)/contracts/$(subdir)/$(contract).sol --out $(shell pwd -P)/contracts/$(subdir)/$(contract)_flat.sol



graphdot:
#  solgraph $(shell pwd -P)/contracts/$(dir)/$(contract).sol | > $(shell pwd -P)/build/$(dirs)/$(contract).dot
#  # solgraph | dot -Tpng | open

tree:
#  tree -d -L 8 -X -I tmp $(shell pwd -P)/contracts/$(directory)/ | sed 's/directory/node/g'| sed 's/name/TEXT/g' | sed 's/tree/map/g' | sed '$d' | sed '$d' | sed '$d'|  sed "1d" | sed 's/report/\/map/g' | sed 's/<map>/<map version="1.0.1">/g' > $(shell pwd -P)/contracts/$(directory)/Map.mm

abi:
#  solc zeppelin-solidity=$(shell pwd -P)/node_modules/openzeppelin-solidity/ contracts/EthearnalRepTokenCrowdsale.sol --abi | grep ":EthearnalRepTokenCrowdsale " -A2 | tail -n1 > build/EthearnalRepTokenCrowdsale.abi


build: source abi

testrpc:
#  node_modules/.bin/testrpc -p 8545 \
#  #  --account="0x7e9a1de56cce758c544ba5dea3a6347a4a01c453d81edc32c2385e9767f29505, 1000000000000000000000000000" \
#  #  --account="0xf2029a2f20a9f57cd1a9a2a44c63d0c875f906c646f333b028cb6f1c38ef7db5, 1000000000000000000000000000" \
#  #  --account="0x84f24b0dddc8262675927168bbbf8688f846bcaedc2618ae576d34c043401719, 1000000000000000000000000000" \
#  #  --account="0x1fdc76364db4a4bcfad8f2c010995a96fcb98a165e34858665a234ba5471520b, 1000000000000000000000000000" \
#  #  --account="0x1fdc76364db4a4bcfad8f2c010995a96fcb98a165e34858665a234ba5471520c, 1000000000000000000000000000" \
#  #  --account="0x1fdc76364db4a4bcfad8f2c010995a96fcb98a165e34858665a234ba54715123, 1000000000000000000000000000" \
#  #  --account="0x1fdc76364db4a4bcfad8f2c010995a96fcb98a165e34858665a234ba54715104, 1000000000000000000000000000" \

# test:
#  truffle test
