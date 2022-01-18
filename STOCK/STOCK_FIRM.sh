#!/bin/bash

printf "Motorola G9 Play GUAMP Stock Firmware Script\n\n"
printf "Make sure to have your device is fastboot mode before executing this script"
echo "I AM NOT RESPOSIBLE FOR ANY BRICKED DEVICES OR ANY OTHER DAMAGE THAT RUNNING THIS SCRIPT MAY/COULD CAUSE."
read -p "If you agree, please type 'continue' in order for the script to continue, if you wish to exit type anything else and script will close" USER_AGREEMENT
echo ""

if [[ $USER_AGREEMENT == "continue" ]]; then
	echo "Script will start now... Please wait while your device is being flashed"
	fastboot flash partition gpt.bin
	fastboot flash bootloader bootloader.img
	fastboot flash vbmeta vbmeta.img
	fastboot flash radio radio.img
	fastboot flash bluetooth BTFM.bin
	fastboot flash dsp dspso.bin
	fastboot flash logo logo.bin
	fastboot flash boot boot.img
	fastboot flash dtbo dtbo.img
	fastboot flash recovery recovery.img
	fastboot flash super super.img_sparsechunk.0	
	fastboot flash super super.img_sparsechunk.1
	fastboot flash super super.img_sparsechunk.2
	fastboot flash super super.img_sparsechunk.3
	fastboot flash super super.img_sparsechunk.4
	fastboot flash super super.img_sparsechunk.5
	fastboot flash super super.img_sparsechunk.6
	fastboot flash super super.img_sparsechunk.7
	fastboot flash super super.img_sparsechunk.8
	fastboot flash super super.img_sparsechunk.9
	fastboot flash super super.img_sparsechunk.10
	fastboot flash super super.img_sparsechunk.11
	fastboot flash super super.img_sparsechunk.12
	fastboot flash super super.img_sparsechunk.13
	fastboot flash super super.img_sparsechunk.14
	fastboot flash super super.img_sparsechunk.15
	fastboot flash super super.img_sparsechunk.16
	fastboot erase carrier
	fastboot erase userdata
	fastboot erase metadata
	fastboot erase ddr
	fastboot oem fb_mode_clear
	echo "Done"
else
	exit 0
fi 

read -p "Do you wish to reboot your device?" REBOOT
echo ""

if [[ $REBOOT == "yes" ]]; then
	fastboot reboot
else
	read -p "Ok, Do you wish to install custom recovery? [TWRP]" TWRP
	echo ""
fi 

if [[ $TWRP == "yes" ]]; then
  git clone https://github.com/GSCConnect/Motorola_G9_GUAMP
  cd Motorola_G9_GUAMP/TWRP
  fastboot flash recovery twrp_3.6.1.img
  fastboot boot twrp_3.6.1.img
fi


exit 0
