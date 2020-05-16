FROM openjdk:8
VOLUME /tmp
EXPOSE 8090
ADD ./target/curso-servicio-zuul-serve-0.0.1-SNAPSHOT.jar zuul-serve-.jar
ENTRYPOINT ["java","-jar","/zuul-serve-.jar"]