.PHONY: hashbrown signed-target-files-package signed-ota
ifndef FLORAOS_TOKEN
$(error "Token for DroidAPI is not defined")
endif

ifndef FLORAOS_API_URL
$(error "DroidAPI URL is not defined")
endif

ifndef FLORAOS_KEYS_DIRECTORY
$(error "Build would not be signed")
endif

ISOTIME=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
FLORAOS_TARGET_PACKAGE := $(OUT_DIR)/FloraOS-$(BUILD_NUMBER_FROM_FILE)-$(PRODUCT_DEVICE)-OTA.zip

signed-target-files-package: target-files-package otatools
	sign_target_files_apks -o -d $(FLORAOS_KEYS_DIRECTORY) \
         --extra_apks AdServicesApk.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks FederatedCompute.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks HalfSheetUX.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks HealthConnectBackupRestore.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks HealthConnectController.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks OsuLogin.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks SafetyCenterResources.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks ServiceConnectivityResources.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks ServiceUwbResources.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks ServiceWifiResources.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks WifiDialog.apk=$(FLORAOS_KEYS_DIRECTORY)/releasekey \
         --extra_apks com.android.adbd.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.adbd \
         --extra_apks com.android.adservices.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.adservices \
         --extra_apks com.android.adservices.api.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.adservices.api \
         --extra_apks com.android.appsearch.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.appsearch \
         --extra_apks com.android.appsearch.apk.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.appsearch.apk \
         --extra_apks com.android.art.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.art \
         --extra_apks com.android.bluetooth.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.bluetooth \
         --extra_apks com.android.btservices.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.btservices \
         --extra_apks com.android.cellbroadcast.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.cellbroadcast \
         --extra_apks com.android.compos.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.compos \
         --extra_apks com.android.configinfrastructure.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.configinfrastructure \
         --extra_apks com.android.connectivity.resources.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.connectivity.resources \
         --extra_apks com.android.conscrypt.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.conscrypt \
         --extra_apks com.android.devicelock.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.devicelock \
         --extra_apks com.android.extservices.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.extservices \
         --extra_apks com.android.graphics.pdf.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.graphics.pdf \
         --extra_apks com.android.hardware.authsecret.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.authsecret \
         --extra_apks com.android.hardware.biometrics.face.virtual.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.biometrics.face.virtual \
         --extra_apks com.android.hardware.biometrics.fingerprint.virtual.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.biometrics.fingerprint.virtual \
         --extra_apks com.android.hardware.boot.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.boot \
         --extra_apks com.android.hardware.cas.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.cas \
         --extra_apks com.android.hardware.neuralnetworks.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.neuralnetworks \
         --extra_apks com.android.hardware.rebootescrow.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.rebootescrow \
         --extra_apks com.android.hardware.wifi.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.wifi \
         --extra_apks com.android.healthfitness.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.healthfitness \
         --extra_apks com.android.hotspot2.osulogin.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hotspot2.osulogin \
         --extra_apks com.android.i18n.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.i18n \
         --extra_apks com.android.ipsec.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.ipsec \
         --extra_apks com.android.media.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.media \
         --extra_apks com.android.media.swcodec.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.media.swcodec \
         --extra_apks com.android.mediaprovider.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.mediaprovider \
         --extra_apks com.android.nearby.halfsheet.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.nearby.halfsheet \
         --extra_apks com.android.networkstack.tethering.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.networkstack.tethering \
         --extra_apks com.android.neuralnetworks.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.neuralnetworks \
         --extra_apks com.android.nfcservices.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.nfcservices \
         --extra_apks com.android.ondevicepersonalization.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.ondevicepersonalization \
         --extra_apks com.android.os.statsd.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.os.statsd \
         --extra_apks com.android.permission.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.permission \
         --extra_apks com.android.profiling.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.profiling \
         --extra_apks com.android.resolv.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.resolv \
         --extra_apks com.android.rkpd.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.rkpd \
         --extra_apks com.android.runtime.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.runtime \
         --extra_apks com.android.safetycenter.resources.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.safetycenter.resources \
         --extra_apks com.android.scheduling.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.scheduling \
         --extra_apks com.android.sdkext.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.sdkext \
         --extra_apks com.android.support.apexer.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.support.apexer \
         --extra_apks com.android.telephony.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.telephony \
         --extra_apks com.android.telephonymodules.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.telephonymodules \
         --extra_apks com.android.tethering.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.tethering \
         --extra_apks com.android.tzdata.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.tzdata \
         --extra_apks com.android.uwb.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.uwb \
         --extra_apks com.android.uwb.resources.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.uwb.resources \
         --extra_apks com.android.virt.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.virt \
         --extra_apks com.android.vndk.current.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.vndk.current \
         --extra_apks com.android.vndk.current.on_vendor.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.vndk.current.on_vendor \
         --extra_apks com.android.wifi.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.wifi \
         --extra_apks com.android.wifi.dialog.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.wifi.dialog \
         --extra_apks com.android.wifi.resources.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.wifi.resources \
         --extra_apks com.google.pixel.camera.hal.apex=$(FLORAOS_KEYS_DIRECTORY)/com.google.pixel.camera.hal \
         --extra_apks com.google.pixel.vibrator.hal.apex=$(FLORAOS_KEYS_DIRECTORY)/com.google.pixel.vibrator.hal \
         --extra_apks com.qorvo.uwb.apex=$(FLORAOS_KEYS_DIRECTORY)/com.qorvo.uwb \
         --extra_apex_payload_key com.android.adbd.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.adbd.pem \
         --extra_apex_payload_key com.android.adservices.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.adservices.pem \
         --extra_apex_payload_key com.android.adservices.api.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.adservices.api.pem \
         --extra_apex_payload_key com.android.appsearch.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.appsearch.pem \
         --extra_apex_payload_key com.android.appsearch.apk.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.appsearch.apk.pem \
         --extra_apex_payload_key com.android.art.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.art.pem \
         --extra_apex_payload_key com.android.bluetooth.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.bluetooth.pem \
         --extra_apex_payload_key com.android.btservices.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.btservices.pem \
         --extra_apex_payload_key com.android.cellbroadcast.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.cellbroadcast.pem \
         --extra_apex_payload_key com.android.compos.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.compos.pem \
         --extra_apex_payload_key com.android.configinfrastructure.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.configinfrastructure.pem \
         --extra_apex_payload_key com.android.connectivity.resources.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.connectivity.resources.pem \
         --extra_apex_payload_key com.android.conscrypt.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.conscrypt.pem \
         --extra_apex_payload_key com.android.devicelock.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.devicelock.pem \
         --extra_apex_payload_key com.android.extservices.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.extservices.pem \
         --extra_apex_payload_key com.android.graphics.pdf.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.graphics.pdf.pem \
         --extra_apex_payload_key com.android.hardware.authsecret.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.authsecret.pem \
         --extra_apex_payload_key com.android.hardware.biometrics.face.virtual.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.biometrics.face.virtual.pem \
         --extra_apex_payload_key com.android.hardware.biometrics.fingerprint.virtual.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.biometrics.fingerprint.virtual.pem \
         --extra_apex_payload_key com.android.hardware.boot.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.boot.pem \
         --extra_apex_payload_key com.android.hardware.cas.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.cas.pem \
         --extra_apex_payload_key com.android.hardware.neuralnetworks.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.neuralnetworks.pem \
         --extra_apex_payload_key com.android.hardware.rebootescrow.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.rebootescrow.pem \
         --extra_apex_payload_key com.android.hardware.wifi.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hardware.wifi.pem \
         --extra_apex_payload_key com.android.healthfitness.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.healthfitness.pem \
         --extra_apex_payload_key com.android.hotspot2.osulogin.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.hotspot2.osulogin.pem \
         --extra_apex_payload_key com.android.i18n.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.i18n.pem \
         --extra_apex_payload_key com.android.ipsec.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.ipsec.pem \
         --extra_apex_payload_key com.android.media.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.media.pem \
         --extra_apex_payload_key com.android.media.swcodec.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.media.swcodec.pem \
         --extra_apex_payload_key com.android.mediaprovider.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.mediaprovider.pem \
         --extra_apex_payload_key com.android.nearby.halfsheet.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.nearby.halfsheet.pem \
         --extra_apex_payload_key com.android.networkstack.tethering.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.networkstack.tethering.pem \
         --extra_apex_payload_key com.android.neuralnetworks.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.neuralnetworks.pem \
         --extra_apex_payload_key com.android.nfcservices.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.nfcservices.pem \
         --extra_apex_payload_key com.android.ondevicepersonalization.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.ondevicepersonalization.pem \
         --extra_apex_payload_key com.android.os.statsd.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.os.statsd.pem \
         --extra_apex_payload_key com.android.permission.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.permission.pem \
         --extra_apex_payload_key com.android.profiling.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.profiling.pem \
         --extra_apex_payload_key com.android.resolv.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.resolv.pem \
         --extra_apex_payload_key com.android.rkpd.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.rkpd.pem \
         --extra_apex_payload_key com.android.runtime.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.runtime.pem \
         --extra_apex_payload_key com.android.safetycenter.resources.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.safetycenter.resources.pem \
         --extra_apex_payload_key com.android.scheduling.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.scheduling.pem \
         --extra_apex_payload_key com.android.sdkext.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.sdkext.pem \
         --extra_apex_payload_key com.android.support.apexer.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.support.apexer.pem \
         --extra_apex_payload_key com.android.telephony.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.telephony.pem \
         --extra_apex_payload_key com.android.telephonymodules.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.telephonymodules.pem \
         --extra_apex_payload_key com.android.tethering.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.tethering.pem \
         --extra_apex_payload_key com.android.tzdata.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.tzdata.pem \
         --extra_apex_payload_key com.android.uwb.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.uwb.pem \
         --extra_apex_payload_key com.android.uwb.resources.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.uwb.resources.pem \
         --extra_apex_payload_key com.android.virt.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.virt.pem \
         --extra_apex_payload_key com.android.vndk.current.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.vndk.current.pem \
         --extra_apex_payload_key com.android.vndk.current.on_vendor.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.vndk.current.on_vendor.pem \
         --extra_apex_payload_key com.android.wifi.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.wifi.pem \
         --extra_apex_payload_key com.android.wifi.dialog.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.wifi.dialog.pem \
         --extra_apex_payload_key com.android.wifi.resources.apex=$(FLORAOS_KEYS_DIRECTORY)/com.android.wifi.resources.pem \
         --extra_apex_payload_key com.google.pixel.camera.hal.apex=$(FLORAOS_KEYS_DIRECTORY)/com.google.pixel.camera.hal.pem \
         --extra_apex_payload_key com.google.pixel.vibrator.hal.apex=$(FLORAOS_KEYS_DIRECTORY)/com.google.pixel.vibrator.hal.pem \
         --extra_apex_payload_key com.qorvo.uwb.apex=$(FLORAOS_KEYS_DIRECTORY)/com.qorvo.uwb.pem \
         $(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/obj/PACKAGING/target_files_intermediates/*-target_files*.zip \
         $(OUT_DIR)/signed-target_files.zip

signed-ota: signed-target-files-package
	ota_from_target_files -k $(FLORAOS_KEYS_DIRECTORY)/releasekey \
        --block --backup=true \
        $(OUT_DIR)/signed-target_files.zip \
        $(FLORAOS_TARGET_PACKAGE)

hashbrown: signed-ota otatools
	curl -f -v -o $(OUT_DIR)/hashbrown_upload.txt --progress-bar -X "POST" "$(FLORAOS_API_URL)update/push/$(PRODUCT_DEVICE)/$(LINEAGE_BUILDTYPE)/$(BUILD_NUMBER_FROM_FILE)" -H "X-DroidAPI-Token: $(FLORAOS_TOKEN)" -F "file=@$(FLORAOS_TARGET_PACKAGE)" -F "base_version=21.0" -F "isotime=$(ISOTIME)"