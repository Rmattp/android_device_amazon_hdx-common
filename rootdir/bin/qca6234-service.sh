#!/system/bin/sh
# Copyright (c) 2010-2014, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above
#      copyright notice, this list of conditions and the following
#      disclaimer in the documentation and/or other materials provided
#      with the distribution.
#    * Neither the name of The Linux Foundation nor the names of its
#      contributors may be used to endorse or promote products derived
#      from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Check whether device is plugged on the HSIC bus
# Currently HSIC bus will be the first index

PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

deviceprop=`getprop ro.baseband`
boardprop=`getprop ro.board.platform`

if [ -e /sys/bus/platform/drivers/msm_hsic_host ]; then
    if [ ! -L /sys/bus/usb/devices/1-1 ]; then
        echo msm_hsic_host > /sys/bus/platform/drivers/msm_hsic_host/unbind
    fi

    chown -h system.system /sys/bus/platform/drivers/msm_hsic_host/bind
    chown -h system.system /sys/bus/platform/drivers/msm_hsic_host/unbind
    chmod -h 0200 /sys/bus/platform/drivers/msm_hsic_host/bind
    chmod -h 0200 /sys/bus/platform/drivers/msm_hsic_host/unbind
fi

wlanchip=""

if [ "$deviceprop" == "apq" ]; then
    case "$boardprop" in
      "msm8974"|"msm8960")
        wlanchip="AR6004-USB"
      ;;
    esac
fi

# force ar6004 is ar6004_wlan.conf existed.
if [ -f /system/vendor/firmware/ath6k/AR6004/ar6004_wlan.conf ]; then
    wlanchip=`cat /system/vendor/firmware/ath6k/AR6004/ar6004_wlan.conf`
fi

echo "The WLAN Chip ID is $wlanchip"
if [ "$wlanchip" == "AR6004-USB" ]; then
    echo msm_hsic_host > /sys/bus/platform/drivers/msm_hsic_host/unbind
    setprop wlan.driver.ath 2
    setprop qcom.bluetooth.soc ath3k
    setprop wlan.driver.name /system/vendor/lib/modules/wlan.ko
    setprop wlan.supp.template /system/vendor/etc/wifi/wpa_supplicant_ath6kl.conf
    btsoc="ath3k"

    # remove bt_restart
    rm /data/connectivity/bt_restart
fi
