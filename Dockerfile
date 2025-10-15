# Estágio 1: Build da aplicação
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copia o pom.xml e baixa as dependências
COPY pom.xml .
RUN mvn dependency:go-offline

# Copia o código fonte e compila
COPY src ./src
RUN mvn clean package -DskipTests

# Estágio 2: Imagem final
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copia o JAR compilado do estágio anterior
COPY --from=build /app/target/cadastro-usuarios.jar /app/cadastro-usuarios.jar

# Cria diretório para o banco de dados
RUN mkdir -p /app/data

# Define variável de ambiente para o banco de dados
ENV DB_PATH=/app/data/usuarios.db

# Expõe o diretório de dados como volume
VOLUME ["/app/data"]

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "/app/cadastro-usuarios.jar"]