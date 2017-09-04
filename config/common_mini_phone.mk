# Inherit mini common Darkness-Redefined stuff
$(call inherit-product, vendor/dnd/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/dnd/config/telephony.mk)
