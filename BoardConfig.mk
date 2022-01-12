#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Display density
TARGET_SCREEN_DENSITY := 400

#Path to device
DEVICE_PATH := device/motorola/hanoip

# Platform
TARGET_BOARD_PLATFORM := sm7150
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true
BUILD_BROKEN_DUP_RULES := true
QCOM_BOARD_PLATFORMS += sm7150


# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a76


# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Init
TARGET_INIT_VENDOR_LIB := libinit_hanoip
TARGET_RECOVERY_DEVICE_MODULES := libinit_hanoip

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

ODM_MANIFEST_SKUS += \
    hanoip

ODM_MANIFEST_HANOIP_FILES := $(DEVICE_PATH)/manifest_hanoip.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
TARGET_KERNEL_CONFIG := vendor/lineage_hanoip_defconfig

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618

# Verified Boot
BOARD_AVB_VBMETA_SYSTEM := system product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Inherit from the proprietary version
-include vendor/motorola/hanoip/BoardConfigVendor.mk
