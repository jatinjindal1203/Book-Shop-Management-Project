-- Create the database
CREATE DATABASE Management;

-- Use the newly created database
USE Management;

-- Create the Books table
CREATE TABLE Books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    auth VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    qty INT NOT NULL
);

-- Create the Suppliers table
CREATE TABLE Suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phn BIGINT NOT NULL,
    addr_line1 VARCHAR(255) NOT NULL,
    addr_line2 VARCHAR(255),
    addr_city VARCHAR(255) NOT NULL,
    addr_state VARCHAR(255) NOT NULL
);

-- Create the Purchases table
CREATE TABLE Purchases (
    ord_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    sup_id INT,
    qty INT NOT NULL,
    dt_ordered DATE NOT NULL,
    eta INT NOT NULL,
    received CHAR(1) DEFAULT 'F' CHECK (received IN ('T', 'C', 'F')),
    inv INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (sup_id) REFERENCES Suppliers(id)
);

-- Create the Employees table
CREATE TABLE Employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    addr_line1 VARCHAR(255) NOT NULL,
    addr_line2 VARCHAR(255),
    addr_city VARCHAR(255) NOT NULL,
    addr_state VARCHAR(255) NOT NULL,
    phn BIGINT NOT NULL,
    date_of_joining DATE NOT NULL,
    salary BIGINT NOT NULL,
    mgr_status VARCHAR(1) DEFAULT 'F' CHECK (mgr_status IN ('T', 'F'))
);

-- Create the Members table
CREATE TABLE Members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    addr_line1 VARCHAR(255) NOT NULL,
    addr_line2 VARCHAR(255),
    addr_city VARCHAR(255) NOT NULL,
    addr_state VARCHAR(255) NOT NULL,
    phn BIGINT NOT NULL,
    beg_date DATE NOT NULL,
    end_date DATE NOT NULL,
    valid VARCHAR(255) NOT NULL
);

-- Create the Sales table
CREATE TABLE Sales (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    qty INT NOT NULL,
    amount INT NOT NULL,
    date_s DATE NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members(id),
    FOREIGN KEY (book_id) REFERENCES Books(id)
);
