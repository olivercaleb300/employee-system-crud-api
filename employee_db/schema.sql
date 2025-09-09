-- ==========================
-- DEPARTMENTS TABLE
-- ==========================
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR (100) UNIQUE NOT NULL,
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by VARCHAR(50)
);


-- ==========================
-- EMPLOYEES TABLE
-- ========================== 
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL ,
    department_id INT REFERENCES departments(id) ,
    role VARCHAR(50),
    hire_date DATE,
    salary decimal(10,2) CHECK (SALARY >=0),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP,
    updated_by VARCHAR(50)
);


-- ========================== 
-- PROJECTS TABLE
-- ==========================

CREATE TABLE projects ( 
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE CHECK (end_date >= start_date),
    created_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP,
    updated_by VARCHAR(50)
);


-- ========================== 
-- EMPLOYEE PROJECTS TABLE
-- ==========================

CREATE TABLE employee_projects (
    employee_id INT NOT NULL REFERENCES employees(id),
    project_id INT NOT NULL REFERENCES projects(id),
    assigned_date DATE,
    PRIMARY KEY (employee_id , project_id)
);


-- ==========================
-- USERS TABLE
-- ==========================

CREATE TABLE users (
    id serial PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(50),
    employee_id INT NOT NULL REFERENCES employee(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP,
    updated_by VARCHAR(50)
);



