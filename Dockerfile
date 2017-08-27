FROM openjdk:8

ENV DEBIAN_FRONTEND noninteractive

ENV APP_ROOT /opt/app
ENV APP_OPTIONS "-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"

RUN apt-get update
RUN apt-get install -y mariadb-client

RUN adduser --disabled-password --gecos "" reactor --home ${APP_ROOT}
WORKDIR ${APP_ROOT}
USER reactor

COPY ./gradlew ${APP_ROOT}/gradlew
COPY ./gradle/ ${APP_ROOT}/gradle

RUN ./gradlew -v

COPY ./run.sh ${APP_ROOT}/run.sh

COPY ./build.gradle ${APP_ROOT}
COPY ./settings.gradle ${APP_ROOT}
COPY ./src/ ${APP_ROOT}/src

RUN ./gradlew build

VOLUME ${APP_ROOT}/src

CMD ${APP_ROOT}/run.sh "${APP_OPTIONS}"
