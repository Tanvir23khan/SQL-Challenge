
-- Drop Tables if Existing
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS dept_employee;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS title;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Specifying Data Types, Primary key & Foreign Key
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/S7Fhf4
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- Import CSV Files into their respective SQL Table

CREATE TABLE "department" (
    "department_id" VARCHAR(10)   NOT NULL,
    "depatment_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "department_id"
     )
);

CREATE TABLE "employee" (
    "employee_id" INT   NOT NULL,
    "title_id" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" CHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "employee_id"
     )
);

CREATE TABLE "department_employee" (
    "department_id" VARCHAR   NOT NULL,
    "employee_id" INT   NOT NULL
);

CREATE TABLE "department_manager" (
    "department_id" VARCHAR   NOT NULL,
    "employee_id" INT   NOT NULL
);

CREATE TABLE "salary" (
    "employee_id" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "title" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_title_id" FOREIGN KEY("title_id")
REFERENCES "title" ("title_id");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_department_id" FOREIGN KEY("department_id")
REFERENCES "department" ("department_id");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employee" ("employee_id");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_department_id" FOREIGN KEY("department_id")
REFERENCES "department" ("department_id");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employee" ("employee_id");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employee" ("employee_id");


-- Query * FROM Each Table Confirming Data
SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM department_employee;
SELECT * FROM department_manager;
SELECT * FROM salary;
SELECT * FROM title;