# 使用自定义 build-base 镜像
FROM jsherp-build-base:latest AS build
WORKDIR /app

# 安装依赖
COPY package*.json ./
RUN npm install --legacy-peer-deps

# 构建前端
COPY . .
RUN npm run build

# 运行阶段
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
