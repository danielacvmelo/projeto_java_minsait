# 🛒 E-Commerce API (AppProdutos)

A robust and scalable RESTful API built with **Spring Boot 3** and **Java 21**, designed to manage a complete e-commerce ecosystem. This project implements advanced features such as JWT Authentication, Role-Based Access Control (RBAC), Inventory Management, Promotional Coupons, and Audit Logs.

## 🚀 Technologies & Tools

* **Java 21** (JDK)
* **Spring Boot 3.x**
* **Spring Security** + **JWT** (Auth0)
* **PostgreSQL** (Database)
* **Docker** & **Docker Compose**
* **Swagger / OpenAPI 3.0** (Documentation)
* **Lombok** (Boilerplate reduction)
* **Maven** (Dependency Management)

---

## 📋 Features Implemented

### 1. Authentication & Security (RBAC)
* Stateless authentication using **JWT**.
* **Roles:**
    * `ADMIN`: Full access (manage products, categories, promotions, audit).
    * `SELLER`: Manage inventory and view reports.
    * `USER` (Customer): Browse catalog, manage cart, checkout, and review products.
* Protected endpoints using `@PreAuthorize` and Security Filter chain.

### 2. Catalog Management
* Hierarchical category management.
* Product CRUD with validation logic.

### 3. Inventory Control
* Transactional stock management.
* Validation to prevent sales of out-of-stock items.

### 4. Shopping Cart
* Persistent cart for authenticated users.
* Logic to handle item quantity and price snapshots.

### 5. Orders & Checkout
* Full checkout flow transforming Cart into Order.
* Order status lifecycle management.

### 6. Promotions & Coupons
* Creation of discount coupons with expiration logic.
* Validation and application of coupons to the active cart.

### 7. Reviews
* Product rating system (1-5 stars) with comments.
* Linked to specific products and authenticated users.

### 8. Audit System
* Immutable **Audit Logs** tracking critical actions (Create, Update, Delete).
* Records *Who*, *When*, and *What* changed.

### 9. Business Reports
* Endpoints for sales analytics, top-selling products, and low-stock alerts.

---

## 🛠️ How to Run

### Option 1: Using Docker (Recommended)
Ensure you have **Docker** and **Docker Compose** installed.

1.  Clone the repository:
    ```bash
    git clone [https://github.com/danielacvmelo/projeto_java_minsait.git](https://github.com/danielacvmelo/projeto_java_minsait.git)
    cd AppProdutos
    ```

2.  Build and run the containers:
    ```bash
    docker-compose up --build -d
    ```
    *This will start both the PostgreSQL database and the API application.*

### Option 2: Local Development
Ensure you have **Java 21** and **Maven** installed, and a local **PostgreSQL** instance running.

1.  Configure database credentials in `src/main/resources/application.properties`.
2.  Install dependencies:
    ```bash
    mvn clean install
    ```
3.  Run the application:
    ```bash
    mvn spring-boot:run
    ```

---

## 📚 API Documentation (Swagger UI)

Once the application is running, you can access the interactive API documentation to test all endpoints.

* **URL:** `http://localhost:8080/swagger-ui.html`
* **Docs JSON:** `http://localhost:8080/v3/api-docs`

> **Note:** To test protected routes in Swagger, first execute the `/v1/auth/login` endpoint, copy the `token`, click the **Authorize** button (lock icon), and paste the token with the prefix `Bearer ` (if required by the field) or just the token.

---

## 📍 API Endpoints Reference

### 👤 Authentication
| Method | Endpoint | Description | Role |
| :--- | :--- | :--- | :--- |
| `POST` | `/v1/auth/register` | Register new user | Public |
| `POST` | `/v1/auth/login` | Login & Get Token | Public |
| `GET` | `/v1/auth/me` | Current user info | Auth |

### 📦 Catalog & Products
| Method | Endpoint | Description | Role |
| :--- | :--- | :--- | :--- |
| `GET` | `/v1/products` | List products | Public |
| `GET` | `/v1/products/{id}` | Get product details | Public |
| `POST` | `/v1/products/product` | Create product | ADMIN |
| `POST` | `/v1/categories` | Create category | ADMIN |

### 🛒 Shopping & Orders
| Method | Endpoint | Description | Role |
| :--- | :--- | :--- | :--- |
| `POST` | `/v1/cart` | Create cart | USER |
| `POST` | `/v1/cart/{id}/items` | Add item | USER |
| `POST` | `/v1/coupons/apply` | Apply coupon | USER |
| `POST` | `/v1/order/{id}/checkout` | Finalize Order | USER |

### 🏭 Inventory & Reports
| Method | Endpoint | Description | Role |
| :--- | :--- | :--- | :--- |
| `POST` | `/v1/inventory/{id}/add` | Add stock | SELLER/ADMIN |
| `GET` | `/v1/reports/sales` | Sales Report | ADMIN |
| `GET` | `/v1/reports/low-stock` | Low Stock Report | SELLER/ADMIN |

### 🛡️ System Audit
| Method | Endpoint | Description | Role |
| :--- | :--- | :--- | :--- |
| `GET` | `/v1/audit` | View audit logs | ADMIN |
| `POST` | `/v1/promotions` | Create promotion | ADMIN |

---

## 🗄️ Database Schema (Entities)

The project implements the following main entities as requested:

* **Users:** (`id`, `name`, `email`, `password`, `role`)
* **Products:** (`id`, `name`, `price`, `stockQuantity`, `categoryId`)
* **Categories:** (`id`, `name`)
* **Orders:** (`id`, `userId`, `total`, `status`, `createdAt`)
* **InventoryTransaction:** Tracks stock movement history.
* **AuditLog:** Records system changes for compliance.
* **Promotions:** Manages discount codes and validity.

---
