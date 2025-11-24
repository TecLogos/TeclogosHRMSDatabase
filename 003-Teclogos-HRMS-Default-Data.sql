
USE TeclogosHRMS_DEV;
GO

-- Create SYSTEM Admin User

DECLARE @SystemAdminID UNIQUEIDENTIFIER = '113BE8D4-8E6C-42B9-8EF2-49187CF74D0E';

INSERT INTO [Employees] 
([ID], [Code], [FirstName], [MiddleName], [LastName], [Email],
 [MobileNumber], [Extension], [ResidentialStatus], [Nationality],
 [Religion], [JoiningDate], [CreatedByID])
VALUES 
(@SystemAdminID, 'SYS0000', 'System', 'Admin', 'User', 'system@teclogos.local', 
'9999999999', 'System', 'System', 'Universal', 
'Universal', GETDATE(), @SystemAdminID);

-- GENDER TYPES

INSERT INTO [GenderType] ([Name], [CreatedByID]) 
VALUES 
('Male', @SystemAdminID), 
('Female', @SystemAdminID),
('Other', @SystemAdminID);

-- MARITAL STATUS


INSERT INTO [MaritalStatus] ([Name], [CreatedByID]) 
VALUES 
('Single', @SystemAdminID), 
('Married', @SystemAdminID), 
('Divorced', @SystemAdminID), 
('Widowed', @SystemAdminID), 
('Separated', @SystemAdminID);


-- BLOOD GROUPS

INSERT INTO [BloodGroup] ([Name], [CreatedByID]) 
VALUES 
('O+', @SystemAdminID), 
('O-', @SystemAdminID), 
('A+', @SystemAdminID), 
('A-', @SystemAdminID), 
('B+', @SystemAdminID), 
('B-', @SystemAdminID), 
('AB+', @SystemAdminID), 
('AB-', @SystemAdminID);
   
-- Insert Shifts
    
INSERT INTO [Shifts] ([ID], [Name], [StartTime], [EndTime], [BreakDuration], [StandardHrs], [LateThreshold], [CreatedByID]) 
VALUES  
(@SystemAdminID, 'General Shift', '09:30:00', '19:30:00', '01:00:00', '09:00:00', '00:15:00', @SystemAdminID);

-- IDENTIFIER TYPES

INSERT INTO [IdentifierType] ([Name], [CreatedByID]) 
VALUES 
('Aadhaar Card', @SystemAdminID),
('PAN Card', @SystemAdminID),
('Passport', @SystemAdminID),
('Driving License', @SystemAdminID),
('Voter ID', @SystemAdminID),
('Ration Card', @SystemAdminID),
('Birth Certificate', @SystemAdminID),
('Marriage Certificate', @SystemAdminID),
('National ID Card', @SystemAdminID),
('Residence Permit', @SystemAdminID),
('Work Permit', @SystemAdminID),
('Tax Identification Number', @SystemAdminID);

-- Insert Departments
    
INSERT INTO [Department] ([Name], [CreatedByID]) 
VALUES 
('Human Resources', @SystemAdminID), 
('Finance', @SystemAdminID), 
('Administration', @SystemAdminID);
   
--  Insert Designations
    
INSERT INTO [Designation] ([Name], [CreatedByID]) 
VALUES 
('Chief Executive Officer', @SystemAdminID), 
('Chief Technology Officer', @SystemAdminID), 
('Chief Financial Officer', @SystemAdminID), 
('Director', @SystemAdminID), 
('General Manager', @SystemAdminID);

-- LEAVE TYPES

INSERT INTO [LeaveType] ([Name], [CreatedByID]) 
VALUES 
('Loss Of Pay', @SystemAdminID),
('Comp - Off', @SystemAdminID),
('Half day', @SystemAdminID),
('Earned leave', @SystemAdminID),
('Sick Causal Leaves', @SystemAdminID),
('Restricted Holiday', @SystemAdminID),
('Paternity Leave', @SystemAdminID);

-- RELATION TYPES

INSERT INTO [RelationType] ([Name], [CreatedByID]) 
VALUES 
('Father', @SystemAdminID),
('Mother', @SystemAdminID),
('Spouse', @SystemAdminID),
('Brother', @SystemAdminID),
('Sister', @SystemAdminID),
('Son', @SystemAdminID),
('Daughter', @SystemAdminID),
('Guardian', @SystemAdminID),
('Friend', @SystemAdminID);

-- OFFICE HOLIDAYS

INSERT INTO [OfficeHolidays] ([Name], [HolidayDate], [CreatedByID]) 
VALUES
('New Year', '2025-01-01', @SystemAdminID),
('Republic Day', '2025-01-26', @SystemAdminID),
('Maharashtra Day', '2025-05-01', @SystemAdminID),
('Independence Day', '2025-08-15', @SystemAdminID),
('Christmas', '2025-12-25', @SystemAdminID);

GO
