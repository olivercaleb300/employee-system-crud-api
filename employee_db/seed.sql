-- ===============================
-- Departments
-- ===============================
INSERT INTO departments (name, location)
VALUES
('Engineering', 'New York'),
('HR', 'Chicago'),
('Sales', 'San Francisco');

-- ===============================
-- Employees
-- ===============================
INSERT INTO employees (name, email, department_id, role, hire_date, salary, is_active)
VALUES
('Alice Johnson', 'alice.johnson@example.com', 1, 'Software Engineer', '2022-03-15', 85000.00, TRUE),
('Bob Smith', 'bob.smith@example.com', 2, 'HR Manager', '2021-06-01', 65000.00, TRUE),
('Carol White', 'carol.white@example.com', 3, 'Sales Associate', '2023-01-10', 70000.00, TRUE);

-- ===============================
-- Projects
-- ===============================
INSERT INTO projects (name, description, start_date, end_date)
VALUES
('Website Redesign', 'Complete overhaul of company website', '2023-02-01', '2023-06-30'),
('Employee Onboarding System', 'HR system to streamline onboarding', '2022-05-01', '2022-12-31');

-- ===============================
-- Employee Projects
-- ===============================
INSERT INTO employee_projects (employee_id, project_id, assigned_date)
VALUES
(1, 1, '2023-02-05'),  -- Alice on Website Redesign
(2, 2, '2022-05-10');  -- Bob on Onboarding System

-- ===============================
-- Users
-- ===============================
INSERT INTO users (username, password_hash, role, employee_id)
VALUES
('alice', '$2b$12$examplehashalice', 'employee', 1),
('bob', '$2b$12$examplehashbob', 'admin', 2),
('carol', '$2b$12$examplehashcarol', 'employee', 3);

