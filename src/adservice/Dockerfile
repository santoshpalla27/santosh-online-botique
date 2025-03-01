FROM eclipse-temurin:8u442-b06-jdk as build 

WORKDIR /app

COPY build.gradle gradlew ./

COPY gradle gradle

RUN chmod +x gradlew

RUN ./gradlew downloadRepos

COPY . .

RUN chmod +x gradlew

RUN ./gradlew installDist



FROM eclipse-temurin:23.0.2_7-jre-alpine-3.21

WORKDIR /app

COPY --from=build /app/build  ./build

EXPOSE 9555

ENTRYPOINT [ "/app/build/install/hipstershop/bin/AdService" ]
