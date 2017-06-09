# Inherit common DND stuff
$(call inherit-product, vendor/dnd/config/common_full.mk)

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME

# Include CM LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/dnd/overlay/dictionaries

$(call inherit-product, vendor/dnd/config/telephony.mk)
