#!/bin/bash

export ARCH=arm
export CROSS_COMPILE="/home/ultimatum163/nx507j_dev/NX505J_kernel/toolchain-linaro/bin/arm-cortex_a15-linux-gnueabihf-"


make nx507j_defconfig
make -j4

make INSTALL_MOD_STRIP=--strip-unneeded INSTALL_MOD_PATH=out/system INSTALL_MOD_DIR=out/system android_modules_install

./dtbToolCM --force-v2 -o ./out/dt.img -s 2048 -p ./scripts/dtc/ ./arch/arm/boot/

cp ./arch/arm/boot/zImage ./out/zImage

