$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/galaxygio/galaxygio-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/galaxygio/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/galaxygio/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Copy Samsung fsr / rfs modules.
PRODUCT_COPY_FILES += \
    device/samsung/galaxygio/prebuilt/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/galaxygio/prebuilt/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/galaxygio/prebuilt/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/galaxygio/prebuilt/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/galaxygio/prebuilt/sec_param.ko:root/lib/modules/sec_param.ko

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_galaxygio
PRODUCT_DEVICE := galaxygio
