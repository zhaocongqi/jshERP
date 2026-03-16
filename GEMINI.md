# jshERP Project Context

This document provides essential context and instructions for AI agents working on the jshERP (华夏ERP / 管伊佳ERP) project.

## Project Overview

jshERP is an open-source ERP system designed for small and medium-sized enterprises (SMEs). It provides core functionalities for inventory management (进销存), finance (财务), and production (生产).

### Key Technologies
- **Backend:** Spring Boot 2.0.0.RELEASE, MyBatis Plus 3.0.7.1, MySQL 8.0.24, Redis 6.2.1, Maven 3.3.9.
- **Frontend:** Vue 2.7.16, Ant Design Vue 1.5.2, Vue CLI 3, Node 20.17.0.
- **Architecture:** Decoupled frontend and backend communicating via RESTful APIs.

### Directory Structure
- `jshERP-boot/`: The backend Spring Boot application.
- `jshERP-web/`: The frontend Vue.js application.

---

## Building and Running

### Prerequisites
- JDK 1.8
- Node.js 20.17.0 (LTS)
- MySQL 8.0.24
- Redis 6.2.1
- Maven 3.3.9

### Backend (jshERP-boot)
1.  **Database Setup:** Import `jshERP-boot/docs/jsh_erp.sql` into your MySQL database.
2.  **Configuration:** Update `jshERP-boot/src/main/resources/application.properties` with your MySQL and Redis credentials.
3.  **Build:**
    ```bash
    cd jshERP-boot
    mvn clean package -DskipTests
    ```
4.  **Run:**
    ```bash
    java -jar target/jshERP.jar
    ```
    Alternatively, run the main class `com.jsh.erp.ErpApplication` from your IDE.

### Frontend (jshERP-web)
1.  **Install Dependencies:**
    ```bash
    cd jshERP-web
    npm install
    ```
2.  **Run Development Server:**
    ```bash
    npm run serve
    ```
    The frontend will be available at `http://localhost:3000` and will proxy requests to the backend at `http://localhost:9999`.

---

## Development Conventions

### Backend
- **Architecture:** Standard Spring Boot layers (`controller`, `service`, `datasource/mapper`).
- **Data Access:** Use MyBatis-Plus for CRUD operations. Mappers are located in `jshERP-boot/src/main/resources/mapper_xml/`.
- **API Standards:** Follow RESTful principles.
- **Error Handling:** Use custom exceptions and global exception handling.
- **Plugin System:** The project uses a custom plugin framework (`springboot-plugin-framework`).

### Frontend
- **Framework:** Vue 2 with Ant Design Vue.
- **API Calls:** Use the utility functions in `jshERP-web/src/api/manage.js` (e.g., `getAction`, `postAction`).
- **Styling:** Use Less for styling, following the Ant Design theme.
- **State Management:** Vuex is used for global state.

### General
- **Code Style:** Adhere to the existing coding style in the project (ESLint for frontend, standard Java conventions for backend).
- **Documentation:** Maintain clear comments and update the `README.md` for major changes.
- **Security:** Ensure all new APIs are properly authenticated and authorized.

---

## Key Files for Reference
- `jshERP-boot/pom.xml`: Backend dependencies and build configuration.
- `jshERP-web/package.json`: Frontend dependencies and scripts.
- `jshERP-boot/src/main/resources/application.properties`: Backend runtime configuration.
- `jshERP-web/vue.config.js`: Frontend development and build configuration.
- `jshERP-boot/docs/jsh_erp.sql`: Database schema and initial data.
