# Inherit common DND stuff
$(call inherit-product, vendor/dnd/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    SoundRecorder
