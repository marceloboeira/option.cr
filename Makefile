CRYSTAL_BIN ?= $(shell which crystal)

.PHONY: test
test:
	$(CRYSTAL_BIN) spec --verbose

.PHONY: spec
spec: test

