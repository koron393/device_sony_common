# Copyright (C) 2014 The Android Open Source Project
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

# Common path
COMMON_PATH := device/sony/common

# Vendor
BOARD_VENDOR := sony

# QCOM Hardware --This is CAF--
BOARD_USES_QCOM_HARDWARE := true
SONY_BF64_KERNEL_VARIANT := true

# Overlay
ifneq ($(BOARD_HAVE_RADIO),false)
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-radio
    $(call inherit-product, $(COMMON_PATH)/radio.mk)
else
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-wifionly
endif

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# DataServices
DEVICE_SPECIFIC_DATASERVICES := hardware/sony/dataservices
USE_DEVICE_SPECIFIC_DATASERVICES := true

# CM Hardware
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += hardware/cyanogen/cmhw
BOARD_HARDWARE_CLASS += $(COMMON_PATH)/cmhw
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# CM Packages
PRODUCT_PACKAGES += \
    Gello

# Audio
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_WMA_OFFLOAD := true
AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
USE_CUSTOM_AUDIO_POLICY := 1

# Audio configs
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/vendor/etc/audio_effects_caf.conf:system/vendor/etc/audio_effects.conf \
    $(COMMON_PATH)/rootdir/system/vendor/lib/soundfx/libqcbassboost.so:system/vendor/lib/soundfx/libqcbassboost.so \
    $(COMMON_PATH)/rootdir/system/vendor/lib/soundfx/libqcreverb.so:system/vendor/lib/soundfx/libqcreverb.so \
    $(COMMON_PATH)/rootdir/system/vendor/lib/soundfx/libqcvirt.so:system/vendor/lib/soundfx/libqcvirt.so

# Audio Packages
PRODUCT_PACKAGES += \
    audiod \
    libaudio-resampler

# Audio prop
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.buffer.size.kb=32 \
    audio.offload.gapless.enabled=true \
    audio.offload.pcm.16bit.enable=true \
    audio.offload.pcm.24bit.enable=true \
    audio.offload.video=true \
    av.streaming.offload.enable=true

# Camera
DEVICE_SPECIFIC_CAMERA_PATH := hardware/sony/camera

# Camera package
PRODUCT_PACKAGES += \
    Snap

# Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libI420colorconvert

# Media codecs (Omx)
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libdashplayer \
    libdivxdrmdecrypt

# Network
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# Lights HAL
TARGET_PROVIDES_LIBLIGHT := true

# Recovery
PRODUCT_PACKAGES += \
    init_sony \
    keycheck \
    toybox_static

# USB OTG prop
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.isUsbOtgEnabled=true

# SDCardFS
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Set default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb
