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

## 📋 Features

The project meets all academic requirements, featuring a comprehensive set of modules:

### 🔐 Authentication & Security
* **JWT (JSON Web Token):** Stateless authentication.
* **RBAC (Role-Based Access Control):** Granular permissions for `ADMIN`, `SELLER`, and `USER`.
* **Endpoints:** Register, Login, Token Refresh, and "Me" (current user info).

### 📦 Product Catalog
* **Categories:** Management of product categories.
* **Products:** CRUD operations with association to categories.
* **Reviews:** Users can rate and review products.

### 🏭 Inventory & Sales
* **Stock Management:** Add/Remove items from inventory securely.
* **Shopping Cart:** Persistent cart management for customers.
* **Checkout:** Order processing with stock validation.
* **Reports:**
    * Top-selling products.
    * Low stock alerts.
    * Sales revenue reports.

### 🎟️ Marketing & Compliance
* **Promotions:** Creation of discount coupons with expiration dates.
* **Coupon Application:** Logic to validate and apply discounts to the cart.
* **Audit Logs:** Automatic tracking of critical actions (e.g., product creation, order placement) for security and compliance.

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

## 🛣️ API Endpoints Overview

### 👤 Auth Controller
| Method | Endpoint | Access | Description |
| :--- | :--- | :--- | :--- |
| `POST` | `/v1/auth/register` | Public | Register a new user |
| `POST` | `/v1/auth/login` | Public | Authenticate and receive JWT |
| `POST` | `/v1/auth/refresh` | Public | Refresh expired token |
| `GET` | `/v1/auth/me` | Authenticated | Get current user details |

### 🛍️ Product & Category
| Method | Endpoint | Access | Description |
| :--- | :--- | :--- | :--- |
| `POST` | `/v1/categories` | ADMIN | Create a category |
| `GET` | `/v1/products/{id}` | Public | Get product details |
| `POST` | `/v1/products/product` | ADMIN | Create a new product |
| `POST` | `/v1/inventory/{id}/add` | ADMIN/SELLER | Add stock to product |

### 🛒 Shopping & Order
| Method | Endpoint | Access | Description |
| :--- | :--- | :--- | :--- |
| `POST` | `/v1/cart` | USER | Create a shopping cart |
| `POST` | `/v1/cart/{cartId}/items` | USER | Add item to cart |
| `POST` | `/v1/coupons/apply` | USER | Apply discount coupon |
| `POST` | `/v1/order/{cartId}/checkout`| USER | Finalize purchase |

### 📊 Management & Audit
| Method | Endpoint | Access | Description |
| :--- | :--- | :--- | :--- |
| `POST` | `/v1/promotions` | ADMIN | Create new coupons |
| `GET` | `/v1/audit` | ADMIN | View system audit logs |
| `GET` | `/v1/reports/sales` | ADMIN | View sales reports |

---
