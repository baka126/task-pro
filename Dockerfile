# Dockerfile

# Use the specified base image
FROM eclipse-temurin:17-jdk-jammy

# Set environment variables
ENV ANDROID_COMPILE_SDK="33"
ENV ANDROID_BUILD_TOOLS="33.0.2"
ENV ANDROID_SDK_TOOLS="9477386"

# Install dependencies
RUN apt-get --quiet update --yes \
    && apt-get --quiet install --yes wget unzip

# Set up Android SDK
ENV ANDROID_HOME="/android-sdk-root"
RUN mkdir $ANDROID_HOME \
    && wget --no-verbose --output-document=$ANDROID_HOME/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS}_latest.zip \
    && unzip -q -d "$ANDROID_HOME/cmdline-tools" "$ANDROID_HOME/cmdline-tools.zip" \
    && mv -T "$ANDROID_HOME/cmdline-tools/cmdline-tools" "$ANDROID_HOME/cmdline-tools/tools" \
    && export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/cmdline-tools/tools/bin \
    && sdkmanager --version \
    && yes | sdkmanager --licenses > /dev/null || true \
    && sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" \
    && sdkmanager "platform-tools" \
    && sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}"

# Set up working directory
WORKDIR /app

# Copy project files into the container
COPY . .

# Make Gradlew executable
RUN chmod +x ./gradlew

# Default command
CMD ["./gradlew", "lintDebug"]
