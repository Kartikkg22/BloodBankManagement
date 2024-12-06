-- Insert sample data into Admin table
INSERT INTO Admin (username, password) VALUES
('admin1', 'password1'),
('admin2', 'password2');

-- Insert sample data into Hospital table
INSERT INTO Hospital (name, address, phoneno) VALUES
('City Hospital', '123 Main Street', '9876543210'),
('Apollo Hospital', '456 Elm Street', '8765432109');

-- Insert sample data into Employee table
INSERT INTO Employee (emp_name, emp_address, emp_phoneno, emp_designation, dob, salary) VALUES
('John Doe', '789 Oak Street', '9123456780', 'Technician', '1985-04-15', 30000.00),
('Jane Smith', '321 Pine Street', '9988776655', 'Manager', '1990-11-30', 45000.00);

-- Insert sample data into Patient table
INSERT INTO Patient (name, address, blood_group, hospital_name) VALUES
('Alice Brown', '555 Cedar Avenue', 'A+', 'City Hospital'),
('Bob Green', '666 Birch Road', 'B+', 'Apollo Hospital');

-- Insert sample data into Donor table
INSERT INTO Donor (name, address, phoneno, dob, blood_group) VALUES
('Charlie White', '777 Maple Lane', '9012345678', '1995-05-25', 'O+'),
('Diana Blue', '888 Spruce Drive', '9234567890', '1988-12-14', 'A-');

-- Insert sample data into Blood table
INSERT INTO Blood (donor_id, packet_number, blood_group) VALUES
(1, 1001, 'O+'),
(2, 1002, 'A-');
