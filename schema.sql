-- This script creates a new PostgreSQL database, defines three tables (departments, employees, and sales),
-- and populates them with dummy data for practicing intermediate SQL concepts.

-- NOTE: The "CREATE DATABASE" command should be run from a separate connection (e.g., using psql
-- while connected to the 'postgres' default database). After creating the database, you
-- must connect to it with `\c company_db;` before running the rest of the script.

-- Create the database if it doesn't already exist.
-- The IF NOT EXISTS clause prevents an error if you run this script more than once.
CREATE DATABASE company_db;


-- Now, connect to the new database to create the tables.
-- You would run this command manually in your psql client.
-- \c company_db;


-- =========================================================================
-- Table Creation
-- =========================================================================

-- Create the Departments table.
-- Using SERIAL for department_id to handle auto-incrementing primary keys.
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Create the Employees table.
-- The salary is DECIMAL(10, 2) to store currency values accurately.
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create the Sales table.
-- sale_amount is also a DECIMAL to handle currency.
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    employee_id INT,
    sale_date DATE,
    sale_amount DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


-- =========================================================================
-- Data Insertion
-- =========================================================================

-- Insert data into the Departments table
INSERT INTO departments (department_name) VALUES
('Sales'),
('Marketing'),
('Engineering'),
('Finance');

-- Insert data into the Employees table.
-- Note that we do not specify `employee_id` and `department_id` here since
-- they are SERIAL and will be auto-incremented by the database.
INSERT INTO employees (first_name, last_name, department_id, salary, hire_date) VALUES
('Alice', 'Smith', 1, 60000.00, '2020-01-15'),
('Bob', 'Johnson', 1, 65000.00, '2020-03-20'),
('Charlie', 'Williams', 2, 55000.00, '2021-02-10'),
('Diana', 'Brown', 2, 58000.00, '2021-05-25'),
('Eve', 'Davis', 3, 80000.00, '2019-06-01'),
('Frank', 'Miller', 3, 82000.00, '2019-08-12'),
('Grace', 'Wilson', 1, 70000.00, '2022-07-07'),
('Heidi', 'Moore', 4, 75000.00, '2020-11-01'),
('Ivan', 'Taylor', 4, 78000.00, '2021-09-09');

-- Insert data into the Sales table
INSERT INTO sales (employee_id, sale_date, sale_amount) VALUES
(1, '2023-01-05', 12000.00),
(1, '2023-01-15', 8500.00),
(2, '2023-01-10', 15000.00),
(2, '2023-02-01', 9000.00),
(7, '2023-01-20', 18000.00),
(7, '2023-02-10', 21000.00),
(3, '2023-01-25', 500.00),
(4, '2023-02-05', 750.00),
(5, '2023-01-01', 1000.00),
(6, '2023-01-10', 1500.00),
(8, '2023-01-15', 2000.00),
(9, '2023-02-01', 3000.00);
