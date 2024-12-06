-- Step 1: Create the Database
CREATE DATABASE IF NOT EXISTS blood_bank_management;
USE blood_bank_management;

-- Step 2: Create Tables

-- Admin Table
CREATE TABLE Admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Employee Table
CREATE TABLE Employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    emp_address VARCHAR(255),
    emp_phoneno VARCHAR(15),
    emp_designation VARCHAR(50),
    dob DATE,
    salary DECIMAL(10, 2)
);

-- Salary Table
CREATE TABLE Salary (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    work_days INT NOT NULL,
    month VARCHAR(20),
    year YEAR,
    salary_amt DECIMAL(10, 2),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE
);

-- Donor Table
CREATE TABLE Donor (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phoneno VARCHAR(15),
    dob DATE,
    blood_group VARCHAR(5)
);

-- Blood Table
CREATE TABLE Blood (
    blood_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    packet_number INT NOT NULL,
    blood_group VARCHAR(5) NOT NULL,
    FOREIGN KEY (donor_id) REFERENCES Donor(donor_id) ON DELETE CASCADE
);

-- Investigation Table
CREATE TABLE Investigation (
    invest_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    invest_date DATE NOT NULL,
    FOREIGN KEY (donor_id) REFERENCES Donor(donor_id) ON DELETE CASCADE
);

-- Blood Stock Table
CREATE TABLE Blood_Stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    blood_id INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (blood_id) REFERENCES Blood(blood_id) ON DELETE CASCADE
);

-- Hospital Table
CREATE TABLE Hospital (
    hosp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phoneno VARCHAR(15)
);

-- Patient Table
CREATE TABLE Patient (
    pid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    blood_group VARCHAR(5),
    hospital_name VARCHAR(100)
);

-- Payment Table
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    pid INT NOT NULL,
    date DATE NOT NULL,
    payment_amount DECIMAL(10, 2),
    FOREIGN KEY (pid) REFERENCES Patient(pid) ON DELETE CASCADE
);

-- Relationships/Links Between Tables

-- Admin adds Employees
-- Defined by the Employee Table's `emp_id` primary key (No direct linking table is needed for this relation).

-- Admin generates Hospital records
-- Defined by the Hospital Table's `hosp_id` primary key.

-- Hospital has Patients
ALTER TABLE Patient
ADD CONSTRAINT FK_Hospital_Name FOREIGN KEY (hospital_name)
REFERENCES Hospital(name) ON DELETE CASCADE;

-- Patient requests Blood
-- This relationship is inherently defined as Patients can link to Blood indirectly through requests.

