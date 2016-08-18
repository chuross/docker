#!/bin/bash

ip=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}')
socat tcp-listen:$ANDROID_EMULATOR_PORT,bind=$ip,fork tcp:127.0.0.1:$ANDROID_EMULATOR_PORT &
socat tcp-listen:$ADB_PORT,bind=$ip,fork tcp:127.0.0.1:$ADB_PORT &

emulator64-arm -avd $ANDROID_EMULATOR_NAME \
                  -port $ANDROID_EMULATOR_PORT \
                  -no-boot-anim \
                  -no-window \
                  -no-audio \
                  -no-snapshot-save \
                  -gpu off &

adb wait-for-device
adb devices
adb logcat
