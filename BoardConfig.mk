# Copyright 2019 The Android Open Source Project
# Copyright 2019 Paranoid Android
# Copyright 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BOARD_VENDOR := xiaomi

DEVICE_PATH := device/xiaomi/raphael

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a76

# Assert
TARGET_OTA_ASSERT_DEVICE := raphael,raphaelin

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msmnile
TARGET_NO_BOOTLOADER := true

# Build
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

# Display
TARGET_SCREEN_DENSITY := 440

# Gestures
TARGET_TAP_TO_WAKE_EVENT_NODE := "/dev/input/event3"

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs

# FM
BOARD_HAVE_QCOM_FM := true

# FOD
TARGET_SURFACEFLINGER_FOD_LIB := \
    //$(DEVICE_PATH):libudfps_extension.xiaomi_raphael
TARGET_USES_FOD_ZPOS := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/xiaomi_vendor_framework_compatibility_matrix.xml \
    vendor/qcom/opensource/core-utils/vendor_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE := \
    $(DEVICE_PATH)/vintf/manifest.xml \
    $(DEVICE_PATH)/vintf/xiaomi_manifest.xml

DEVICE_MATRIX_FILE += \
    device/qcom/common/compatibility_matrix.xml

ODM_MANIFEST_FILES += \
    $(DEVICE_PATH)/vintf/manifest-qva.xml

ODM_MANIFEST_SKUS += raphael
ODM_MANIFEST_RAPHAEL_FILES := \
    $(DEVICE_PATH)/vintf/manifest-nfc.xml

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xa90000
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += androidboot.vbmeta.avb_version=1.0
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += kpti=off
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/xiaomi/raphael
KERNEL_DEFCONFIG := raphael_defconfig
#Disable appended dtb
TARGET_KERNEL_APPEND_DTB := true
# Set Header version for bootimage
ifneq ($(strip $(TARGET_KERNEL_APPEND_DTB)),true)
#Enable dtb in boot image and Set Header version
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOTIMG_HEADER_VERSION := 2
else
BOARD_BOOTIMG_HEADER_VERSION := 1
endif
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
#Generate DTBO image
BOARD_KERNEL_SEPARATED_DTBO := true
ifeq ($(BOARD_KERNEL_SEPARATED_DTBO),true)
    # Enable DTBO for recovery image
    BOARD_INCLUDE_RECOVERY_DTBO := true
endif

# Keystore
TARGET_PROVIDES_KEYMASTER := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partition (Boot)
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_FLASH_BLOCK_SIZE := 262144 #(BOARD_KERNEL_PAGESIZE * 64)

# Partition (Cache)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Partition (Dtbo)
BOARD_DTBOIMG_PARTITION_SIZE := 0x0800000

# Partition (Recovery)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864

# Partition (System)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3599228928
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4

# Partition (Userdata)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57453555712
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

# Partition (Vendor)
BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Partition (SystemAsRoot, Metadata)
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_METADATA_PARTITION := true

# Partition (Userimages)
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

TARGET_USES_MKE2FS := true

# Platform
TARGET_BOARD_PLATFORM := msmnile

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 120

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Security
VENDOR_SECURITY_PATCH := 2021-05-01

# Sensors
USE_SENSOR_MULTI_HAL := true

# Sepolicy
include device/xiaomi/raphael-sepolicy/raphael-sepolicy.mk

# Vendor init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_raphael
TARGET_RECOVERY_DEVICE_MODULES := libinit_raphael

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Enable recovery AVB verification
ifeq ($(wildcard $(PROD_CERTS)/pa_security.mk),)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
else
BOARD_AVB_RECOVERY_KEY_PATH := $(PROD_CERTS)/pa_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
endif
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# VNDK
BOARD_VNDK_VERSION := current

# WLAN
WIFI_HIDL_FEATURE_AWARE := false

# Inherit from the proprietary version
include vendor/xiaomi/raphael/BoardConfigVendor.mk
