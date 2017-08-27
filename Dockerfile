FROM openjdk:8

ENV APP_ROOT /opt/app

COPY ./gradlew ${APP_ROOT}/gradlew
COPY ./gradle/ ${APP_ROOT}/gradle

WORKDIR ${APP_ROOT}

RUN ./gradlew -v

COPY ./build.gradle ${APP_ROOT}
COPY ./settings.gradle ${APP_ROOT}
COPY ./src/ ${APP_ROOT}/src

VOLUME ${APP_ROOT}/src

RUN ./gradlew build
