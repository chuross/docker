#!/bin/bash

echo y | android update sdk --no-ui --all --filter "$ANDROID_COMPONENTS"

git clone $GIT_URL build_target
cd build_target
git fetch origin $GIT_BRANCH
git checkout $GIT_BRANCH

./gradlew $GRADLE_ASSEMBLE_COMMAND && mv $GRADLE_OUTPUTS_PATH /outputs && exit 1
