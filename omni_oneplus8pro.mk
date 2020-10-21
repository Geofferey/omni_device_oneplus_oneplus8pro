# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

VENDOR_EXCEPTION_PATHS := oneplus \
    omni

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_PRODUCT_IMAGE  := true
PRODUCT_BUILD_SYSTEM_EXT_IMAGE  := true
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
PRODUCT_BUILD_ODM_IMAGE := false

BOARD_SUPER_PARTITION_SIZE := 15032385536
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 7511998464
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
#TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# enable to generate super_empy.img if needed to wipe super partition table
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST += \
    vendor \
    odm

BOARD_EXT4_SHARE_DUP_BLOCKS := true
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

PRODUCT_BUILD_RAMDISK_IMAGE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
TARGET_NO_RECOVERY := false
TARGET_NO_RADIOIMAGE := false
BOARD_INCLUDE_RECOVERY_DTBO = true
BOARD_BUILD_RETROFIT_DYNAMIC_PARTITIONS_OTA_PACKAGE := false
BOARD_USES_RECOVERY_AS_BOOT := false

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p
AB_OTA_UPDATER := true

DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus8pro/overlay/device
DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus8pro/overlay/common
DEVICE_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

$(call inherit-product, device/oneplus/oneplus8pro/qssi_whitelist.mk)
# Inherit from our custom product configuration
$(call inherit-product, device/oneplus/oneplus8pro/avb.mk)
$(call inherit-product, vendor/omni/config/common.mk)

# get the rest of aosp stuff after ours
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system_arm64.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/oneplus8pro/device.mk)

ALLOW_MISSING_DEPENDENCIES := true

PRODUCT_SHIPPING_API_LEVEL := 29

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_oneplus8pro
PRODUCT_DEVICE := oneplus8pro
PRODUCT_BRAND := OnePlus
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := IN2023 

TARGET_DEVICE := OnePlus8Pro
PRODUCT_SYSTEM_NAME := OnePlus8Pro

VENDOR_RELEASE := 11/RP1A.201005.001/2009301800:user/release-keys
BUILD_FINGERPRINT := OnePlus/OnePlus8Pro_EEA/OnePlus8Pro:$(VENDOR_RELEASE)
OMNI_BUILD_FINGERPRINT := OnePlus/OnePlus8Pro_EEA/OnePlus8Pro:$(VENDOR_RELEASE)
OMNI_PRIVATE_BUILD_DESC := "'OnePlus8Pro-user 11 RP1A.201005.001 2009301800'"

PLATFORM_SECURITY_PATCH_OVERRIDE := 2020-09-01

TARGET_VENDOR := oneplus

PRODUCT_ADB_KEYS := device/oneplus/oneplus7tpro/adbkey.pub

PRODUCT_ENFORCE_RRO_TARGETS :=
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS := framework-res
PRODUCT_ENFORCE_RRO_EXEMPTED_TARGETS := vendor

DISABLE_ARTIFACT_PATH_REQUIREMENTS := true
$(call inherit-product, device/oneplus/oneplus8pro/qssi_whitelist.mk)

$(call inherit-product, vendor/oneplus/oneplus8pro/oneplus8pro-vendor.mk)
