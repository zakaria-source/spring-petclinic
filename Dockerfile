# Étape 1 : builder l’application (optionnel si Gradle l’a déjà fait dans GitLab CI)
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /app
COPY build/libs/*.jar app.jar

# Étape 2 : image finale pour exécution
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
