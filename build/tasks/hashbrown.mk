.PHONY: hashbrown

ifndef FLORAOS_TOKEN
$(error "Token for DroidAPI is not defined")
endif

ifndef FLORAOS_API_URL
$(error "DroidAPI URL is not defined")
endif

ISOTIME=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

hashbrown: bacon 
	echo Uploading build to DroidAPI
	curl -v -o $(OUT_DIR)/hashbrown_upload.txt --progress-bar -X "POST" "$(FLORAOS_API_URL)update/push/$(PRODUCT_DEVICE)/$(LINEAGE_BUILDTYPE)/$(BUILD_NUMBER_FROM_FILE)" -H "X-DroidAPI-Token: $(FLORAOS_TOKEN)" -F "file=@$(LINEAGE_TARGET_PACKAGE)" -F "base_version=21.0" -F "isotime=$(ISOTIME)"
