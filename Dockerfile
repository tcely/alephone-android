FROM ultrarangers/android-build:sdk-29 AS builder

RUN sh gradlew assembleRelease

RUN mkdir -v /apk && ls -alR

FROM scratch

COPY --from=builder /apk /apk
