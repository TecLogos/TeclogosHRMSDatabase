
-- Use the database
USE TeclogosHRMS;
GO

INSERT INTO Employees (Code, FirstName, MiddleName, LastName, Email, MobileNumber, Location, Extension, ResidentialStatus, DOB, PlaceOfBirth, GenderTypeID, BloodGroupID, MaritalStatus, MarriageDate, Nationality, Religion, Caste, PhysicallyChallenged, InternationalEmp, HeightInCm, WeightInKG, IdentificationMark, Hobby, JoiningDate, DepartmentID, DesignationID, ReportingManagerID)
VALUES ('EMP001','Gaurav','Kailas','Thube','gaurav.thube@gmail.com','9876543210', 'Pune','123', 'Rented', '2003-11-20', 'Parner', '8D702544-3544-4CEF-99FF-7B19101CED55','806F3A95-3AC4-4665-8062-82EB74DC6919', 'Single', NULL, 'Indian', 'Hindu', 'Maratha', 0, 0, 177.70, 65.00, NULL, 'Swimming', '2025-10-11', '872DABE7-6DE4-4CEC-80B6-D80AA4C20CB3', '1A9ED3A9-DE8B-4ACE-9D16-03B1D0D93B14', 'F5691DA6-9436-4D12-9E95-3504C8D2153C');
GO

INSERT INTO Employees (Code, FirstName, MiddleName, LastName, Email, MobileNumber, Location, Extension, ResidentialStatus, DOB, PlaceOfBirth, GenderTypeID, BloodGroupID, MaritalStatus, MarriageDate, Nationality, Religion, Caste, PhysicallyChallenged, InternationalEmp, HeightInCm, WeightInKG, IdentificationMark, Hobby, JoiningDate, DepartmentID, DesignationID, ReportingManagerID)
VALUES ('EMP002','Ajay','Baburao','Pise','ajay.pise@gmail.com','9876543211', 'Hadapsar, Pune','456', 'Hostel', '2003-05-12', 'Shegaon', '8D702544-3544-4CEF-99FF-7B19101CED55','32B85662-DF50-455E-95D6-536964DCA908', 'Single', NULL, 'Indian', 'Hindu', 'Maratha', 0, 0, 157.70, 55.00, NULL, 'Reading', '2025-06-05', '0BEB2672-20F3-4BF9-9D3D-1CB8844C20B8', 'C91555E1-07C1-4BD9-91A6-ECC8F8E4A131', '3DB1271C-96EC-4E3B-8CC1-984F3E4D122A');
GO

INSERT INTO Employees (Code, FirstName, MiddleName, LastName, Email, MobileNumber, Location, Extension, ResidentialStatus, DOB, PlaceOfBirth, GenderTypeID, BloodGroupID, MaritalStatus, MarriageDate, Nationality, Religion, Caste, PhysicallyChallenged, InternationalEmp, HeightInCm, WeightInKG, IdentificationMark, Hobby, JoiningDate, DepartmentID, DesignationID, ReportingManagerID)
VALUES ('EMP003','Atharv','Santosh','Supekar','atharv.supekar@gmail.com','9876543212', 'Wagholi, Pune','789', 'Owned', '2002-08-22', 'Satara', '8D702544-3544-4CEF-99FF-7B19101CED55','67AFAC88-0609-40E7-96EF-84263BB53008', 'Single', NULL, 'Indian', 'Hindu', 'Maratha', 0, 0, 187.00, 59.00, NULL, 'Writing', '2025-06-12', '59AF714B-5D32-4726-80C6-59B6F49C5CE6', '747096D8-B084-4167-A00A-E538E88289BF', '8016A585-53C2-4C7E-A6C8-AFFAEE048A05');
GO

INSERT INTO Employees (Code, FirstName, MiddleName, LastName, Email, MobileNumber, Location, Extension, ResidentialStatus, DOB, PlaceOfBirth, GenderTypeID, BloodGroupID, MaritalStatus, MarriageDate, Nationality, Religion, Caste, PhysicallyChallenged, InternationalEmp, HeightInCm, WeightInKG, IdentificationMark, Hobby, JoiningDate, DepartmentID, DesignationID, ReportingManagerID)
VALUES ('EMP004','Shambhuraje','Santosh','Bhosale','shambhu.bhosale@gmail.com','9876543213', 'Magarpatta City, Pune','012', 'Rented', '2003-04-19', 'Karmala', '8D702544-3544-4CEF-99FF-7B19101CED55','4137BBE7-72B2-4C29-B65C-1A9B064F9D4F', 'Single', NULL, 'Indian', 'Hindu', 'Maratha', 0, 0, 187.00, 59.00, NULL, 'Singing', '2025-06-08', '00EF2150-45B7-48A4-818D-6363CAF93A54', 'BB534AAB-9DC6-4F90-887A-9B485E0F4079', 'F150C6D4-2F93-41D0-806B-378926660153');
GO

INSERT INTO Employees (Code, FirstName, MiddleName, LastName, Email, MobileNumber, Location, Extension, ResidentialStatus, DOB, PlaceOfBirth, GenderTypeID, BloodGroupID, MaritalStatus, MarriageDate, Nationality, Religion, Caste, PhysicallyChallenged, InternationalEmp, HeightInCm, WeightInKG, IdentificationMark, Hobby, JoiningDate, DepartmentID, DesignationID, ReportingManagerID)
VALUES ('EMP005','Sanika','Umesh','Ghodake','sanika.ghodake@gmail.com','9876543214', 'Katraj, Pune','345', 'Hostel', '2003-03-03', 'Kanhur', 'AC8EBD54-D89D-4464-BFB4-FF41EB6CCA67','BFDAF86A-FAF0-460A-AD8E-D04F22FC2846', 'Married', '2024-04-15', 'Indian', 'Hindu', 'Sonar', 0, 0, 187.00, 59.00, NULL, 'Drawing', '2025-05-19', '755D3EA8-C661-4307-8C0F-4B5E70532329', 'C91555E1-07C1-4BD9-91A6-ECC8F8E4A131', '54478810-F6EA-478E-8202-3D410AB0253B');
GO
SELECT * FROM Employees;

INSERT INTO GenderType (Name)
VALUES
('Male'),
('Female'),
('Other');
GO
SELECT * FROM GenderType;

INSERT INTO BloodGroup (Name)
VALUES
('A+'),
('A-'),
('B+'),
('B-'),
('AB+'),
('AB-'),
('O+'),
('O-');
GO
SELECT * FROM BloodGroup;

INSERT INTO Department (Name)
VALUES
('Human Resources'),
('Finance'),
('Information Technology'),
('Administration'),
('Sales'),
('Marketing'),
('Operations'),
('Research and Development'),
('Customer Support'),
('Procurement'),
('Legal'),
('Quality Assurance'),
('Production'),
('Maintenance'),
('Business Development');
GO
SELECT * FROM Department;

INSERT INTO Designation (Name)
VALUES
('Chief Executive Officer'),
('Chief Technology Officer'),
('Chief Financial Officer'),
('Director'),
('General Manager'),
('HR Manager'),
('Finance Manager'),
('Project Manager'),
('Software Architect'),
('Team Lead'),
('Senior Software Engineer'),
('Software Engineer'),
('Junior Software Engineer'),
('Intern'),
('Sales Executive'),
('Marketing Executive'),
('Customer Support Executive'),
('Accountant'),
('Office Administrator'),
('Technician');
GO
SELECT * FROM Designation;

INSERT INTO Shifts (Name, StartTime, EndTime, BreakDuration, StandardHrs, LateThreshold)
VALUES
('General Shift', '09:00:00', '18:00:00', '01:00:00', '08:00:00', '00:15:00'),
('Morning Shift', '06:00:00', '14:00:00', '00:45:00', '07:15:00', '00:10:00'),
('Afternoon Shift', '14:00:00', '22:00:00', '00:45:00', '07:15:00', '00:10:00'),
('Night Shift', '22:00:00', '06:00:00', '00:45:00', '07:15:00', '00:10:00'),
('Half Day Shift', '09:00:00', '13:00:00', '00:15:00', '03:45:00', '00:10:00'),
('Weekend Shift', '10:00:00', '16:00:00', '00:30:00', '05:30:00', '00:10:00');
GO
SELECT * FROM Shifts;

INSERT INTO RelationType (Name)
VALUES
('Father'),
('Mother'),
('Spouse'),
('Brother'),
('Sister'),
('Son'),
('Daughter'),
('Guardian'),
('Friend');
GO
SELECT * FROM RelationType;

INSERT INTO IdentifierType (Name)
VALUES
('Aadhaar Card'),
('PAN Card'),
('Passport'),
('Driving License'),
('Voter ID'),
('Ration Card'),
('Birth Certificate'),
('Marriage Certificate'),
('National ID Card'),
('Residence Permit'),
('Work Permit'),
('Social Security Number'),
('Tax Identification Number');
GO
SELECT * FROM IdentifierType;

INSERT INTO Roles (Name, Description)
VALUES
('Admin', 'Administrative control for managing employees, departments, and system configurations.'),
('HR Manager', 'Manages employee lifecycle, attendance, leaves, payroll, and compliance activities.'),
('Manager', 'Supervises a team, manages approvals, and monitors task and performance data.'),
('Lead Engineer', 'Responsible for technical leadership, task allocation, and progress reporting.'),
('Employee', 'Regular employee access to attendance, leave, and personal data.'),
('Intern', 'Limited access for trainees and interns with restricted permissions.');
GO
SELECT * FROM Roles;

INSERT INTO OfficeHolidays (Name, Date)
VALUES 
('New Year', '2025-01-01'),
('Republic Day', '2025-01-26'),
('Holi', '2025-03-14'),
('Good Friday', '2025-04-18'),
('Maharashtra Day', '2025-05-01'),
('Independence Day', '2025-08-15'),
('Ganesh Chaturthi', '2025-08-27'),
('Gandhi Jayanti', '2025-10-02'),
('Dussehra', '2025-10-12'),
('Diwali', '2025-10-22'),
('Christmas', '2025-12-25');
GO
SELECT * FROM OfficeHolidays;

INSERT INTO Attendance (EmpID, ShiftID, Date, InTime, OutTime, Duration, WorkHrs, OverTime, LateIn, EarlyOut, IsManualEntry)
VALUES
-- Employee 1
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', 'AE6B1C41-F588-4E2C-AC89-012C0615062E', '2025-10-28', '2025-10-28 09:05:00', '2025-10-28 18:10:00', '09:05', '08:00', '01:00', '00:05', '00:00', 0),
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', 'AE6B1C41-F588-4E2C-AC89-012C0615062E', '2025-10-29', '2025-10-29 09:00:00', '2025-10-29 17:45:00', '08:45', '08:00', '00:30', '00:00', '00:15', 0),

-- Employee 2
('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', 'AE6B1C41-F588-4E2C-AC89-012C0615062E', '2025-10-28', '2025-10-28 08:55:00', '2025-10-28 17:50:00', '08:55', '08:00', '00:45', '00:00', '00:10', 0),
('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', 'AE6B1C41-F588-4E2C-AC89-012C0615062E', '2025-10-29', '2025-10-29 09:15:00', '2025-10-29 18:30:00', '09:15', '08:00', '01:15', '00:15', '00:00', 0),

-- Employee 3
('B901B55E-D8BE-4DEA-A680-C310C8DB483A', 'AE6B1C41-F588-4E2C-AC89-012C0615062E', '2025-10-28', '2025-10-28 09:10:00', '2025-10-28 18:20:00', '09:10', '08:00', '01:10', '00:10', '00:00', 0),
('B901B55E-D8BE-4DEA-A680-C310C8DB483A', 'AE6B1C41-F588-4E2C-AC89-012C0615062E', '2025-10-29', '2025-10-29 08:50:00', '2025-10-29 17:50:00', '09:00', '08:00', '00:45', '00:00', '00:10', 0);
GO
SELECT * FROM Attendance;

INSERT INTO WorkBreak (EmpID, Date, StartDateTime, EndDateTime, TotalDuration)
VALUES
-- Employee 1
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', '2025-10-28', '2025-10-28 13:00:00', '2025-10-28 13:30:00', '00:30'),
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', '2025-10-29', '2025-10-29 13:15:00', '2025-10-29 13:45:00', '00:30'),

-- Employee 2
('B901B55E-D8BE-4DEA-A680-C310C8DB483A', '2025-10-28', '2025-10-28 12:45:00', '2025-10-28 13:20:00', '00:35'),
('B901B55E-D8BE-4DEA-A680-C310C8DB483A', '2025-10-29', '2025-10-29 13:10:00', '2025-10-29 13:40:00', '00:30'),

-- Employee 3
('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', '2025-10-28', '2025-10-28 13:05:00', '2025-10-28 13:40:00', '00:35'),
('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', '2025-10-29', '2025-10-29 12:55:00', '2025-10-29 13:25:00', '00:30'),

-- Employee 4 (longer break)
('54478810-F6EA-478E-8202-3D410AB0253B', '2025-10-28', '2025-10-28 12:30:00', '2025-10-28 13:30:00', '01:00'),
('54478810-F6EA-478E-8202-3D410AB0253B', '2025-10-29', '2025-10-29 13:00:00', '2025-10-29 13:40:00', '00:40');
GO
SELECT * FROM WorkBreak;

INSERT INTO BankDetails (EmpID, BankName, AccountNumber, Branch, IFSC, AccountType, NameOnRecord)
VALUES
-- Employee 1
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', 'State Bank of India', '123456789012', 'Pune Main Branch', 'SBIN0000456', 'Savings', 'Gaurav K Thube'),

-- Employee 2
('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', 'HDFC Bank', '987654321098', 'Mumbai Central', 'HDFC0001234', 'Current', 'Ajay B Pise'),

-- Employee 3
('F150C6D4-2F93-41D0-806B-378926660153', 'ICICI Bank', '456123789654', 'Nagpur Civil Lines', 'ICIC0000567', 'Savings', 'Atharv S Supekar'),

-- Employee 4
('54478810-F6EA-478E-8202-3D410AB0253B', 'Axis Bank', '321789654123', 'Nashik City', 'UTIB0000987', 'Salary', 'Shambhuraje S Bhosale'),

-- Employee 5
('B901B55E-D8BE-4DEA-A680-C310C8DB483A', 'Bank of Maharashtra', '741258963000', 'Sambhaji Nagar Branch', 'MAHB0000789', 'Savings', 'Sanika U Ghodake');
GO
SELECT * FROM BankDetails;

INSERT INTO FamilyMembers (EmpID, RelationTypeId, FirstName, MiddleName, LastName, MobileNumber, DOB, GenderTypeID, BloodGroupID, Nationality)
VALUES
-- Employee 1 Family
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', '9FB10ABF-7E90-4F95-A0AC-1CFFB859C68F', 'Kailas', NULL, 'Thube', '9876543210', '1970-05-10', '8D702544-3544-4CEF-99FF-7B19101CED55', '806F3A95-3AC4-4665-8062-82EB74DC6919', 'Indian'),
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', 'A34A2DA1-A594-48C8-9304-1EBC0D1AED1A', 'Meena', 'Kailas', 'Thube', '9876501234', '1975-08-22', 'AC8EBD54-D89D-4464-BFB4-FF41EB6CCA67', '32B85662-DF50-455E-95D6-536964DCA908', 'Indian'),

-- Employee 2 Family
('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', '9FB10ABF-7E90-4F95-A0AC-1CFFB859C68F', 'Baburao', NULL, 'Pise', '9876512345', '1968-12-11', '8D702544-3544-4CEF-99FF-7B19101CED55', '117A9226-0E29-4A49-BACB-0D565FFE006F', 'Indian'),
('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', 'A34A2DA1-A594-48C8-9304-1EBC0D1AED1A', 'Asha', 'Baburao', 'Pise', '9876523456', '1972-09-17', 'AC8EBD54-D89D-4464-BFB4-FF41EB6CCA67', '4137BBE7-72B2-4C29-B65C-1A9B064F9D4F', 'Indian'),

-- Employee 3 Family
('B901B55E-D8BE-4DEA-A680-C310C8DB483A', '9FB10ABF-7E90-4F95-A0AC-1CFFB859C68F', 'Umesh', NULL, 'Ghodake', '9876534567', '1971-07-30', '8D702544-3544-4CEF-99FF-7B19101CED55', '32B85662-DF50-455E-95D6-536964DCA908', 'Indian'),
('B901B55E-D8BE-4DEA-A680-C310C8DB483A', 'A34A2DA1-A594-48C8-9304-1EBC0D1AED1A', 'Manisha', 'Umesh', 'Ghodake', '9876545678', '1976-11-05', 'AC8EBD54-D89D-4464-BFB4-FF41EB6CCA67', '169D33C7-771E-49E2-841B-6E56866F5E71', 'Indian');
GO
SELECT * FROM FamilyMembers;

INSERT INTO Identifiers (EmpID, IdentifierTypeId, Number, IssuedDate, ExpiryDate, FileName, FilePath, Verified)
VALUES
-- Employee 1
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', '35296069-CFCB-4C6E-B8CD-DCCA502E5565', '1234-5678-9012', '2015-01-10', NULL, 'Aadhar_Gaurav.pdf', '/uploads/identifiers/aadhar/', '2025-11-01 10:00:00'),
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', '81BCB22C-BB45-4812-9717-B2B9C989788F', 'ABCDE1234F', '2012-03-15', NULL, 'PAN_Gaurav.pdf', '/uploads/identifiers/pan/', '2025-11-01 10:00:00'),
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', '8A5703C8-755C-4969-BF3D-F7B22C55C380', 'MH12 2020123456789', '2019-05-12', '2039-05-11', 'DL_Gaurav.pdf', '/uploads/identifiers/dl/', '2025-01-10 10:00:00'),

-- Employee 2
('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', '35296069-CFCB-4C6E-B8CD-DCCA502E5565', '9876-5432-1098', '2016-08-22', NULL, 'Aadhar_Ajay.pdf', '/uploads/identifiers/aadhar/', '2025-11-01 10:00:00'),
('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', '81BCB22C-BB45-4812-9717-B2B9C989788F', 'PQRES5678G', '2014-02-10', NULL, 'PAN_Ajay.pdf', '/uploads/identifiers/pan/', '2025-11-01 10:00:00'),

-- Employee 3
('B901B55E-D8BE-4DEA-A680-C310C8DB483A', '35296069-CFCB-4C6E-B8CD-DCCA502E5565', '4567-8901-2345', '2017-11-05', NULL, 'Aadhar_Sanika.pdf', '/uploads/identifiers/aadhar/', '2025-11-01 10:00:00'),
('B901B55E-D8BE-4DEA-A680-C310C8DB483A', '81BCB22C-BB45-4812-9717-B2B9C989788F', 'LMNOP3456K', '2013-04-18', NULL, 'PAN_Sanika.pdf', '/uploads/identifiers/pan/', '2025-11-01 10:00:00');
GO
SELECT * FROM Identifiers;

INSERT INTO Leaves (EmpID, LeaveType, FromDate, ToDate, Reason, Status)
VALUES
('F150C6D4-2F93-41D0-806B-378926660153', 'Casual', '2025-11-01', '2025-11-03', 'Personal work', 'Approved'),
('54478810-F6EA-478E-8202-3D410AB0253B', ' Sick', '2025-10-20', '2025-10-22', 'Flu and fever', 'Pending'),
('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', 'Vacation', '2025-12-15', '2025-12-25', 'Family vacation', 'Rejected'),
('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', 'Casual', '2025-11-10', '2025-11-11', 'Personal reasons', 'Approved'),
('B901B55E-D8BE-4DEA-A680-C310C8DB483A', 'Sick', '2025-10-25', '2025-10-27', 'Doctors appointment', 'Pending');
GO
SELECT * FROM Leaves;

INSERT INTO PFAccount ( EmpID, PFNumber, UAN, PFJoinDate, KYCStatus, KYCDocument, Verified)
VALUES
  ('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', 'PF001234', 'UAN123456789', '2015-01-10', 'Verified', 'kyc_emp001.pdf', '2025-11-01'),
  ('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', 'PF001235', 'UAN123456790', '2018-03-15', 'Verified', 'kyc_emp002.pdf', '2025-11-01'),
  ('F150C6D4-2F93-41D0-806B-378926660153', 'PF001236', 'UAN123456791', '2016-07-20', 'Pending', 'kyc_emp003.pdf', NULL),
  ('54478810-F6EA-478E-8202-3D410AB0253B', 'PF001237', 'UAN123456792', '2017-05-25', 'Verified', 'kyc_emp004.pdf', '2025-11-01'),
  ('B901B55E-D8BE-4DEA-A680-C310C8DB483A', 'PF001238', 'UAN123456793', '2014-09-01', 'Verified', 'kyc_emp005.pdf', '2025-11-01');
GO
SELECT * FROM PFAccount;

INSERT INTO EmpRole (EmpID, RoleId)
VALUES
  ('F150C6D4-2F93-41D0-806B-378926660153','5542F016-5BAA-4534-91F3-9158E519755A'),
  ('54478810-F6EA-478E-8202-3D410AB0253B','645A0AD3-4C88-4BC4-9483-C8978C8843D4'),
  ('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A','51E61AF8-D4E5-48CF-806A-C9D3298C0B9E'),
  ('8016A585-53C2-4C7E-A6C8-AFFAEE048A05','F17B07FC-EEAD-4EC1-A1BC-DD1536F0F137'),
  ('B901B55E-D8BE-4DEA-A680-C310C8DB483A','2FF5FA45-DD20-41C3-A304-40CE4CC38002');
GO
SELECT * FROM EmpRole;

INSERT INTO RefreshTokens (EmpID, Token, ExpiresAt, RevokedAt, RevokedByIp, ReplacedToken)
VALUES
  ('F150C6D4-2F93-41D0-806B-378926660153', 'refresh_token_emp001_' + CONVERT(VARCHAR(36), NEWID()), DATEADD(DAY, 7, SYSDATETIME()), NULL, '192.168.1.1', NULL),
  ('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', 'refresh_token_emp002_' + CONVERT(VARCHAR(36), NEWID()), DATEADD(DAY, 7, SYSDATETIME()), NULL, '192.168.1.2', NULL),
  ('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', 'refresh_token_emp003_' + CONVERT(VARCHAR(36), NEWID()), DATEADD(DAY, 7, SYSDATETIME()), NULL, '191.178.2.3', NULL),
  ('B901B55E-D8BE-4DEA-A680-C310C8DB483A', 'refresh_token_emp004_' + CONVERT(VARCHAR(36), NEWID()), DATEADD(DAY, 7, SYSDATETIME()), NULL, '10.0.0.4', NULL),
  ('54478810-F6EA-478E-8202-3D410AB0253B', 'refresh_token_emp005_' + CONVERT(VARCHAR(36), NEWID()), DATEADD(DAY, 7, SYSDATETIME()), NULL, '172.16.0.5', NULL);
GO
SELECT * FROM RefreshTokens;

INSERT INTO AuthManager ( EmpID, PasswordHash, PasswordResetToken, PasswordResetTokenExpires, LastLoginDate, LoginAttempts, AccountLockedUntil)
VALUES
  ('F150C6D4-2F93-41D0-806B-378926660153', '$2a$12$e0oicJLULDNG3IpuVbqBZ.iRjpWlXQvsqoLLxnqIcLjJW5dZCPhBO', NULL, NULL, DATEADD(DAY,-1,SYSDATETIME()), 2, NULL),
  ('54478810-F6EA-478E-8202-3D410AB0253B', '$2a$12$gLLCMkDDmPKjKbwZvvt6DOy2KEanR0uno2YCThDzlG9Qtv/ufFQl2', 'eyJhbGciOiJ.IUzI1NiIsInR5cCI6.IkpXVCJ9.eyJVc2VySWQiOiIxMT.ExMTExMS0x', DATEADD(DAY,2,SYSDATETIME()), SYSDATETIME(), 0, NULL),
  ('3DB1271C-96EC-4E3B-8CC1-984F3E4D122A', '$2a$12$n/DjUPyfD9stz90TvmDTiOLelTNDQjUdjS1zr6ugm0sBLUMugMBJa', NULL, NULL, DATEADD(DAY,-5,SYSDATETIME()), 1, NULL),
  ('8016A585-53C2-4C7E-A6C8-AFFAEE048A05', '$2a$12$Ywp.PC31h/7x2awjL1clK.bM9WYYhJQ1NHWXpPfefFFC2MfqRoRli', 'eyJhbGciOiJ.IUzI1NiIsInR5cCI6.IkpXVCJ9.eyJVc2VySWQiOiIyMj.IyMjIyMi0y', DATEADD(DAY,1,SYSDATETIME()), NULL, 3, DATEADD(HOUR,2,SYSDATETIME())),
  ('B901B55E-D8BE-4DEA-A680-C310C8DB483A', '$2a$12$on4c.U3cIVcc4v4p3.LYmeM9e.hl5ZudluWOQ38z7lO5kDixSRyaS', NULL, NULL, DATEADD(DAY,-2,SYSDATETIME()), 0, NULL);
GO
SELECT * FROM AuthManager;
