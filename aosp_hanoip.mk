#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from hanoip device
$(call inherit-product, device/motorola/hanoip/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := aosp_hanoip
PRODUCT_DEVICE := hanoip
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g(40) fusion
PRODUCT_MANUFACTURER := motorola

PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Build info
BUILD_FINGERPRINT := "motorola/hanoip_retail/hanoip:11/RRI31.Q1-42-48/222fd:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hanoip_retail \
    PRIVATE_BUILD_DESC="hanoip_retail-user 11 RRI31.Q1-42-48 222fd release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-motorola
