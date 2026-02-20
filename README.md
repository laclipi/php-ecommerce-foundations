# php-ecommerce-foundations
🛒 PHP E-commerce – Foundational Project
📌 Overview

This project was my first complete full-stack web application, developed using PHP (native) and MariaDB/MySQL.

The objective was to build a fully functional online store including:

User registration and authentication

Product listing and detail views

Shopping cart management using sessions

Order processing and stock updates

Basic admin management (products, stores, inventory)

This project allowed me to understand the full lifecycle of a web application: database design, authentication, session handling, CRUD operations and business logic implementation.

🏗️ Tech Stack

PHP (procedural)

MariaDB / MySQL

HTML / CSS

Sessions for state management

Password hashing with password_hash() (BCRYPT)

🗄️ Database Design

The application is based on a relational schema including:

Clientes

Usuarios (authentication separated from client data)

Productos

Pedidos

Tiendas

Existencias

Key Design Decisions

Separation between authentication (Usuarios) and client data (Clientes)

Foreign key relationships to maintain data integrity

Stock management per store via Existencias table

Passwords stored securely using hashing

🔐 Security Measures Implemented

Password hashing using password_hash() with BCRYPT

password_verify() for login validation

Basic input validation

Use of htmlspecialchars() to prevent XSS

Session-based authentication control

🛍️ Core Functionalities

User registration & login

Product browsing

Product detail view

Shopping cart via session

Order confirmation with stock update

Basic administration panels

📈 What I Would Improve Today

After gaining experience with Java, Spring Boot and layered architecture, I would redesign parts of this project:

Introduce a Detalle_Pedido table to support multiple products per order

Implement database transactions for order processing

Use prepared statements consistently to prevent SQL injection

Introduce role-based access control

Refactor logic into a more modular structure

This project represents the foundation of my backend learning journey.

🎯 Learning Impact

This project was crucial for understanding:

Relational database modeling

Authentication flows

Session management

Backend business logic

End-to-end application design

It laid the groundwork for my later work on more structured backend systems, including multi-tenant SaaS architectures.
