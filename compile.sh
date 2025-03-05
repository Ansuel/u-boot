#!/bin/sh

CROSS_COMPILE=aarch64-linux-gnu- make -j12

~/openwrt-ansuel/staging_dir/host/bin/lzma e u-boot.bin /home/ansuel/arm-trusted-firmware/u-boot.bin.lzma

cd /home/ansuel/arm-trusted-firmware

make MBEDTLS_DIR=/home/ansuel/mbedtls GENBERATE_COT=0 PLAT=en7523 ARCH=aarch32 AARCH_32_INSTRUCTION_SET=A32 BL1=bl1.bin BL2=bl2.bin BL31=bl31.lzma BL33=u-boot.bin.lzma fip

cp build/en7523/release/tcboot.bin ~/SNANDer/build/
