# 镜像名称定义
BASE_IMAGE = jsherp-build-base:latest
BACKEND_IMAGE = jsherp-backend:latest
FRONTEND_IMAGE = jsherp-frontend:latest

.PHONY: all base backend frontend up down ps clean help

# 默认目标：构建所有镜像
all: base backend frontend

# 1. 构建基础编译环境镜像 (Java + Maven + Node.js)
base:
	@echo "==> Building base image: $(BASE_IMAGE)..."
	docker build -t $(BASE_IMAGE) -f Dockerfile.build-base .

# 2. 构建后端镜像 (依赖 base 镜像)
backend:
	@echo "==> Building backend image: $(BACKEND_IMAGE)..."
	docker build -t $(BACKEND_IMAGE) ./jshERP-boot

# 3. 构建前端镜像 (依赖 base 镜像)
frontend:
	@echo "==> Building frontend image: $(FRONTEND_IMAGE)..."
	docker build -t $(FRONTEND_IMAGE) ./jshERP-web

# 4. 启动所有服务 (使用已构建好的镜像)
up:
	@echo "==> Starting services with docker compose..."
	docker compose up -d

# 5. 停止并移除容器
down:
	@echo "==> Stopping services..."
	docker compose down

# 6. 查看服务状态
ps:
	docker compose ps

# 7. 清理本地构建的镜像
clean:
	@echo "==> Removing jshERP images..."
	-docker rmi $(BACKEND_IMAGE) $(FRONTEND_IMAGE) $(BASE_IMAGE)

# 帮助信息
help:
	@echo "可用指令:"
	@echo "  make base      - 构建基础编译镜像 (Java+Node+Mirror)"
	@echo "  make backend   - 构建后端项目镜像"
	@echo "  make frontend  - 构建前端项目镜像"
	@echo "  make all       - 构建上述所有镜像"
	@echo "  make up        - 启动 docker compose 服务"
	@echo "  make down      - 停止并移除容器"
	@echo "  make ps        - 查看容器运行状态"
	@echo "  make clean     - 删除本地构建的 jshERP 镜像"
