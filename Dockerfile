FROM openjdk:8

ENV APP_ROOT /opt/app

COPY gradlew ${APP_ROOT}
COPY gradle ${APP_ROOT}

WORKDIR ${APP_ROOT}

RUN ./gradlew -v

RUN ./gradlew
