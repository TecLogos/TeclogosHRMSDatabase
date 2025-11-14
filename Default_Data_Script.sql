

USE TeclogosHRMS_DEV;
GO

-- Create SYSTEM Admin User

DECLARE @SystemAdminID UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000001';

IF NOT EXISTS (SELECT 1 FROM [Employees] WHERE ID = @SystemAdminID)
BEGIN
    -- Disable FK Constraints
    ALTER TABLE [GenderType] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [BloodGroup] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [MaritalStatus] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [IdentifierType] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [LeaveType] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [RelationType] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [Department] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [Designation] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [Shifts] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [Roles] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [OfficeHolidays] NOCHECK CONSTRAINT ALL;
    ALTER TABLE [AuthManager] NOCHECK CONSTRAINT ALL;

    INSERT INTO [Employees] 
        ([ID], [Code], [FirstName], [MiddleName], [LastName], [Email], [MobileNumber], 
         [Extension], [ResidentialStatus], [Nationality], [Religion], 
         [PhysicallyChallenged], [InternationalEmployee],
         [JoiningDate], [IsActive], [IsDeleted], [Created], [CreatedByID])
    VALUES 
        (@SystemAdminID, 'SYS0000', 'System', 'Admin', 'User', 'system@teclogos.local', '9999999999',
         'System', 'System', 'Universal', 'Universal', 0, 0,
         GETDATE(), 1, 0, GETDATE(), @SystemAdminID);
END
ELSE

BEGIN
    SELECT @SystemAdminID = ID FROM [Employees] WHERE Code = 'SYS0000';
END;

-- Re-enable FK Constraints
ALTER TABLE [GenderType] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [BloodGroup] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [MaritalStatus] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [IdentifierType] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [LeaveType] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [RelationType] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [Department] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [Designation] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [Shifts] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [Roles] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [OfficeHolidays] WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE [AuthManager] WITH CHECK CHECK CONSTRAINT ALL;


-- GENDER TYPES

IF NOT EXISTS (SELECT 1 FROM [GenderType] WHERE [Name] = 'Male')
BEGIN
    INSERT INTO [GenderType] ([Name], [CreatedByID]) 
    VALUES 
        ('Male', @SystemAdminID), 
        ('Female', @SystemAdminID), 
        ('Other', @SystemAdminID);
END;


-- MARITAL STATUS

IF NOT EXISTS (SELECT 1 FROM [MaritalStatus] WHERE [Name] = 'Single')
BEGIN
    INSERT INTO [MaritalStatus] ([Name], [CreatedByID]) 
    VALUES 
        ('Single', @SystemAdminID), 
        ('Married', @SystemAdminID), 
        ('Divorced', @SystemAdminID), 
        ('Widowed', @SystemAdminID), 
        ('Separated', @SystemAdminID);
END;

-- BLOOD GROUPS

IF NOT EXISTS (SELECT 1 FROM [BloodGroup] WHERE [Name] = 'O+')
BEGIN
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
END;

   
   -- Insert Shifts
    
IF NOT EXISTS (SELECT 1 FROM [Shifts] WHERE [Name] = 'General Shift')
BEGIN
    INSERT INTO [Shifts] ([ID], [Name], [StartTime], [EndTime], [BreakDuration], [StandardHrs], [LateThreshold], [CreatedByID]) 
    VALUES  
        (@SystemAdminID, 'General Shift', '09:30:00', '19:30:00', '01:00:00', '09:00:00', '00:15:00', @SystemAdminID);
END;

-- IDENTIFIER TYPES

IF NOT EXISTS (SELECT 1 FROM [IdentifierType] WHERE [Name] = 'Aadhaar Card')
BEGIN
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
END;

-- LEAVE TYPES

IF NOT EXISTS (SELECT 1 FROM [LeaveType] WHERE [Name] = 'Loss Of Pay')
BEGIN
    INSERT INTO [LeaveType] ([Name], [CreatedByID]) 
    VALUES 
        ('Loss Of Pay', @SystemAdminID),
        ('Comp - Off', @SystemAdminID),
        ('Half day', @SystemAdminID),
        ('Earned leave', @SystemAdminID),
        ('Sick Causal Leaves', @SystemAdminID),
        ('Restricted Holiday', @SystemAdminID),
        ('Paternity Leave', @SystemAdminID);
END;

-- RELATION TYPES

IF NOT EXISTS (SELECT 1 FROM [RelationType] WHERE [Name] = 'Father')
BEGIN
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
END;


-- OFFICE HOLIDAYS

IF NOT EXISTS (SELECT 1 FROM [OfficeHolidays] WHERE [Name] = 'New Year')
BEGIN
    INSERT INTO [OfficeHolidays] ([Name], [HolidayDate], [CreatedByID]) 
    VALUES
        ('New Year', '2025-01-01', @SystemAdminID),
        ('Republic Day', '2025-01-26', @SystemAdminID),
        ('Maharashtra Day', '2025-05-01', @SystemAdminID),
        ('Independence Day', '2025-08-15', @SystemAdminID),
        ('Christmas', '2025-12-25', @SystemAdminID);
END;

GO
