-- =========================================
-- Reset Employee Database (employee_db)
-- Drops tables, recreates schema, inserts seed data
-- =========================================

-- 1. Drop all existing tables in public schema
DO $$ DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') LOOP
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP;
END $$;

-- 2. Create tables in correct order

-- Departments
CREATE TABLE public.departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Employees
CREATE TABLE public.employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    department_id INT REFERENCES public.departments(id),
    role VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10,2) CHECK (salary >= 0),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Projects
CREATE TABLE public.projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
    description TEXT,
    start_date DATE,
    end_date DATE CHECK (end_date >= start_date),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Employee_Projects
CREATE TABLE public.employee_projects (
    employee_id INT NOT NULL REFERENCES public.employees(id),
    project_id INT NOT NULL REFERENCES public.projects(id),
    assigned_date DATE,
    PRIMARY KEY (employee_id, project_id)
);

-- Users
CREATE TABLE public.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    role VARCHAR(50),
    employee_id INT NOT NULL REFERENCES public.employees(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Insert seed data

-- Departments
INSERT INTO public.departments (name, location)
VALUES
('HR', 'Building A'),
('Engineering', 'Building B'),
('Sales', 'Building C');

-- Employees
INSERT INTO public.employees (name, email, department_id, role, hire_date, salary)
VALUES
('Alice Johnson', 'alice@company.com', 1, 'HR Manager', '2023-01-15', 70000.00),
('Bob Smith', 'bob@company.com', 2, 'Engineer', '2023-02-01', 90000.00),
('Charlie Lee', 'charlie@company.com', 3, 'Sales Rep', '2023-03-10', 60000.00);

-- Projects
INSERT INTO public.projects (name, description, start_date, end_date)
VALUES
('Project Alpha', 'Top priority engineering project', '2023-04-01', '2023-10-01'),
('Project Beta', 'Sales expansion initiative', '2023-05-01', '2023-12-31');

-- Employee_Projects
INSERT INTO public.employee_projects (employee_id, project_id, assigned_date)
VALUES
(2, 1, '2023-04-02'),
(3, 2, '2023-05-03');

-- Users
INSERT INTO public.users (username, password_hash, role, employee_id)
VALUES
('alicej', 'hashedpassword1', 'admin', 1),
('bobsmith', 'hashedpassword2', 'user', 2),
('charliel', 'hashedpassword3', 'user', 3);

