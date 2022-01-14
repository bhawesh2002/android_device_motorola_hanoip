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
    snapshotctl \

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
    vendor.qti.hardware.data.cne.internal.constants@1.0 \

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
    init.mmi.charge_only.rc \

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
    $(LOCAL_PATH)/configs/com.motorola.software.fmradioservice.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.software.fmradioservice.xml \
    $(LOCAL_PATH)/configs/com.motorola.software.guideme.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.software.guideme.xml \
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
    $(LOCAL_PATH)/configs/feature-com.uros.software.goodspeed.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/feature-com.uros.software.goodspeed.xml \
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
    $(LOCAL_PATH)/configs/privapp-permissions-com.uros.software.goodspeed.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.uros.software.goodspeed.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-google-comms-suite.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-comms-suite.xml \
    $(LOCAL_PATH)/configs/privapp-permissions-google-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-product.xml \
    $(LOCAL_PATH)/configs/split-permissions-google.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/split-permissions-google.xml \
    $(LOCAL_PATH)/configs/telephony_product_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/telephony_product_privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/vendor.qti.hardware.data.connection-V1.0-java.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/vendor.qti.hardware.data.connection-V1.0-java.xml \
    $(LOCAL_PATH)/configs/vendor.qti.hardware.data.connection-V1.1-java.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/vendor.qti.hardware.data.connection-V1.1-java.xml \

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
