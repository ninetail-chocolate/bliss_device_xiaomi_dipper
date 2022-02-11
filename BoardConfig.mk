#
# Copyright (C) 2018-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm845-common
-include device/xiaomi/sdm845-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/dipper

# Assert
TARGET_OTA_ASSERT_DEVICE := dipper

# Display
TARGET_USES_COLOR_METADATA := true
TARGET_SCREEN_DENSITY := 440

# Kernel
TARGET_KERNEL_SOURCE := kernel/xiaomi/sdm845
#TARGET_KERNEL_CONFIG := canting-dipper_defconfig
TARGET_KERNEL_CONFIG := dipper_defconfig
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
TARGET_KERNEL_CLANG_VERSION := prelude
KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-prelude/bin

KERNEL_SUPPORTS_LLVM_TOOLS := true
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-gnu-

KERNEL_LD := LD=ld.lld
KERNEL_AR := AR=llvm-ar
KERNEL_OBJCOPY := OBJCOPY=llvm-objcopy
KERNEL_OBJDUMP := OBJDUMP=llvm-objdump
KERNEL_NM := NM=llvm-nm
KERNEL_STRIP := STRIP=llvm-strip

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USES_METADATA_PARTITION := true

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Inherit from the proprietary version
-include vendor/xiaomi/dipper/BoardConfigVendor.mk
