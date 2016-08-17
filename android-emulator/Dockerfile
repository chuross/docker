FROM chuross/android-java7

MAINTAINER chuross <azarasi.mo.mo@gmail.com>

ARG TARGET_API="android-23"
ARG STORAGE_SIZE="128M"
ARG SKIN="QVGA"

ENV ANDROID_EMULATOR_MEMORY 1024
ENV ANDROID_EMULATOR_NAME "armeabi-v7a-${TARGET_API}"
ENV ANDROID_EMULATOR_COMPONENTS "${TARGET_API},sys-img-${ANDROID_EMULATOR_NAME}"
ENV ANDROID_EMULATOR_PATH $ANDROID_HOME/../emulators
ENV ANDROID_EMULATOR_PORT 5554

RUN echo y | android update sdk --no-ui --all --filter "${ANDROID_EMULATOR_COMPONENTS}"

WORKDIR /usr/local

COPY emulator.sh /usr/local
RUN chmod +x emulator.sh

# CMD ["adb", "devices"]
