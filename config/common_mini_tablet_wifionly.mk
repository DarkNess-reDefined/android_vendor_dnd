# Inherit common DND stuff
$(call inherit-product, vendor/dnd/config/common_mini.mk)

# Required DND packages
PRODUCT_PACKAGES += \
    LatinIME
