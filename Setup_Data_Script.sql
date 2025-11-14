
USE TeclogosHRMS_DEV;
GO

    -- Get SYSTEM Admin ID (created in default data script)
    
    DECLARE @SystemAdminID UNIQUEIDENTIFIER;
    
    SELECT @SystemAdminID = ID FROM [Employees] WHERE Code = 'SYS0000';
    
    IF @SystemAdminID IS NULL
    BEGIN
        PRINT 'ERROR: SYSTEM Admin user not found!';
        THROW 50000, 'SYSTEM Admin user not found. Run default data script first.', 1;
    END;

    -- Insert Departments
    
    IF NOT EXISTS (SELECT 1 FROM [Department] WHERE [Name] = 'Human Resources')
    BEGIN
        INSERT INTO [Department] ([Name], [CreatedByID]) 
        VALUES 
            ('Human Resources', @SystemAdminID), 
            ('Finance', @SystemAdminID), 
            ('Information Technology', @SystemAdminID), 
            ('Administration', @SystemAdminID), 
            ('Sales', @SystemAdminID), 
            ('Marketing', @SystemAdminID), 
            ('Operations', @SystemAdminID);
    END;

    --  Insert Designations
    
    IF NOT EXISTS (SELECT 1 FROM [Designation] WHERE [Name] = 'Chief Executive Officer')
    BEGIN
        INSERT INTO [Designation] ([Name], [CreatedByID]) 
        VALUES 
            ('Chief Executive Officer', @SystemAdminID), 
            ('Chief Technology Officer', @SystemAdminID), 
            ('Chief Financial Officer', @SystemAdminID), 
            ('Director', @SystemAdminID), 
            ('General Manager', @SystemAdminID), 
            ('HR Manager', @SystemAdminID), 
            ('Finance Manager', @SystemAdminID), 
            ('Project Manager', @SystemAdminID), 
            ('Software Architect', @SystemAdminID), 
            ('Team Lead', @SystemAdminID), 
            ('Senior Software Engineer', @SystemAdminID), 
            ('Software Engineer', @SystemAdminID);

    END;

    -- Insert Shifts
    
    IF NOT EXISTS (SELECT 1 FROM [Shifts] WHERE [Name] = 'General Shift')
    BEGIN
        INSERT INTO [Shifts] ([Name], [StartTime], [EndTime], [BreakDuration], [StandardHrs], [LateThreshold], [CreatedByID]) 
        VALUES  
            ('General Shift', '09:30:00', '19:30:00', '01:00:00', '09:00:00', '00:15:00', @SystemAdminID),
            ('Morning Shift', '06:00:00', '14:00:00', '00:45:00', '07:15:00', '00:10:00', @SystemAdminID),
            ('Afternoon Shift', '14:00:00', '22:00:00', '00:45:00', '07:15:00', '00:10:00', @SystemAdminID),
            ('Night Shift', '22:00:00', '06:00:00', '00:45:00', '07:15:00', '00:10:00', @SystemAdminID),
            ('Half Day Shift', '09:00:00', '13:00:00', '00:15:00', '03:45:00', '00:10:00', @SystemAdminID),
            ('Weekend Shift', '10:00:00', '16:00:00', '00:30:00', '05:30:00', '00:10:00', @SystemAdminID);
    END;


    --  Insert Roles
    
    IF NOT EXISTS (SELECT 1 FROM [Roles] WHERE [Name] = 'Admin')
    BEGIN
        INSERT INTO [Roles] ([Name], [Description], [CreatedByID]) 
        VALUES
            ('Admin', 'Administrative control for managing employees, departments, and system configurations.', @SystemAdminID),
            ('HR Manager', 'Manages employee lifecycle, attendance, leaves, payroll, and compliance activities.', @SystemAdminID),
            ('Manager', 'Supervises a team, manages approvals, and monitors task and performance data.', @SystemAdminID),
            ('Employee', 'Regular employee access to attendance, leave, and personal data.', @SystemAdminID);
 
    END;

    -- Insert Company-Specific Office Holidays (Teclogos)
    
    IF NOT EXISTS (SELECT 1 FROM [OfficeHolidays] WHERE [Name] = 'Holi' AND [HolidayDate] = '2025-03-14')
    BEGIN
        INSERT INTO [OfficeHolidays] ([Name], [HolidayDate], [CreatedByID]) 
        VALUES
            ('Holi', '2025-03-14', @SystemAdminID),
            ('Maharashtra Day', '2025-05-01', @SystemAdminID),
            ('Ganesh Chaturthi', '2025-08-27', @SystemAdminID),
            ('Gandhi Jayanti/Dussehra', '2025-10-02', @SystemAdminID),
            ('Diwali', '2025-10-18', @SystemAdminID),
            ('Diwali', '2025-10-20', @SystemAdminID),
            ('Diwali', '2025-10-21', @SystemAdminID),
            ('Padva', '2025-10-22', @SystemAdminID),
            ('Bhaiduj', '2025-10-23', @SystemAdminID);
    END;

GO




