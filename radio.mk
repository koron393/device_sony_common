# LTE, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnGsmDevice=1 \
    persist.radio.oem_socket=true \
    persist.radio.data_no_toggle=1 \
    persist.radio.calls.on.ims=0

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    ril.subscription.types=NV,RUIM
