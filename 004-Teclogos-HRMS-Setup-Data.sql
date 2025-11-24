
USE TeclogosHRMS_DEV;
GO

-- Get SYSTEM Admin ID (created in default data script)
    
DECLARE @SystemAdminID UNIQUEIDENTIFIER;
    
SELECT @SystemAdminID = ID FROM [Employees] WHERE Code = 'SYS0000';
    

-- Insert Departments
    
    INSERT INTO [Department] ([Name], [CreatedByID]) 
    VALUES 
        ('Information Technology', @SystemAdminID),  
        ('Sales', @SystemAdminID), 
        ('Marketing', @SystemAdminID), 
        ('Operations', @SystemAdminID);


--  Insert Designations
    
    INSERT INTO [Designation] ([Name], [CreatedByID]) 
    VALUES 
        ('HR Manager', @SystemAdminID), 
        ('Finance Manager', @SystemAdminID), 
        ('Project Manager', @SystemAdminID), 
        ('Software Architect', @SystemAdminID), 
        ('Team Lead', @SystemAdminID), 
        ('Senior Software Engineer', @SystemAdminID), 
        ('Software Engineer', @SystemAdminID);

-- Insert Shifts

    INSERT INTO [Shifts] ([ID], [Name], [StartTime], [EndTime], [BreakDuration], [StandardHrs], [LateThreshold], [CreatedByID]) 
    VALUES  
        (@SystemAdminID, 'General Shift', '09:30:00', '19:30:00', '01:00:00', '09:00:00', '00:15:00', @SystemAdminID),
        (@SystemAdminID, 'Morning Shift', '06:00:00', '14:00:00', '00:45:00', '07:15:00', '00:10:00', @SystemAdminID),
        (@SystemAdminID, 'Afternoon Shift', '14:00:00', '22:00:00', '00:45:00', '07:15:00', '00:10:00', @SystemAdminID),
        (@SystemAdminID, 'Night Shift', '22:00:00', '06:00:00', '00:45:00', '07:15:00', '00:10:00', @SystemAdminID),
        (@SystemAdminID, 'Half Day Shift', '09:00:00', '13:00:00', '00:15:00', '03:45:00', '00:10:00', @SystemAdminID),
        (@SystemAdminID, 'Weekend Shift', '10:00:00', '16:00:00', '00:30:00', '05:30:00', '00:10:00', @SystemAdminID);

--  Insert Roles
    
    INSERT INTO [Roles] ([Name], [Description], [CreatedByID]) 
    VALUES
        ('Admin', 'Administrative control for managing employees, departments, and system configurations.', @SystemAdminID),
        ('HR Manager', 'Manages employee lifecycle, attendance, leaves, payroll, and compliance activities.', @SystemAdminID),
        ('Manager', 'Supervises a team, manages approvals, and monitors task and performance data.', @SystemAdminID),
        ('Employee', 'Regular employee access to attendance, leave, and personal data.', @SystemAdminID);
 
-- Insert Company-Specific Office Holidays (Teclogos)
    
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

GO




