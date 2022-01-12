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

TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 androidboot.usbcontroller=a600000.dwc3 earlycon=msm_geni_serial,0x880000 loop.max_part=7 printk.devkmsg=on androidboot.hab.csv=5 androidboot.hab.product=hanoip androidboot.hab.cid=50 firmware_class.path=/vendor/firmware_mnt/image buildvariant=user
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/motorola/hanoip
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := r416183c1
TARGET_KERNEL_ADDITIONAL_FLAGS := LLVM=1

# Kernel modules - Audio
TARGET_MODULE_ALIASES += \
 adsp_loader_dlkm.ko:audio_adsp_loader.ko \
 apr_dlkm.ko:audio_apr.ko \
 bolero_cdc_dlkm.ko:audio_bolero_cdc.ko \
 hdmi_dlkm.ko:audio_hdmi.ko \
 machine_talos_dlkm.ko:audio_machine_talos.ko \
 mbhc_dlkm.ko:audio_mbhc.ko \
 native_dlkm.ko:audio_native.ko \
 pinctrl_lpi_dlkm.ko:audio_pinctrl_lpi.ko \
 pinctrl_wcd_dlkm.ko:audio_pinctrl_wcd.ko \
 platform_dlkm.ko:audio_platform.ko \
 q6_dlkm.ko:audio_q6.ko \
 q6_notifier_dlkm.ko:audio_q6_notifier.ko \
 q6_pdr_dlkm.ko:audio_q6_pdr.ko \
 rx_macro_dlkm.ko:audio_rx_macro.ko \
 snd_event_dlkm.ko:audio_snd_event.ko \
 stub_dlkm.ko:audio_stub.ko \
 swr-dlkm.ko:audio_swr.ko \
 swr_ctrl_dlkm.ko:audio_swr_ctrl.ko \
 tx_macro_dlkm.ko:audio_tx_macro.ko \
 usf_dlkm.ko:audio_usf.ko \
 va_macro_dlkm.ko:audio_va_macro.ko \
 wcd9xxx_dlkm.ko:audio_wcd9xxx.ko \
 wcd934x-dlkm.ko:audio_wcd934x.ko \
 wcd937x_dlkm.ko:audio_wcd937x.ko \
 wcd937x_slave-dlkm.ko:audio_wcd937x_slave.ko \
 wcd_core_dlkm.ko:audio_wcd_core.ko \
 wcd_spi_dlkm.ko:audio_wcd_spi.ko \
 wglink_dlkm.ko:audio_wglink.ko \
 wsa881x_dlkm.ko:audio_wsa881x.ko \
 wsa_macro_dlkm.ko:audio_wsa_macro.ko \

# Kernel modules - WLAN
TARGET_MODULE_ALIASES += \
    wlan.ko:qca_cld3_wlan.ko

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Audio
AUDIO_FEATURE_ENABLED_A2DP_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AHAL_EXT := false
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1