#!/bin/bash
export ARM_ROOT=/data/dev_tools/android-ndk/android-ndk-r8b
export ARM_INC=$ARM_ROOT/platforms/android-14/arch-arm/usr/include/
export ARM_LIB=$ARM_ROOT/platforms/android-14/arch-arm/usr/lib/
export ARM_TOOL=$ARM_ROOT/toolchains/arm-linux-androideabi-4.6/prebuilt/darwin-x86
export ARM_LIBO=$ARM_TOOL/lib/gcc/arm-linux-androideabi/4.6.x-google
export PATH=$ARM_TOOL/bin:$PATH
export ARM_PRE=$ARM_TOOL/bin/arm-linux-androideabi-
export PLATFORM=$ARM_ROOT/platforms/android-14/arch-arm

echo $ARM_PRE


./configure --prefix=~/Desktop/arm_and \
	        --disable-gpac \
		--enable-static \
		        --extra-cflags=" -I$ARM_INC -fPIC -DANDROID -fpic -mthumb-interwork -ffunction-sections -funwind-tables -fstack-protector -fno-short-enums -D__ARM_ARCH_5__ -D__ARM_ARCH_5T__ -D__ARM_ARCH_5E__ -D__ARM_ARCH_5TE__  -Wno-psabi -march=armv5te -mtune=xscale -msoft-float -mthumb -Os -fomit-frame-pointer -fno-strict-aliasing -finline-limit=64 -DANDROID  -Wa,--noexecstack -MMD -MP " \
	        --extra-ldflags="  -nostdlib -Bdynamic  -Wl,--no-undefined -Wl,-z,noexecstack  -Wl,-z,nocopyreloc -Wl,-soname,/system/lib/libz.so -Wl,-rpath-link=$ARM_LIB,-dynamic-linker=/system/bin/linker -L$ARM_LIB -nostdlib $ARM_LIB/crtbegin_dynamic.o $ARM_LIB/crtend_android.o -lc -lm -ldl -lgcc  " \
	        --cross-prefix=$ARM_PRE --disable-asm --disable-thread  --host=arm-linux --sysroot=$PLATFORM\
