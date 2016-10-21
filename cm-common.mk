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

# Vendor
BOARD_VENDOR := sony

# QCOM Hardware --This is CAF--
BOARD_USES_QCOM_HARDWARE := true
SONY_BF64_KERNEL_VARIANT := true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# CM Packages
PRODUCT_PACKAGES += \
    Gello

# Camera package
PRODUCT_PACKAGES += \
    Snap

# Some functional extras
$(call inherit-product-if-exists, vendor/qcom/proprietary/proprietary.mk)
