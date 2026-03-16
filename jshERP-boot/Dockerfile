# 使用自定义 build-base 镜像
FROM jsherp-build-base:latest AS build
WORKDIR /app

# 编译后端
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# 运行阶段
FROM eclipse-temurin:8-jre
WORKDIR /app
COPY --from=build /app/target/jshERP.jar .
RUN mkdir -p /app/plugins /app/upload
EXPOSE 9999
ENTRYPOINT ["java", "-jar", "jshERP.jar"]
