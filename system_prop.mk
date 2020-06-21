#
# System Properties for HDX
#

# QC Perf
ADDITIONAL_BUILD_PROPERTIES += \
	ro.vendor.extension_library=/vendor/lib/libqc-opt.so
	
# Common build.props
ADDITIONAL_BUILD_PROPERTIES += \
	ro.chipname=msm8974 \
	ro.sf.lcd_density=320 \
	ro.opengles.version=196608 \
	persist.timed.enable=true \
	keyguard.no_require_sim=true \
	lockscreen.rot_override=true

# Radio props
ADDITIONAL_BUILD_PROPERTIES += \
	rild.libpath=/vendor/lib/libril-lab126qmi.so \
	ril.subscription.types=NV,RUIM \
	persist.rild.nitz_plmn="" \
	persist.rild.nitz_long_ons_0="" \
	persist.rild.nitz_long_ons_1="" \
	persist.rild.nitz_long_ons_2="" \
	persist.rild.nitz_long_ons_3="" \
	persist.rild.nitz_short_ons_0="" \
	persist.rild.nitz_short_ons_1="" \
	persist.rild.nitz_short_ons_2="" \
	persist.rild.nitz_short_ons_3="" \
	DEVICE_PROVISIONED=1 \
	ro.telephony.default_network=9

# Bluetooth props
ADDITIONAL_BUILD_PROPERTIES += \
	bluetooth.hfp.client=1 \
	qcom.bluetooth.soc=ath3k \
	ro.bluetooth.hfp.ver=1.6 \
	ro.qualcomm.bt.hci_transport=smd \
	ro.bluetooth.dun=false \
	ro.bluetooth.sap=false \
	ro.qualcomm.bluetooth.ftp=true \
	ro.qualcomm.bluetooth.hfp=false \
	ro.qualcomm.bluetooth.hsp=false \
	ro.qualcomm.bluetooth.map=false \
	ro.qualcomm.bluetooth.nap=false \
	ro.qualcomm.bluetooth.opp=true \
	ro.qualcomm.bluetooth.pbap=true

# enable graphics debugging
ADDITIONAL_BUILD_PROPERTIES += \
	debug.sf.hw=1 \
	debug.egl.hw=1 \
	persist.hwc.mdpcomp.enable=true \
	debug.mdpcomp.logs=0 

# new props test
ADDITIONAL_BUILD_PROPERTIES += \
	debug.composition.type=c2d \
	sys.hwc.gpu_perf_mode=1 \
	dev.pm.dyn_samplingrate=1 \
	persist.demo.hdmirotationlock=false \
	ro.hdmi.enable=true \
	ro.use_data_netmgrd=true \
	persist.data.netmgrd.qos.enable=true \
	ro.data.large_tcp_window_size=true \
	persist.timed.enable=true \
	ro.qualcomm.cabl=1 \
	telephony.lteOnCdmaDevice=0 \
	persist.fuse_sdcard=true \
	ro.qc.sdk.sensors.gestures=true \
	ro.qc.sdk.gestures.camera=false \
	ro.qc.sdk.camera.facialproc=false \
	ro.qcom.ad.calib.data=/vendor/etc/ad_calib.cfg \
	persist.debug.wfd.enable=1 \
	persist.sys.wfd.virtual=0 \
	ro.usb.vid=1949 \
	persist.sys.usb.config=mtp,adb \
	com.msm_enhancement=true \
	ro.wifi.standby.dtim=3 \
	ro.recovery.wl.maxstore=524288 \
	ro.ril.usb.port.serial=ttyUSB \
	ro.ril.usb.port.qmi=qmi_usb \
	ro.ril.usb.port.rmnet=rmnet_usb \
	telephony.sms.receive=true \
	keyguard.ori.timeout=350

# audio/media props
ADDITIONAL_BUILD_PROPERTIES += \
	media.aac_51_output_enabled=true \
	vidc.debug.level=1 \
	persist.audio.fluence.voicecall=true \
	audio.offload.buffer.size.kb=32 \
	av.offload.enable=true \
	media.stagefright.legacyencoder=true \
	media.stagefright.less-secure=true
