$(call inherit-product, vendor/dnd/config/common_mini.mk)

# Required DND packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/dnd/config/telephony.mk)
