FROM chuross/android-java7:core

MAINTAINER chuross <azarasi.mo.mo@gmail.com>

VOLUME /outputs

ENV GIT_URL ''
ENV GIT_BRANCH master
ENV GRADLE_OUTPUTS_PATH app/build/outputs/apk
ENV GRADLE_ASSEMBLE_COMMAND assembleDebug
ENV ANDROID_COMPONENTS android-23,extra-android-m2repository,extra-google-m2repository

RUN apt-get -yq install git

WORKDIR /workspace
COPY build.sh ./

CMD ["sh", "build.sh"]
