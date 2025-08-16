-- Create Applicants table
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    EmploymentType VARCHAR(50),
    Income DECIMAL(10,2),
    CIBILScore INT
);

-- Create Loans table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    ApplicantID INT,
    LoanAmount DECIMAL(12,2),
    Status VARCHAR(20),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);

-- Insert sample applicants
INSERT INTO Applicants (Name, Age, EmploymentType, Income, CIBILScore) VALUES
('Ravi Kumar', 28, 'Salaried', 60000, 750),
('Sneha Reddy', 32, 'Self-Employed', 90000, 680),
('Arjun Singh', 25, 'Salaried', 40000, 820);

-- Insert sample loans
INSERT INTO Loans (ApplicantID, LoanAmount, Status) VALUES
(1, 500000, 'Approved'),
(2, 300000, 'Rejected'),
(3, 200000, 'Approved');

-- Query: Get all approved loans above 2 lakh
SELECT a.Name, l.LoanAmount, l.Status
FROM Applicants a
JOIN Loans l ON a.ApplicantID = l.ApplicantID
WHERE l.Status = 'Approved' AND l.LoanAmount > 200000;

-- Query: Average income of approved applicants
SELECT AVG(a.Income) AS AvgIncomeApproved
FROM Applicants a
JOIN Loans l ON a.ApplicantID = l.ApplicantID
WHERE l.Status = 'Approved';

-- Query: Count applicants by employment type
SELECT EmploymentType, COUNT(*) AS TotalApplicants
FROM Applicants
GROUP BY EmploymentType;
