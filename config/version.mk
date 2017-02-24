#
# Copyright (C) 2017 DarkNess reDefined
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

# DarkNess reDefined Versioning
DND_VERSION = v1.1


ifeq ($(DND_BUILDTYPE), OFFICIAL)
PRODUCT_PACKAGES += \
    SlimOTA
endif

ifndef DND_BUILD_TYPE
    DND_BUILD_TYPE := UNOFFICIAL
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
endif

ifneq ($(DND_BUILD_TYPE),)
DND_MOD_VERSION := DND-$(DND_VERSION)-$(shell date -u +%Y%m%d-%H%M)-$(DND_BUILD_TYPE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.dnd.version=$(DND_VERSION) \
  ro.dnd.releasetype=$(DND_BUILD_TYPE) \
  ro.mod.version=$(DND_BUILD_TYPE)-$(DND_VERSION)

DND_DISPLAY_VERSION := $(DND_MOD_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.dnd.display.version=$(DND_DISPLAY_VERSION)
