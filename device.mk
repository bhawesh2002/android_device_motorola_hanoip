#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/motorola/hanoip/hanoip-vendor.mk)

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage/lineage-sdk \
    $(LOCAL_PATH)/overlay-lineage/packages/apps/Snap

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    system_ext \
    vendor \
    vbmeta \
    vbmeta_system \
	vendor_boot

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# A/B OTA dexopt package
PRODUCT_PACKAGES += otapreopt_script

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Properties
-include $(LOCAL_PATH)/properties.mk

# Permissions
PRODUCT_COPY_FILES += \
 frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
 frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xm \
 frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
 frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
 frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
 frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
 frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
 frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
 frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
 frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
 frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
 frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
 frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
 frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
 frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
 frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
 frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
 frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
 frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
 frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
 frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
 frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml\
 frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
 frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
 frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
 frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
 frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
 frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
 frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
 frameworks/native/data/etc/android \ftware.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android \ftware.device_id_attestation.xml \
 frameworks/native/data/etc/android \ftware.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android \ftware.ipsec_tunnels.xml \
 frameworks/native/data/etc/android \ftware.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android \ftware.midi.xml \
 frameworks/native/data/etc/android \ftware.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android \ftware.sip.voip.xml \
 frameworks/native/data/etc/android \ftware.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android \ftware.verified_boot.xml \
 frameworks/native/data/etc/android \ftware.vulkan.deqp.level.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android \ftware.vulkan.deqp.level.xml \
 frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
 frameworks/native/data/etc/unavail.android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/unavail.android.hardware.sensor.compass.xml \
 frameworks/native/data/etc/vendor-qti-hardware-sensorscalibrate.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/vendor-qti-hardware-sensorscalibrate.xml

 PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml \
    $(LOCAL_PATH)/configs/component-overrides_qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/component-overrides.xml
# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Audio
PRODUCT_PACKAGES += \
    PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    android.hardware \undtrigger@2.2-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    audio.bluetooth.default \
    audio.primary.sm6150 \
    audio.r_submix.default \
    audio.usb.default \
    audio.bluetooth_qti.default \
    tinymix \
    libtinycompress \
    libtinycompress.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service \
    bootctrl.sm6150 \
    bootctrl.sm6150.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl
    
# Bluetooth
PRODUCT_PACKAGES += \
    liba2dpoffload \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor \
    vendor.qti.hardware.bluetooth_sar@1.0.vendor \
    vendor.qti.hardware.bluetooth_sar@1.1.vendro \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0 \
    android.frameworks.cameraservice.common@2.0 \
    android.frameworks.cameraservice.device@2.0 \
    android.frameworks.cameraservice.service@2.0 \
    android.frameworks.cameraservice.service@2.1 \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    android.hardware.camera.provider@2.4-legacy \
    android.hardware.camera.provider@2.4-external \
    libxml2 \
    snapshotctl 

# CNE
PRODUCT_PACKAGES += \
    libcneapiclient \
    libcne \
    libcneoplookup \
    libcneqmiutils \
    libcneapiclient \
    vendor.qti.hardware.data.cne.internal.api@1.0 \
    vendor.qti.hardware.data.cne.internal.server@1.0 \
    vendor.qti.hardware.data.cne.internal.constants@1.0 \
    vendor.qti.hardware.data.cne.internal.constants@1.0 

# Common init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom.zramwb \
    init.class_main.sh \
    init.crda.sh \
    init.gadgethal.sh \
    init.mdm.sh \
    init.mmi.chipset.rc \
    init.mmi.rc \
    init.mmi.touch.sh \
    init.mmi.usb.sh \
    init.oem.hw.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.rc \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qti.dcvs.sh \
    init.qti.fm.sh \
    init.qti.ims.sh \
    init.qti.fm.rc \
    init.qti.qcv.rc \
    init.qdmastats.rc \
    init.time_daemon.rc \
    init.embmssl_server.rc \
    init.vendor.sensors.rc \
    init.mmi.usb.rc \
    init.qcom.usb.rc \
    init.qcom.rc \
    init.target.rc \
    init.mmi.rc \
    init.qti.ufs.rc \
    init.mmi.diag.rc \
    init.mmi.tcmd.rc \
    init.mmi.wlan.rc \
    init.mmi.debug.rc \
    init.mmi.sensor.rc \
    init.mmi.chipset.rc \
    init.mmi.overlay.rc \
    init.qcom.factory.rc \
    init.mmi.diag_mdlog.rc \
    init.mmi.charge_only.rc 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Configstore
PRODUCT_PACKAGES += \
    disable_configstore \
    capabilityconfigstoretest \

# Cryptfshw
PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0.vendor \
    liboemcrypto \
    uncrypt \
    libcrypto \
    libcrypto \
    libcrypto_utils

# Dependencies
PRODUCT_PACKAGES += \
    libavservices_minijail.vendor \
    libavservices_minijail \
    libhwbinder.vendor
# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.graphics.composer@2.1-resources \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.allocator@3.0 \
    android.hardware.graphics.allocator@4.0 \
    android.hardware.graphics.bufferqueue@1.0 \
    android.hardware.graphics.bufferqueue@2.0 \
    android.hardware.graphics.common-V1-ndk_platform \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    libgralloc.qti \
    libgralloccore \
    libgrallocutils \
    libgralloctypes \
    gralloc.sm6150 \
    libdisplayconfig \
    libdisplayconfig.qti \
    libdisplayconfig.vendor \
    libqdMetaData \
    libqdMetaData.system \
    libtinyxml \
    libtinyxml2_1 \
    libvulkan \
    memtrack.sm6150 \
    android.hardware.memtrack@1.0-service \
    android.hardware.memtrack@1.0-impl \
    vendor.display.config@1.15.vendor \
    vendor.display.config@1.11 \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.0 \
    vendor.qti.hardware.display.mapperextensions@1.1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3-service.clearkey \
    android.hardware.drm@1.3-service.widevine

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    fastboot

# For config.fs
PRODUCT_PACKAGES += \
    fs_config_files \
    fs_config_dirs


# Fwk-detect
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti \
    libbatching \
    libgeofencing \
    libgnss \
    libgnsspps \
    libsynergy_loc_api

PRODUCT_PACKAGES += \
    apdr.conf \
    flp.conf \
    gnss_antenna_info.conf \
    gps.conf \
    izat.conf \
    lowi.conf \
    sap.conf \
    xtwifi.conf

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl:64 \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhwbinder

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-platform.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-platform.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-google-system.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-system.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.appdirectedsmsproxy.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.appdirectedsmsproxy.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.android.providers.partnerbookmarks.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.android.providers.partnerbookmarks.xml \
    $(LOCAL_PATH)/configs/com.motorola.actions.perdefs.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.actions.perdefs.xml \
    $(LOCAL_PATH)/configs/com.motorola.android.subsidyinst.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.android.subsidyinst.xml \
    $(LOCAL_PATH)/configs/com.motorola.appforecast.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.appforecast.xml \
    $(LOCAL_PATH)/configs/com.motorola.audiofx.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.audiofx.xml \
    $(LOCAL_PATH)/configs/com.motorola.camera3.content.ai.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.content.ai.xml \
    $(LOCAL_PATH)/configs/com.motorola.camera3.hanoip.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.hanoip.xml \
    $(LOCAL_PATH)/configs/com.motorola.camera3.lens.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.lens.xml \
    $(LOCAL_PATH)/configs/com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.xml \
    $(LOCAL_PATH)/configs/com.motorola.easyprefix.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.easyprefix.xml \
    $(LOCAL_PATH)/configs/com.motorola.faceunlock.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.faceunlock.xml \
    $(LOCAL_PATH)/configs/com.motorola.gamemode.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.gamemode.xml \
    $(LOCAL_PATH)/configs/com.motorola.help.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.help.xml \
    $(LOCAL_PATH)/configs/com.motorola.maya.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.maya.xml \
    $(LOCAL_PATH)/configs/com.motorola.motodisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.motodisplay.xml \
    $(LOCAL_PATH)/configs/com.motorola.moto-uirefresh.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.moto-uirefresh.xml \
    $(LOCAL_PATH)/configs/com.motorola.omadm.service.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.omadm.service.xml \
    $(LOCAL_PATH)/configs/com.motorola.photoeditor.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.photoeditor.xml \
    $(LOCAL_PATH)/configs/com.motorola \ftware.fmradioservice.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola \ftware.fmradioservice.xml \
    $(LOCAL_PATH)/configs/com.motorola \ftware.guideme.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola \ftware.guideme.xml \
    $(LOCAL_PATH)/configs/com.motorola.timeweatherwidget.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.timeweatherwidget.xml \
    $(LOCAL_PATH)/configs/com.nxp.mifare.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/configs/com.nxp.mifare.xml \
    $(LOCAL_PATH)/configs/qti.snapdragon.sdk.display.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/qti.snapdragon.sdk.display.xml \
    $(LOCAL_PATH)/configs/afw-com.facebook.appmanager.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/afw-com.facebook.appmanager.xml \
    $(LOCAL_PATH)/configs/afw-com.facebook.katana.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/afw-com.facebook.katana.xml \
    $(LOCAL_PATH)/configs/afw-com.facebook.system.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/afw-com.facebook.system.xml \
    $(LOCAL_PATH)/configs/afw-com.google.android.apps.messaging.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/afw-com.google.android.apps.messaging.xml \
    $(LOCAL_PATH)/configs/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.biometrics.face.xml \
    $(LOCAL_PATH)/configs/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/configs/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.nfc.uicc.xml \
    $(LOCAL_PATH)/configs/android.hardware.nfc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.nfc.xml \
    $(LOCAL_PATH)/configs/carriersettings.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/carriersettings.xml \
    $(LOCAL_PATH)/configs/com.android.settings.intelligence.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.android.settings.intelligence.xml \
    $(LOCAL_PATH)/configs/com.google.android.apps.carrier.carrier_wifi.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.apps.carrier.carrier_wifi.xml \
    $(LOCAL_PATH)/configs/com.google.android.apps.dialer.call_recording_audio.features.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.apps.dialer.call_recording_audio.features.xml \
    $(LOCAL_PATH)/configs/com.google.android.as.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.as.xml \
    $(LOCAL_PATH)/configs/com.google.android.dialer.support.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.dialer.support.xml \
    $(LOCAL_PATH)/configs/com.google.android.feature.AER_OPTIMIZED.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.feature.AER_OPTIMIZED.xml \
    $(LOCAL_PATH)/configs/com.google.android.feature.D2D_CABLE_MIGRATION_FEATURE.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.feature.D2D_CABLE_MIGRATION_FEATURE.xml \
    $(LOCAL_PATH)/configs/com.google.android.feature.PREMIER_TIER.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.feature.PREMIER_TIER.xml \
    $(LOCAL_PATH)/configs/com.google.android.feature.TURBO_PRELOAD.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.feature.TURBO_PRELOAD.xml \
    $(LOCAL_PATH)/configs/com.google.android.feature.ZERO_TOUCH.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.feature.ZERO_TOUCH.xml \
    $(LOCAL_PATH)/configs/com.google.preload_photos.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.preload_photos.xml \
    $(LOCAL_PATH)/configs/deviceowner-configuration-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/deviceowner-configuration-com.motorola.camera3.xml \
    $(LOCAL_PATH)/configs/feature-com.uros \ftware.goodspeed.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/feature-com.uros \ftware.goodspeed.xml \
    $(LOCAL_PATH)/configs/ims_ext_common.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/ims_ext_common.xml \
    $(LOCAL_PATH)/configs/privapp-permissions.com.facebook.system.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions.com.facebook.system.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-co.sitic.pp.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-co.sitic.pp.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.claroColombia.contenedor.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.claroColombia.contenedor.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.claroColombia.contenedorStub.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.claroColombia.contenedorStub.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.facebook.services.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.facebook.services.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.google.android.apps.pixelmigrate.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.google.android.apps.pixelmigrate.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.google.android.as.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.google.android.as.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.google.android.wfcactivation.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.google.android.wfcactivation.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.lenovo.lsf.user.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.lenovo.lsf.user.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.actions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.actions.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.android.provisioning.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.android.provisioning.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.att.phone.extensions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.att.phone.extensions.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.attvowifi.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.attvowifi.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.brapps.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.brapps.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.callredirectionservice.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.callredirectionservice.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.camera3.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.carrierconfig.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.carrierconfig.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.carriersettingsext.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.carriersettingsext.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.contacts.preloadcontacts.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.contacts.preloadcontacts.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.dynamicvolume.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.dynamicvolume.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.easyprefix.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.easyprefix.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.entitlement.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.entitlement.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.faceunlock.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.faceunlock.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.fmplayer.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.fmplayer.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.gamemode.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.gamemode.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.genie.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.genie.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.help.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.help.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.moto.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.moto.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.motodisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.motodisplay.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.omadm.service.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.omadm.service.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.omadm.vzw.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.omadm.vzw.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.settings.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.settings.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.telprov.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.telprov.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.vzw.pco.extensions.pcoreceiver.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.vzw.pco.extensions.pcoreceiver.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.payjoy.access.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.payjoy.access.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.qualcomm.qcrilmsgtunnel.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.qualcomm.qcrilmsgtunnel.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.telcel.contenedor.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.telcel.contenedor.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.uros \ftware.goodspeed.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.uros \ftware.goodspeed.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-google-comms-suite.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-comms-suite.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-google-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-product.xml \
    $(LOCAL_PATH)/configs/split-permissions-google.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/split-permissions-google.xml \
    $(LOCAL_PATH)/configs/telephony_product_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/telephony_product_privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/vendor.qti.hardware.data.connection-V1.0-java.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/vendor.qti.hardware.data.connection-V1.0-java.xml \
    $(LOCAL_PATH)/configs/vendor.qti.hardware.data.connection-V1.1-java.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/vendor.qti.hardware.data.connection-V1.1-java.xml 

# IMS
PRODUCT_PACKAGES += \
    ims-moto-libs

PRODUCT_BOOT_JARS += \
    ims-moto-libs \
    moto-ims-ext \
    moto-telephony \
    moto-checkin.jar \
    moto-settings.jar \
    moto-rcsmanager.jar \
    moto-core_services.jar \
    moto-echolocateapi.jar \

PRODUCT_SYSTEM_SERVER_JARS += \
    moto-ims-ext \
    moto-telephony

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    ipacm-diag \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# IPv6
PRODUCT_PACKAGES += \
    ethertypes \
    libebtc

# Lights
PRODUCT_PACKAGES += \
    motorola.hardware.light@1.0 \
    hw/lights.sm6150 \
    android.hardware.lights-qti.rc \
    hw/motorola.hardware.light@1.0-impl \
    motorola.hardware.light@1.0-service \
    android.hardware.lights-qti.xml \

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm \
    vendor.lineage.livedisplay@2.0-service-sysfs

# Media
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw \
    libOmxVdec \
    libstagefright_soft_hevcdec \
    libOmxVenc \
    libc2dcolorconvert

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_v1.xml \
    $(LOCAL_PATH)/configs/media_codecs_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_v2.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v2.xml \
    $(LOCAL_PATH)/configs/media_codecs_vendor_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v2.xml \
    $(LOCAL_PATH)/configs/media_codecs_vendor_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
    $(LOCAL_PATH)/configs/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/configs/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_kona.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml

# Misc
PRODUCT_PACKAGES += \
    libchrome \
    libchrome.vendor

# MotoActions
PRODUCT_PACKAGES += \
    MotoActions

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/netmgr_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/netmgr_config.xml

# OMX
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor \
    libavservices_minijail_vendor \
    libc2dcolorconvert \
    libcodec2_hidl@1.0 \
    libcodec2_hidl@1.0.vendor \
    libcodec2_vndk.vendor \
    libcodec2_hidl_client@1.1 \
    libOmxVpp \
    libOmxAacDec \
    libOmxAmrDec \
    libOmxCore \
    libOmxEvrcDec \
    libOmxG711Dec \
    libOmxQcelp13Dec \
    libOmxVdec \
    libOmxVenc 

#stagefright
PRODUCT_PACKAGES += \
    libstagefright \
    libstagefrighthw \
    libstagefright_omx \
    libstagefright_softomx \
    libstagefright_flacdec \
    libstagefright_httplive \
    libstagefright_codecbase \
    libstagefright_omx_utils \
    libstagefright_xmlparser \
    libstagefright_foundation \
    libstagefright_enc_common \
    libstagefright_soft_gsmdec \
    libstagefright_soft_aacdec \
    libstagefright_soft_aacenc \
    libstagefright_soft_amrdec \
    libstagefright_soft_avcdec \
    libstagefright_soft_avcenc \
    libstagefright_soft_mp3dec \
    libstagefright_soft_rawdec \
    libstagefright_soft_vpxdec \
    libstagefright_soft_vpxenc \
    libstagefright_amrnb_common \
    libstagefright_http_support \
    libstagefright_soft_flacdec \
    libstagefright_soft_flacenc \
    libstagefright_soft_g711dec \
    libstagefright_soft_hevcdec \
    libstagefright_soft_opusdec \
    libstagefright_soft_amrnbenc \
    libstagefright_soft_amrwbenc \
    libstagefright_soft_mpeg2dec \
    libstagefright_soft_mpeg4dec \
    libstagefright_soft_mpeg4enc \
    libstagefright_softomx_plugin \
    libstagefright_soft_vorbisdec \
    libstagefright_soft_qtiflacdec \
    libstagefright_bufferpool@2.0.1 \
    libstagefright_bufferqueue_helper \
    libstagefright_framecapture_utils 

# Perf
PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.2.vendor \
    vendor.qti.hardware.perf@2.2-service

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti \
    libpower \
    libpowermanager \
    android.hardware.power@1.3 \
    android.hardware.power-V1-cpp \

# system_ext permissions files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/afw-com.motorola.gesture.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/afw-com.motorola.gesture.xml \
    $(LOCAL_PATH)/configs/afw-com.motorola.systemui.desk.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/afw-com.motorola.systemui.desk.xml \
    $(LOCAL_PATH)/configs/afw-styles.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/afw-styles.xml \
    $(LOCAL_PATH)/configs/android.software.live_wallpaper.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/android.software.live_wallpaper.xml \
    $(LOCAL_PATH)/configs/audiosphere.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/audiosphere.xml \
    $(LOCAL_PATH)/configs/com.android.carrierconfig.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.android.carrierconfig.xml \
    $(LOCAL_PATH)/configs/com.android.emergency.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.android.emergency.xml \
    $(LOCAL_PATH)/configs/com.android.hotwordenrollment.common.util.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.android.hotwordenrollment.common.util.xml \
    $(LOCAL_PATH)/configs/com.android.settings.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.android.settings.xml \
    $(LOCAL_PATH)/configs/com.android.storagemanager.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.android.storagemanager.xml \
    $(LOCAL_PATH)/configs/com.android.systemui.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.android.systemui.xml \
    $(LOCAL_PATH)/configs/com.motorola.android.tcmd.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.android.tcmd.xml \
    $(LOCAL_PATH)/configs/com.motorola.androidx.camera.extensions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.androidx.camera.extensions.xml \
    $(LOCAL_PATH)/configs/com.motorola.camera.desktop.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.camera.desktop.xml \
    $(LOCAL_PATH)/configs/com.motorola.imager.access_V2.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.imager.access_V2.xml \
    $(LOCAL_PATH)/configs/com.motorola.imager.V2.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.imager.V2.xml \
    $(LOCAL_PATH)/configs/com.motorola.ims.cmadaptor.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.ims.cmadaptor.xml \
    $(LOCAL_PATH)/configs/com.motorola.launcher3.twoline.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.launcher3.twoline.xml \
    $(LOCAL_PATH)/configs/com.motorola.launcher3_feature.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.launcher3_feature.xml \
    $(LOCAL_PATH)/configs/com.motorola.libimgTuner.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.libimgTuner.xml \
    $(LOCAL_PATH)/configs/com.motorola.mobiledesktop.core.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.mobiledesktop.core.xml \
    $(LOCAL_PATH)/configs/com.motorola.msimsettings.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.msimsettings.xml \
    $(LOCAL_PATH)/configs/com.motorola.paks.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.paks.xml \
    $(LOCAL_PATH)/configs/com.motorola.permission.diag.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.permission.diag.xml \
    $(LOCAL_PATH)/configs/com.motorola.software.notification.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.software.notification.xml \
    $(LOCAL_PATH)/configs/com.motorola.software.sprint.hidden_menu.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.motorola.software.sprint.hidden_menu.xml \
    $(LOCAL_PATH)/configs/com.nxp.ls.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.nxp.ls.xml \
    $(LOCAL_PATH)/configs/com.nxp.mifare.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.nxp.mifare.xml \
    $(LOCAL_PATH)/configs/com.nxp.nfc.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.nxp.nfc.xml \
    $(LOCAL_PATH)/configs/com.qti.location.sdk.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.qti.location.sdk.xml \
    $(LOCAL_PATH)/configs/com.qualcomm.location.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.qualcomm.location.xml \
    $(LOCAL_PATH)/configs/com.qualcomm.qmapbridge.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.qualcomm.qmapbridge.xml \
    $(LOCAL_PATH)/configs/com.qualcomm.qti.imscmservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.qualcomm.qti.imscmservice.xml \
    $(LOCAL_PATH)/configs/com.qualcomm.qti.imscmservice-V2.0-java.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.qualcomm.qti.imscmservice-V2.0-java.xml \
    $(LOCAL_PATH)/configs/com.qualcomm.qti.imscmservice-V2.1-java.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.qualcomm.qti.imscmservice-V2.1-java.xml \
    $(LOCAL_PATH)/configs/com.qualcomm.qti.imscmservice-V2.2-java.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.qualcomm.qti.imscmservice-V2.2-java.xml \
    $(LOCAL_PATH)/configs/com.qualcomm.qti.izattools.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.qualcomm.qti.izattools.xml \
    $(LOCAL_PATH)/configs/com.st.android.nfc_extensions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.st.android.nfc_extensions.xml \
    $(LOCAL_PATH)/configs/com.verizon.os.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.verizon.os.xml \
    $(LOCAL_PATH)/configs/embms.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/embms.xml \
    $(LOCAL_PATH)/configs/embms-noship_product_privapp_permissions_qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/embms-noship_product_privapp_permissions_qti.xml \
    $(LOCAL_PATH)/configs/feature-com.motorola.motcameradesktop.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/feature-com.motorola.motcameradesktop.xml \
    $(LOCAL_PATH)/configs/feature-com.motorola.motolivewallpaper3.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/feature-com.motorola.motolivewallpaper3.xml \
    $(LOCAL_PATH)/configs/feature-permissions-com.summit.motorola.rcs.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/feature-permissions-com.summit.motorola.rcs.xml \
    $(LOCAL_PATH)/configs/izat.xt.srv.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/izat.xt.srv.xml \
    $(LOCAL_PATH)/configs/nexosSDK.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/nexosSDK.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.att.iqi.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.att.iqi.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.google.android.apps.wallpaper.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.google.android.apps.wallpaper.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.android.fota.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.android.fota.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.android.jvtcmd.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.android.jvtcmd.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.android.providers.chromehomepage.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.android.providers.chromehomepage.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.bach.modemstats.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.bach.modemstats.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.ccc.devicemanagement.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.ccc.devicemanagement.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.ccc.notificationQ.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.ccc.notificationQ.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.ccc.ota.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.ccc.ota.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.coresettingsext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.coresettingsext.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.demo.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.demo.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.gesture.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.gesture.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.hiddenmenuapp.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.hiddenmenuapp.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.imagertuning_V2.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.imagertuning_V2.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.iqimotmetrics.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.iqimotmetrics.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.launcher3.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.launcher3.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.lifetimedata.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.lifetimedata.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.mobiledesktop.core.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.mobiledesktop.core.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.motocare.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.motocare.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.motocit.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.motocit.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.msimsettings.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.msimsettings.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.paks.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.paks.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.rcsConfigService.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.rcsConfigService.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.setup.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.setup.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.systemui.desk.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.systemui.desk.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.motorola.wifi.motowifimetrics.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.motorola.wifi.motowifimetrics.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.qualcomm.atfwd.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.qualcomm.atfwd.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.qualcomm.location.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.qualcomm.location.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-com.summit.motorola.rcs.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-com.summit.motorola.rcs.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-google-system-ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-google-system-ext.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-styles.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/privapp-permissions-styles.xml \
    $(LOCAL_PATH)/configs/qcrilhook.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/qcrilhook.xml \
    $(LOCAL_PATH)/configs/qti_libpermissions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/qti_libpermissions.xml \
    $(LOCAL_PATH)/configs/qti_permissions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/qti_permissions.xml \
    $(LOCAL_PATH)/configs/qti_telephony_hidl_wrapper.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/qti_telephony_hidl_wrapper.xml \
    $(LOCAL_PATH)/configs/qti_telephony_utils.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/qti_telephony_utils.xml \
    $(LOCAL_PATH)/configs/RemoteSimlock.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/RemoteSimlock.xml \
    $(LOCAL_PATH)/configs/RemoteSimlockManager.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/RemoteSimlockManager.xml \
    $(LOCAL_PATH)/configs/telephonyservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/telephonyservice.xml \
    $(LOCAL_PATH)/configs/telephony_system-ext_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/telephony_system-ext_privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/UimGba.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/UimGba.xml \
    $(LOCAL_PATH)/configs/UimGbaManager.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/UimGbaManager.xml \
    $(LOCAL_PATH)/configs/UimService.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/UimService.xml \
    $(LOCAL_PATH)/configs/vendor.qti.data.factory-V1.0-java.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/vendor.qti.data.factory-V1.0-java.xml \
    $(LOCAL_PATH)/configs/vendor.qti.data.factory-V2.0-java.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/vendor.qti.data.factory-V2.0-java.xml \
    $(LOCAL_PATH)/configs/vendor.qti.ims.rcsconfig-V1.0-java.xm:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/vendor.qti.ims.rcsconfig-V1.0-java.xm 

# QMI
PRODUCT_PACKAGES += \
    libjson \
    libjsoncpp \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.va_aosp.support=1

PRODUCT_ODM_PROPERTIES += \
    ro.vendor.qti.va_odm.support=1

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.2 \
    android.hardware.radio.config@1.0 \
    android.hardware.secure_element@1.0 \
    libprotobuf-cpp-full \
    libprotobuf-cpp-full-3.9.1 \
    librmnetctl \
    libxml2

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Vendor libstdc++
PRODUCT_PACKAGES += \
    libstdc++.vendor

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/atfwd@2.0.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/atfwd@2.0.policy \
    $(LOCAL_PATH)/seccomp/codec2.vendor.base.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/codec2.vendor.base.policy \
    $(LOCAL_PATH)/seccomp/codec2.vendor.ext.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/codec2.vendor.ext.policy \
    $(LOCAL_PATH)/seccomp/imsrtp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/imsrtp.policy \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/qti-systemd.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/qti-systemd.policy \
    $(LOCAL_PATH)/seccomp/vendor.qti.hardware.dsp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/vendor.qti.hardware.dsp.policy

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti \
    thermal-engine \
    libthermalclient

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service \
    vendor.qti.hardware.trustedui@1.0-service-qti

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# VNDK
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := strict
PRODUCT_PRODUCT_VNDK_VERSION := 30

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwpa_client \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    libwifikeystorehalext \
    vendor.qti.hardware.wifi.hostapd@1.0.vendor \
    vendor.qti.hardware.wifi.hostapd@1.1.vendor \
    vendor.qti.hardware.wifi.supplicant@2.0.vendor \
    vendor.qti.hardware.wifi.supplicant@2.1.vendor \
    vendor.qti.hardware.wifi.supplicant@2.2.vendor \
    WifiOverlay \
    wpa_supplicant \
    wpa_supplicant.conf \
    wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/aoa_cldb_falcon.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/aoa_cldb_falcon.bin \
    $(LOCAL_PATH)/wifi/aoa_cldb_swl14.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/aoa_cldb_swl14.bin \
    $(LOCAL_PATH)/wifi/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf 

# WiFi Display
PRODUCT_PACKAGES += \
    libnlnetmgr \
    libwfds 

PRODUCT_BOOT_JARS += \
    WfdCommon