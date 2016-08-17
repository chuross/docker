echo no | android create avd -n $ANDROID_EMULATOR_NAME \
                            -t $TARGET_API \
                            -c $STORAGE_SIZE \
                            -s $SKIN \
                            -p $ANDROID_EMULATOR_PORT

adb start-server

ip=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}')
socat tcp-listen:5037,bind=$ip,fork tcp:127.0.0.1:5037 &
socat tcp-listen:5554,bind=$ip,fork tcp:127.0.0.1:$ANDROID_EMULATOR_PORT

emulator64-arm -avd $ANDROID_EMULATOR_NAME \
                  -memory $MEMORY \
                  -port $PORT \
                  -no-boot-anim \
                  -no-window \
                  -noaudio \
                  -gpu off \
                  -no-snapshot-save

adb wait-for-device
