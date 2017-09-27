PRODUCT_BRAND ?= DarkNess-reDefined

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/dnd/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/dnd/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/dnd/prebuilt/common/bin/50-dnd.sh:system/addon.d/50-dnd.sh \
    vendor/dnd/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/dnd/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Lineage-specific broadcast actions whitelist
PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/lineage-sysconfig.xml:system/etc/sysconfig/lineage-sysconfig.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/dnd/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/dnd/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/dnd/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/dnd/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Copy all DND-specific init rc files
$(foreach f,$(wildcard vendor/dnd/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/dnd/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is Lineage-Based!
PRODUCT_COPY_FILES += \
    vendor/dnd/config/permissions/org.lineageos.android.xml:system/etc/permissions/org.lineageos.android.xml \
    vendor/dnd/config/permissions/privapp-permissions-lineage.xml:system/etc/permissions/privapp-permissions-lineage.xml

# Include Darkness-Redefined audio files
include vendor/dnd/config/dnd_audio.mk

ifneq ($(TARGET_DISABLE_LINEAGE_SDK), true)
# Lineage SDK
include vendor/dnd/config/lineage_sdk_common.mk
endif

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/dnd/config/twrp.mk
endif

# Bootanimation
$(call inherit-product, vendor/dnd/prebuilt/common/bootanimation/bootanimation.mk)

# Required base packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    CMAudioService \
    LineageParts \
    Development \
    Profiles \
    WeatherManagerService \
    CMSettingsProvider \
    ExactCalculator \
    LockClock \
    WallpaperPicker \
    WeatherProvider

# Optional packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker \
    PhotoTable \
    Terminal

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# DarkNess-reDefined packages
PRODUCT_PACKAGES += \
    Gallery2 \
    ViaBrowser \
    DarknessHub \
    Launcher3 \
    Turbo

# Themes
PRODUCT_PACKAGES += \
    PixelTheme \
    Stock

# Charging sounds
PRODUCT_COPY_FILES += \
    vendor/dnd/google/effects/BatteryPlugged.ogg:system/media/audio/ui/BatteryPlugged.ogg \
    vendor/dnd/google/effects/BatteryPlugged_48k.ogg:system/media/audio/ui/BatteryPlugged_48k.ogg

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/dnd/prebuilt/common/media/LMspeed_508.emd:system/media/LMspeed_508.emd \
    vendor/dnd/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in Lineage
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Custom off-mode charger
ifneq ($(WITH_LINEAGE_CHARGER),false)
PRODUCT_PACKAGES += \
    charger_res_images \
    lineage_charger_res_images \
    font_log.png \
    libhealthd.lineage
endif

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank

# Conditionally build in su
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

DEVICE_PACKAGE_OVERLAYS += vendor/dnd/overlay/common

-include vendor/dnd/config/version.mk
-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/dnd/config/partner_gms.mk
-include vendor/cyngn/product.mk

$(call inherit-product, vendor/dnd/config/dnd_props.mk)
$(call prepend-product-if-exists, vendor/extra/product.mk)
