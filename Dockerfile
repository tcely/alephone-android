FROM ultrarangers/android-build:sdk-29 AS builder

RUN git clone --recursive git@github.com:tcely/alephone-android.git /alephone-android

WORKDIR /alephone-android

RUN sh gradlew assembleRelease

RUN mkdir -v /apk && ls -alR

FROM scratch

COPY --from=builder /apk /apk
