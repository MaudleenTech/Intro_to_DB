-- Task 0: A Magical Database for Your Dream Online Bookstore Adventure!

-- Drop the database if it already exists to ensure a clean start
DROP DATABASE IF EXISTS ALX_BOOK_STORE;

-- Create the database named ALX_BOOK_STORE
CREATE DATABASE ALX_BOOK_STORE;

-- Use the newly created database
USE ALX_BOOK_STORE;

-- --------------------------------------------------------
-- Table structure for AUTHORS
-- --------------------------------------------------------
CREATE TABLE AUTHORS (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(215) NOT NULL
);

-- --------------------------------------------------------
-- Table structure for CUSTOMERS
-- --------------------------------------------------------
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(215) NOT NULL,
    EMAIL VARCHAR(215) NOT NULL UNIQUE,
    ADDRESS TEXT
);

-- --------------------------------------------------------
-- Table structure for BOOKS
-- Depends on AUTHORS
-- --------------------------------------------------------
CREATE TABLE BOOKS (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(130) NOT NULL,
    AUTHOR_ID INT,
    PRICE DOUBLE NOT NULL,
    PUBLICATION_DATE DATE,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
);

-- --------------------------------------------------------
-- Table structure for ORDERS
-- Depends on CUSTOMERS
-- --------------------------------------------------------
CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

-- --------------------------------------------------------
-- Table structure for ORDER_DETAILS
-- Depends on ORDERS and BOOKS
-- --------------------------------------------------------
CREATE TABLE ORDER_DETAILS (
    ORDERDETAILID INT PRIMARY KEY,
    ORDER_ID INT,
    BOOK_ID INT,
    QUANTITY DOUBLE NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);