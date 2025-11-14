

USE TeclogosHRMS_DEV;
GO

SET NOCOUNT ON;

BEGIN TRANSACTION;

BEGIN TRY
    -- Declare Variables --

    DECLARE @Counter INT = 1;
    DECLARE @TotalEmployees INT = 2000;
    DECLARE @MaleID UNIQUEIDENTIFIER;
    DECLARE @FemaleID UNIQUEIDENTIFIER;
    DECLARE @SingleID UNIQUEIDENTIFIER;
    DECLARE @MarriedID UNIQUEIDENTIFIER;
    DECLARE @APlusID UNIQUEIDENTIFIER;
    DECLARE @OPlusID UNIQUEIDENTIFIER;
    DECLARE @BMinusID UNIQUEIDENTIFIER;
    DECLARE @ITDeptID UNIQUEIDENTIFIER;
    DECLARE @HRDeptID UNIQUEIDENTIFIER;
    DECLARE @SalesDeptID UNIQUEIDENTIFIER;
    DECLARE @FinanceDeptID UNIQUEIDENTIFIER;
    DECLARE @AdminDeptID UNIQUEIDENTIFIER;
    DECLARE @MarketingDeptID UNIQUEIDENTIFIER;
    DECLARE @OpsDeptID UNIQUEIDENTIFIER;
    DECLARE @SoftEngDesignID UNIQUEIDENTIFIER;
    DECLARE @TeamLeadDesignID UNIQUEIDENTIFIER;
    DECLARE @SeniorSoftEngDesignID UNIQUEIDENTIFIER;
    DECLARE @ManagerDesignID UNIQUEIDENTIFIER;
    DECLARE @DirectorDesignID UNIQUEIDENTIFIER;
    DECLARE @GeneralShiftID UNIQUEIDENTIFIER;
    DECLARE @MorningShiftID UNIQUEIDENTIFIER;
    DECLARE @EarnedLeaveID UNIQUEIDENTIFIER;
    DECLARE @SickLeaveID UNIQUEIDENTIFIER;
    DECLARE @CompOffID UNIQUEIDENTIFIER;
    DECLARE @EmployeeRoleID UNIQUEIDENTIFIER;
    DECLARE @ManagerRoleID UNIQUEIDENTIFIER;
    DECLARE @HRMgrRoleID UNIQUEIDENTIFIER;
    DECLARE @AdminRoleID UNIQUEIDENTIFIER;
    DECLARE @FatherRelID UNIQUEIDENTIFIER;
    DECLARE @MotherRelID UNIQUEIDENTIFIER;
    DECLARE @AadhaarTypeID UNIQUEIDENTIFIER;
    DECLARE @PANTypeID UNIQUEIDENTIFIER;
    DECLARE @DrivingLicenseTypeID UNIQUEIDENTIFIER;
    DECLARE @EmployeeID UNIQUEIDENTIFIER;
    DECLARE @AttendanceCounter INT;
    DECLARE @FamilyCounter INT;
    DECLARE @FirstName NVARCHAR(50);
    DECLARE @MiddleName NVARCHAR(50);
    DECLARE @LastName NVARCHAR(50);
    DECLARE @Email NVARCHAR(100);
    DECLARE @MobileNumber NVARCHAR(15);
    DECLARE @EmployeeCode NVARCHAR(20);
    DECLARE @Extension NVARCHAR(20);
    DECLARE @GenderID UNIQUEIDENTIFIER;
    DECLARE @BloodGroupID UNIQUEIDENTIFIER;
    DECLARE @DepartmentID UNIQUEIDENTIFIER;
    DECLARE @DesignationID UNIQUEIDENTIFIER;
    DECLARE @PasswordHash NVARCHAR(MAX);
    DECLARE @AttendanceDate DATETIME2;
    DECLARE @InTime DATETIME2;
    DECLARE @OutTime DATETIME2;
    DECLARE @SystemAdminID UNIQUEIDENTIFIER;
    DECLARE @CounterStr NVARCHAR(5);

    -- Get SYSTEM Admin ID --
    SELECT @SystemAdminID = ID FROM [Employees] WHERE Code = 'SYS0000';
    
    IF @SystemAdminID IS NULL
        THROW 50000, 'SYSTEM Admin not found. Run default data script first.', 1;

    -- Get All IDs --
 
    SELECT @MaleID = ID FROM [GenderType] WHERE [Name] = 'Male';
    SELECT @FemaleID = ID FROM [GenderType] WHERE [Name] = 'Female';
    SELECT @SingleID = ID FROM [MaritalStatus] WHERE [Name] = 'Single';
    SELECT @MarriedID = ID FROM [MaritalStatus] WHERE [Name] = 'Married';
    SELECT @APlusID = ID FROM [BloodGroup] WHERE [Name] = 'A+';
    SELECT @OPlusID = ID FROM [BloodGroup] WHERE [Name] = 'O+';
    SELECT @BMinusID = ID FROM [BloodGroup] WHERE [Name] = 'B-';
    SELECT @ITDeptID = ID FROM [Department] WHERE [Name] = 'Information Technology';
    SELECT @HRDeptID = ID FROM [Department] WHERE [Name] = 'Human Resources';
    SELECT @SalesDeptID = ID FROM [Department] WHERE [Name] = 'Sales';
    SELECT @FinanceDeptID = ID FROM [Department] WHERE [Name] = 'Finance';
    SELECT @AdminDeptID = ID FROM [Department] WHERE [Name] = 'Administration';
    SELECT @MarketingDeptID = ID FROM [Department] WHERE [Name] = 'Marketing';
    SELECT @OpsDeptID = ID FROM [Department] WHERE [Name] = 'Operations';
    SELECT @SoftEngDesignID = ID FROM [Designation] WHERE [Name] = 'Software Engineer';
    SELECT @TeamLeadDesignID = ID FROM [Designation] WHERE [Name] = 'Team Lead';
    SELECT @SeniorSoftEngDesignID = ID FROM [Designation] WHERE [Name] = 'Senior Software Engineer';
    SELECT @ManagerDesignID = ID FROM [Designation] WHERE [Name] = 'General Manager';
    SELECT @DirectorDesignID = ID FROM [Designation] WHERE [Name] = 'Director';
    SELECT @GeneralShiftID = ID FROM [Shifts] WHERE [Name] = 'General Shift';
    SELECT @MorningShiftID = ID FROM [Shifts] WHERE [Name] = 'Morning Shift';
    SELECT @EarnedLeaveID = ID FROM [LeaveType] WHERE [Name] = 'Earned leave';
    SELECT @SickLeaveID = ID FROM [LeaveType] WHERE [Name] = 'Sick Causal Leaves';
    SELECT @CompOffID = ID FROM [LeaveType] WHERE [Name] = 'Comp - Off';
    SELECT @EmployeeRoleID = ID FROM [Roles] WHERE [Name] = 'Employee';
    SELECT @ManagerRoleID = ID FROM [Roles] WHERE [Name] = 'Manager';
    SELECT @HRMgrRoleID = ID FROM [Roles] WHERE [Name] = 'HR Manager';
    SELECT @AdminRoleID = ID FROM [Roles] WHERE [Name] = 'Admin';
    SELECT @FatherRelID = ID FROM [RelationType] WHERE [Name] = 'Father';
    SELECT @MotherRelID = ID FROM [RelationType] WHERE [Name] = 'Mother';
    SELECT @AadhaarTypeID = ID FROM [IdentifierType] WHERE [Name] = 'Aadhaar Card';
    SELECT @PANTypeID = ID FROM [IdentifierType] WHERE [Name] = 'PAN Card';
    SELECT @DrivingLicenseTypeID = ID FROM [IdentifierType] WHERE [Name] = 'Driving License';
    

    -- Validation checks IDs --
 
    IF @GeneralShiftID IS NULL
    BEGIN
        PRINT 'ERROR : General Shift not found!';
        THROW 50001, 'General Shift not found. Check Shifts table.', 1;
    END
    
    IF @MorningShiftID IS NULL
    BEGIN
        PRINT 'ERROR : Morning Shift not found, using General Shift instead';
        SET @MorningShiftID = @GeneralShiftID;
    END
    
    IF @EarnedLeaveID IS NULL
        THROW 50002, 'ERROR : Earned leave not found in LeaveType table.', 1;
    
    IF @EmployeeRoleID IS NULL
        THROW 50003, 'ERROR : Employee role not found in Roles table.', 1;
    
    IF @SystemAdminID IS NULL
        THROW 50004, 'ERROR : SYSTEM Admin not found in Employees table.', 1;

    
    -- Loop - Insert 2000 employees --

    WHILE (@Counter <= @TotalEmployees)
    BEGIN
        SET @EmployeeID = NEWID();
        SET @CounterStr = RIGHT('00000' + CAST(@Counter AS NVARCHAR(5)), 5);
        SET @EmployeeCode = 'EMP' + @CounterStr;
        
        -- Generate varied first names --
        SET @FirstName = CASE 
            WHEN @Counter % 7 = 1 THEN 'Rajesh'
            WHEN @Counter % 7 = 2 THEN 'Priya'
            WHEN @Counter % 7 = 3 THEN 'Amit'
            WHEN @Counter % 7 = 4 THEN 'Neha'
            WHEN @Counter % 7 = 5 THEN 'Atul'
            WHEN @Counter % 7 = 6 THEN 'Anaya'
            ELSE 'Manish'
        END;
        
        -- Generate varied middle names --
        SET @MiddleName = CASE 
            WHEN @Counter % 5 = 1 THEN 'Sunil'
            WHEN @Counter % 5 = 2 THEN 'Mohan'
            WHEN @Counter % 5 = 3 THEN 'Pratap'
            WHEN @Counter % 5 = 4 THEN 'Arun'
            ELSE 'Vikram'
        END;
        
        -- Generate varied last names --
        SET @LastName = CASE 
            WHEN @Counter % 6 = 1 THEN 'Sharma'
            WHEN @Counter % 6 = 2 THEN 'Deshpande'
            WHEN @Counter % 6 = 3 THEN 'Kulkarni'
            WHEN @Counter % 6 = 4 THEN 'Joshi'
            WHEN @Counter % 6 = 5 THEN 'Gupta'
            ELSE 'Verma'
        END;
        
        SET @Email = LOWER(@FirstName) + '.' + LOWER(@LastName) + @CounterStr + '@teclogos.test';
        SET @MobileNumber = '98765' + RIGHT('00000' + CAST(40000 + @Counter AS NVARCHAR(5)), 5);
        SET @Extension = 'Pune-' + @CounterStr;
        
        -- Alternate gender --
        SET @GenderID = CASE WHEN @Counter % 10 <= 5 THEN @MaleID ELSE @FemaleID END;
        
        -- Distribute blood groups --
        SET @BloodGroupID = CASE 
            WHEN @Counter % 3 = 0 THEN @APlusID
            WHEN @Counter % 3 = 1 THEN @OPlusID
            ELSE @BMinusID
        END;
        
        -- Distribute across departments --
        SET @DepartmentID = CASE 
            WHEN @Counter % 7 = 1 THEN @ITDeptID
            WHEN @Counter % 7 = 2 THEN @HRDeptID
            WHEN @Counter % 7 = 3 THEN @SalesDeptID
            WHEN @Counter % 7 = 4 THEN @FinanceDeptID
            WHEN @Counter % 7 = 5 THEN @AdminDeptID
            WHEN @Counter % 7 = 6 THEN @MarketingDeptID
            ELSE @OpsDeptID
        END;
        
        -- Distribute designations --
        SET @DesignationID = CASE 
            WHEN @Counter % 100 <= 70 THEN @SoftEngDesignID
            WHEN @Counter % 100 <= 85 THEN @TeamLeadDesignID
            WHEN @Counter % 100 <= 95 THEN @SeniorSoftEngDesignID
            ELSE @ManagerDesignID
        END;

        -- 1. INSERT EMPLOYEE --
        
        INSERT INTO [Employees] 
            ([ID], [Code], [FirstName], [MiddleName], [LastName], [Email], [MobileNumber], 
             [Extension], [ResidentialStatus], [DOB], [PlaceOfBirth], [GenderTypeID], [BloodGroupID], 
             [MaritalStatusID], [Nationality], [Religion], [Caste], [PhysicallyChallenged], 
             [InternationalEmployee], [HeightInCm], [WeightInKG], [Hobby], [JoiningDate], 
             [DepartmentID], [DesignationID], [CreatedByID])
        VALUES 
            (@EmployeeID, @EmployeeCode, @FirstName, @MiddleName, @LastName, @Email, @MobileNumber, 
             @Extension,
             CASE WHEN @Counter % 3 = 0 THEN 'Owned' WHEN @Counter % 3 = 1 THEN 'Rented' ELSE 'Hostel' END,
              DATEADD(DAY, -(ABS(CHECKSUM(NEWID())) % 3650), DATEADD(YEAR, -25, GETDATE())),
              CASE WHEN @Counter % 3 = 0 THEN 'Pune' WHEN @Counter % 3 = 1 THEN 'Mumbai' ELSE 'Nagpur' END, 
             @GenderID, @BloodGroupID, CASE WHEN @Counter % 3 = 0 THEN @MarriedID ELSE @SingleID END,
             'Indian', 'Hindu', 'General', 0, 0, 
             170.00 + (@Counter % 20), 65.00 + (@Counter % 10), 
             'Sports', DATEADD(MONTH, -(@Counter % 24), GETDATE()), 
             @DepartmentID, @DesignationID, @SystemAdminID);


        -- 2. INSERT 10 ATTENDANCE RECORDS PER EMPLOYEE --

        SET @AttendanceCounter = 1;
        WHILE (@AttendanceCounter <= 10)
        BEGIN
            SET @AttendanceDate = DATEADD(DAY, -@AttendanceCounter, CAST(GETDATE() AS DATETIME2));
            SET @InTime = DATEADD(HOUR, 9, DATEADD(MINUTE, 5 + (@Counter % 20), @AttendanceDate));
            SET @OutTime = DATEADD(HOUR, 18, DATEADD(MINUTE, 0 + (@Counter % 30), @AttendanceDate));
            
            INSERT INTO [Attendance] 
                ([EmployeeID], [ShiftID], [AttendanceDate], [InTime], [OutTime], [Source], [CreatedByID])
            VALUES 
                (@EmployeeID, @GeneralShiftID, CAST(@AttendanceDate AS DATE), @InTime, @OutTime, 0, @SystemAdminID);
            
            SET @AttendanceCounter = @AttendanceCounter + 1;
        END;


        -- 3. INSERT WORKBREAK --

        INSERT INTO [WorkBreak] 
            ([EmployeeID], [WorkBreakDate], [StartDateTime], [EndDateTime], [CreatedByID])
        VALUES 
            (@EmployeeID, CAST(GETDATE() AS DATE),
             DATEADD(HOUR, 13, DATEADD(MINUTE, @Counter % 30, CAST(GETDATE() AS DATETIME2))),
             DATEADD(HOUR, 13, DATEADD(MINUTE, 30 + (@Counter % 30), CAST(GETDATE() AS DATETIME2))),
             @SystemAdminID);


        -- 4. INSERT BANK DETAILS --

        INSERT INTO [BankDetails] 
            ([EmployeeID], [BankName], [Branch], [IFSC], [MICR], [AccountType], [AccountNumber], 
             [NameAsPerRecord], [CreatedByID])
        VALUES 
            (@EmployeeID, 
             CASE WHEN @Counter % 3 = 1 THEN 'SBI'
                  WHEN @Counter % 3 = 2 THEN 'HDFC'
                  ELSE 'ICICI' END,
             'Pune',
             'SBIN0000' + RIGHT('000' + CAST(@Counter % 100 AS NVARCHAR(3)), 3),
             '411014' + RIGHT('000' + CAST(@Counter % 100 AS NVARCHAR(3)), 3),
             'Savings',
             '1234567890' + RIGHT('00' + CAST(@Counter % 100 AS NVARCHAR(2)), 2),
             @FirstName + ' ' + @LastName,
             @SystemAdminID);


        -- 5. INSERT 2 FAMILY MEMBERS PER EMPLOYEE --

        SET @FamilyCounter = 1;
        WHILE (@FamilyCounter <= 2)
        BEGIN
            INSERT INTO [FamilyMembers] 
                ([EmployeeID], [RelationTypeID], [FirstName], [LastName], [DOB], [MobileNumber], 
                 [BloodGroupID], [Nationality], [CreatedByID])
            VALUES 
                (@EmployeeID, 
                 CASE WHEN @FamilyCounter = 1 THEN @FatherRelID ELSE @MotherRelID END,
                 CASE WHEN @FamilyCounter = 1 THEN 'Father' ELSE 'Mother' END,
                 @LastName, 
                 DATEADD(YEAR, -55 + @FamilyCounter, GETDATE()),
                 '98765' + RIGHT('00000' + CAST(50000 + (@Counter % 1000) AS NVARCHAR(5)), 5),
                 @BloodGroupID,
                 'Indian',
                 @SystemAdminID);
            
            SET @FamilyCounter = @FamilyCounter + 1;
        END;


        -- 6. INSERT 3 IDENTIFIERS PER EMPLOYEE --

        INSERT INTO [Identifiers] 
            ([EmployeeID], [IdentifierTypeID], [Number], [IssuedDate], [ExpiryDate], 
             [FileName], [FilePath], [Verified], [CreatedByID])
        VALUES 
            (@EmployeeID, @AadhaarTypeID, 
             '1234-5678-' + @CounterStr,
             DATEADD(YEAR, -8, GETDATE()), NULL, 
             'Aadhaar_' + @EmployeeCode + '.pdf', '/ids/', 
             DATEADD(YEAR, -1, GETDATE()), @SystemAdminID),
            (@EmployeeID, @PANTypeID, 
             'ABCDE' + @CounterStr,
             DATEADD(YEAR, -12, GETDATE()), NULL, 
             'PAN_' + @EmployeeCode + '.pdf', '/ids/', 
             DATEADD(YEAR, -1, GETDATE()), @SystemAdminID),
            (@EmployeeID, @DrivingLicenseTypeID, 
             'MH12202' + @CounterStr,
             DATEADD(YEAR, -4, GETDATE()), DATEADD(YEAR, 16, GETDATE()), 
             'DL_' + @EmployeeCode + '.pdf', '/ids/', 
             DATEADD(YEAR, -1, GETDATE()), @SystemAdminID);


        -- 7. INSERT LEAVE REQUEST --

        INSERT INTO [LeaveRequest] 
            ([EmployeeID], [LeaveTypeID], [FromDate], [ToDate], [Reason], [Status], [CreatedByID])
        VALUES 
            (@EmployeeID, 
             CASE WHEN @Counter % 3 = 0 THEN @EarnedLeaveID 
                  WHEN @Counter % 3 = 1 THEN @SickLeaveID 
                  ELSE @CompOffID END,
             DATEADD(DAY, 15 + (@Counter % 30), GETDATE()),
             DATEADD(DAY, 17 + (@Counter % 30), GETDATE()),
             'Leave',
             @Counter % 2,
             @SystemAdminID);


        -- 8. INSERT PF ACCOUNT --

        INSERT INTO [PFAccount] 
            ([EmployeeID], [PFNumber], [UAN], [PFJoinDate], [KYCStatus], [Verified], [CreatedByID])
        VALUES 
            (@EmployeeID,
             'PF' + @CounterStr,
             'UAN' + @CounterStr,
             DATEADD(MONTH, -(@Counter % 60), GETDATE()),
             CASE WHEN @Counter % 2 = 0 THEN 'Verified' ELSE 'Pending' END,
             CASE WHEN @Counter % 2 = 0 THEN GETDATE() ELSE NULL END,
             @SystemAdminID);


        -- 9. INSERT EMPLOYEE SHIFT --

        INSERT INTO [EmployeeShifts] 
            ([EmployeeID], [ShiftID], [CreatedByID])
        VALUES 
            (@EmployeeID, 
             CASE WHEN @Counter % 2 = 0 THEN @GeneralShiftID ELSE @GeneralShiftID END, 
             @SystemAdminID);


        -- 10. INSERT EMPLOYEE ROLE --

        INSERT INTO [EmployeeRole] 
            ([EmployeeID], [RoleID], [CreatedByID])
        VALUES 
            (@EmployeeID, 
             CASE WHEN @Counter % 20 = 0 THEN @AdminRoleID
                  WHEN @Counter % 10 = 0 THEN @ManagerRoleID
                  WHEN @Counter % 5 = 0 THEN @HRMgrRoleID
                  ELSE @EmployeeRoleID END,
             @SystemAdminID);


        -- 11. INSERT AUTH MANAGER --

        SET @PasswordHash = '$2a$12$TestHash' + @CounterStr;
        
        INSERT INTO [AuthManager] 
            ([EmployeeID], [PasswordHash], [FailedLoginAttempts], [LastLoginDate], [CreatedByID])
        VALUES 
            (@EmployeeID, @PasswordHash, 0, DATEADD(DAY, -(@Counter % 7), GETDATE()), @SystemAdminID);


        -- 12. INSERT REFRESH TOKEN --

        INSERT INTO [RefreshTokens] 
            ([EmployeeID], [Token], [ExpiresAt], [CreatedByID])
        VALUES 
            (@EmployeeID,
             'refresh_token_' + @EmployeeCode,
             DATEADD(DAY, 7, GETDATE()),
             @SystemAdminID);

        SET @Counter = @Counter + 1;
    END;

        COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

GO

SET NOCOUNT OFF;