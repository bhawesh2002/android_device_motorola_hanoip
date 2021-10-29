#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/motorola/haniop/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_haniop
PRODUCT_DEVICE := hanniop
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto g(40) fusion
PRODUCT_MANUFACTURER := motorola
