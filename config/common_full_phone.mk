# Inherit full common Darkness-Redefined stuff
$(call inherit-product, vendor/dnd/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/dnd/overlay/dictionaries

$(call inherit-product, vendor/dnd/config/telephony.mk)
