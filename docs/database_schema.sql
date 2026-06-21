CREATE DATABASE IF NOT EXISTS shopwise_ai;
USE shopwise_ai;

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    rating DECIMAL(3,2),
    image_url TEXT,
    product_url TEXT,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Specifications Table (Flexible for any product type)
CREATE TABLE specifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    spec_name VARCHAR(100) NOT NULL,
    spec_value TEXT NOT NULL,
    FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE CASCADE
);

-- Reviews Table
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    review_text TEXT,
    review_rating DECIMAL(3,2),
    FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE CASCADE
);

-- Bookmarks Table (Many-to-Many)
CREATE TABLE bookmarks (
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (user_id, product_id),
    FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,
    FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE CASCADE
);

-- Search History Table
CREATE TABLE search_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    query TEXT NOT NULL,
    searched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

-- Price History Table
CREATE TABLE price_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE CASCADE
);