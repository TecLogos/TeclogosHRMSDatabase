USE TeclogosHRMS_DEV;
GO

SET NOCOUNT ON;

BEGIN TRANSACTION;

BEGIN TRY

    -- DECLARE VARIABLES

    DECLARE @Counter INT = 1;
    DECLARE @TotalEmployees INT = 2000;
    
    -- Lookup Table IDs
    DECLARE @MaleID UNIQUEIDENTIFIER;
    DECLARE @FemaleID UNIQUEIDENTIFIER;
    DECLARE @SingleID UNIQUEIDENTIFIER;
    DECLARE @MarriedID UNIQUEIDENTIFIER;
    DECLARE @APlusID UNIQUEIDENTIFIER;
    DECLARE @OPlusID UNIQUEIDENTIFIER;
    DECLARE @BMinusID UNIQUEIDENTIFIER;
    DECLARE @ABPlusID UNIQUEIDENTIFIER;
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
    DECLARE @EveningShiftID UNIQUEIDENTIFIER;
    DECLARE @EarnedLeaveID UNIQUEIDENTIFIER;
    DECLARE @SickLeaveID UNIQUEIDENTIFIER;
    DECLARE @CompOffID UNIQUEIDENTIFIER;
    DECLARE @CasualLeaveID UNIQUEIDENTIFIER;
    DECLARE @EmployeeRoleID UNIQUEIDENTIFIER;
    DECLARE @ManagerRoleID UNIQUEIDENTIFIER;
    DECLARE @HRMgrRoleID UNIQUEIDENTIFIER;
    DECLARE @AdminRoleID UNIQUEIDENTIFIER;
    DECLARE @FatherRelID UNIQUEIDENTIFIER;
    DECLARE @MotherRelID UNIQUEIDENTIFIER;
    DECLARE @SpouseRelID UNIQUEIDENTIFIER;
    DECLARE @AadhaarTypeID UNIQUEIDENTIFIER;
    DECLARE @PANTypeID UNIQUEIDENTIFIER;
    DECLARE @DrivingLicenseTypeID UNIQUEIDENTIFIER;
    DECLARE @PassportTypeID UNIQUEIDENTIFIER;
    
    -- Working Variables
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
    DECLARE @MaritalStatusID UNIQUEIDENTIFIER;
    DECLARE @AttendanceShiftID UNIQUEIDENTIFIER;
    DECLARE @EmployeeShiftID UNIQUEIDENTIFIER;
    DECLARE @PasswordHash NVARCHAR(MAX);
    DECLARE @AttendanceDate DATETIME2;
    DECLARE @InTime DATETIME2;
    DECLARE @OutTime DATETIME2;
    DECLARE @SystemAdminID UNIQUEIDENTIFIER;
    DECLARE @CounterStr NVARCHAR(5);
    DECLARE @ReportingManagerID UNIQUEIDENTIFIER;
    DECLARE @FamilyFirstName NVARCHAR(50);

    -- Randomization Flags for Optional Tables/Records
    DECLARE @IsAttendanceApplicable BIT;
    DECLARE @IsWorkBreakApplicable BIT;
    DECLARE @IsBankDetailsApplicable BIT;
    DECLARE @IsFamilyApplicable BIT;
    DECLARE @IsIdentifiersApplicable BIT;
    DECLARE @IsLeaveRequestApplicable BIT;
    DECLARE @IsPFAccountApplicable BIT;
    DECLARE @IsEmployeeShiftApplicable BIT;
    DECLARE @IsEmployeeRoleApplicable BIT;
    DECLARE @IsAuthManagerApplicable BIT;
    DECLARE @IsRefreshTokenApplicable BIT;
    
    -- Randomization Flags for Nullable Fields within Employee
    DECLARE @HasEmail BIT;
    DECLARE @HasExtension BIT;
    DECLARE @HasMiddleName BIT;
    DECLARE @HasResidentialStatus BIT;
    DECLARE @HasDOB BIT;
    DECLARE @HasPlaceOfBirth BIT;
    DECLARE @HasGenderType BIT;
    DECLARE @HasBloodGroup BIT;
    DECLARE @HasMaritalStatus BIT;
    DECLARE @HasMarriageDate BIT;
    DECLARE @HasNationality BIT;
    DECLARE @HasReligion BIT;
    DECLARE @HasCaste BIT;
    DECLARE @HasHeight BIT;
    DECLARE @HasWeight BIT;
    DECLARE @HasIdentificationMark BIT;
    DECLARE @HasHobby BIT;
    DECLARE @HasDepartment BIT;
    DECLARE @HasDesignation BIT;
    DECLARE @HasReportingManager BIT;


    -- GET SYSTEM ADMIN ID

    SELECT @SystemAdminID = ID FROM [Employees] WHERE Code = 'SYS0000';


    -- RETRIEVE ALL LOOKUP TABLE IDs

    SELECT @MaleID = ID FROM [GenderType] WHERE [Name] = 'Male';
    SELECT @FemaleID = ID FROM [GenderType] WHERE [Name] = 'Female';
    SELECT @SingleID = ID FROM [MaritalStatus] WHERE [Name] = 'Single';
    SELECT @MarriedID = ID FROM [MaritalStatus] WHERE [Name] = 'Married';
    SELECT @APlusID = ID FROM [BloodGroup] WHERE [Name] = 'A+';
    SELECT @OPlusID = ID FROM [BloodGroup] WHERE [Name] = 'O+';
    SELECT @BMinusID = ID FROM [BloodGroup] WHERE [Name] = 'B-';
    SELECT @ABPlusID = ID FROM [BloodGroup] WHERE [Name] = 'AB+';
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
    SELECT @EveningShiftID = ID FROM [Shifts] WHERE [Name] = 'Evening Shift';
    SELECT @EarnedLeaveID = ID FROM [LeaveType] WHERE [Name] = 'Earned leave';
    SELECT @SickLeaveID = ID FROM [LeaveType] WHERE [Name] = 'Sick Causal Leaves';
    SELECT @CompOffID = ID FROM [LeaveType] WHERE [Name] = 'Comp - Off';
    SELECT @CasualLeaveID = ID FROM [LeaveType] WHERE [Name] = 'Casual leave';
    SELECT @EmployeeRoleID = ID FROM [Roles] WHERE [Name] = 'Employee';
    SELECT @ManagerRoleID = ID FROM [Roles] WHERE [Name] = 'Manager';
    SELECT @HRMgrRoleID = ID FROM [Roles] WHERE [Name] = 'HR Manager';
    SELECT @AdminRoleID = ID FROM [Roles] WHERE [Name] = 'Admin';
    SELECT @FatherRelID = ID FROM [RelationType] WHERE [Name] = 'Father';
    SELECT @MotherRelID = ID FROM [RelationType] WHERE [Name] = 'Mother';
    SELECT @SpouseRelID = ID FROM [RelationType] WHERE [Name] = 'Spouse';
    SELECT @AadhaarTypeID = ID FROM [IdentifierType] WHERE [Name] = 'Aadhaar Card';
    SELECT @PANTypeID = ID FROM [IdentifierType] WHERE [Name] = 'PAN Card';
    SELECT @DrivingLicenseTypeID = ID FROM [IdentifierType] WHERE [Name] = 'Driving License';
    SELECT @PassportTypeID = ID FROM [IdentifierType] WHERE [Name] = 'Passport';

    -- Set fallbacks for nullable lookups
    IF @MorningShiftID IS NULL SET @MorningShiftID = @GeneralShiftID;
    IF @EveningShiftID IS NULL SET @EveningShiftID = @GeneralShiftID;
    IF @SickLeaveID IS NULL SET @SickLeaveID = @EarnedLeaveID;
    IF @CompOffID IS NULL SET @CompOffID = @EarnedLeaveID;
    IF @CasualLeaveID IS NULL SET @CasualLeaveID = @EarnedLeaveID;
    IF @ManagerRoleID IS NULL SET @ManagerRoleID = @EmployeeRoleID;
    IF @HRMgrRoleID IS NULL SET @HRMgrRoleID = @EmployeeRoleID;
    IF @AdminRoleID IS NULL SET @AdminRoleID = @EmployeeRoleID;
    IF @MotherRelID IS NULL SET @MotherRelID = @FatherRelID;
    IF @SpouseRelID IS NULL SET @SpouseRelID = @FatherRelID;
    IF @PANTypeID IS NULL SET @PANTypeID = @AadhaarTypeID;
    IF @DrivingLicenseTypeID IS NULL SET @DrivingLicenseTypeID = @AadhaarTypeID;
    IF @PassportTypeID IS NULL SET @PassportTypeID = @AadhaarTypeID;


    -- MAIN LOOP: INSERT 2000 EMPLOYEES

    WHILE (@Counter <= @TotalEmployees)
    BEGIN
        SET @EmployeeID = NEWID();
        SET @CounterStr = RIGHT('00000' + CAST(@Counter AS NVARCHAR(5)), 5);
        SET @EmployeeCode = 'EMP' + @CounterStr;
        
        -- Randomize nullable fields
        SET @HasEmail = CAST(RAND() * 2 AS INT);
        SET @HasExtension = CAST(RAND() * 2 AS INT);
        SET @HasMiddleName = CAST(RAND() * 2 AS INT);
        SET @HasResidentialStatus = CAST(RAND() * 2 AS INT);
        SET @HasDOB = CAST(RAND() * 2 AS INT);
        SET @HasPlaceOfBirth = CAST(RAND() * 2 AS INT);
        SET @HasGenderType = CAST(RAND() * 2 AS INT);
        SET @HasBloodGroup = CAST(RAND() * 2 AS INT);
        SET @HasMaritalStatus = CAST(RAND() * 2 AS INT);
        SET @HasNationality = CAST(RAND() * 2 AS INT);
        SET @HasReligion = CAST(RAND() * 2 AS INT);
        SET @HasCaste = CAST(RAND() * 2 AS INT);
        SET @HasHeight = CAST(RAND() * 2 AS INT);
        SET @HasWeight = CAST(RAND() * 2 AS INT);
        SET @HasIdentificationMark = CAST(RAND() * 2 AS INT);
        SET @HasHobby = CAST(RAND() * 2 AS INT);
        SET @HasDepartment = CAST(RAND() * 2 AS INT);
        SET @HasDesignation = CAST(RAND() * 2 AS INT);
        SET @HasReportingManager = CAST(RAND() * 2 AS INT);
        
        -- Generate varied names

        SET @FirstName = CASE 
            WHEN @Counter % 10 = 0 THEN 'Rajesh'
            WHEN @Counter % 10 = 1 THEN 'Priya'
            WHEN @Counter % 10 = 2 THEN 'Amit'
            WHEN @Counter % 10 = 3 THEN 'Neha'
            WHEN @Counter % 10 = 4 THEN 'Atul'
            WHEN @Counter % 10 = 5 THEN 'Anaya'
            WHEN @Counter % 10 = 6 THEN 'Manish'
            WHEN @Counter % 10 = 7 THEN 'Sneha'
            ELSE 'Pooja'
        END;
        
        SET @MiddleName = CASE 
            WHEN @Counter % 7 = 0 THEN 'Sunil'
            WHEN @Counter % 7 = 1 THEN 'Mohan'
            WHEN @Counter % 7 = 2 THEN 'Pratap'
            WHEN @Counter % 7 = 3 THEN 'Arun'
            WHEN @Counter % 7 = 4 THEN 'Vikram'
            WHEN @Counter % 7 = 5 THEN 'Kumar'
            ELSE 'Raj'
        END;
        
        SET @LastName = CASE 
            WHEN @Counter % 8 = 0 THEN 'Sharma'
            WHEN @Counter % 8 = 1 THEN 'Deshpande'
            WHEN @Counter % 8 = 2 THEN 'Kulkarni'
            WHEN @Counter % 8 = 3 THEN 'Joshi'
            WHEN @Counter % 8 = 4 THEN 'Gupta'
            WHEN @Counter % 8 = 5 THEN 'Verma'
            WHEN @Counter % 8 = 6 THEN 'Patil'
            ELSE 'Singh'
        END;
        
        IF (@HasEmail = 1)
            SET @Email = LOWER(@FirstName) + '.' + LOWER(@LastName) + @CounterStr + '@teclogos.test';
        ELSE
            SET @Email = NULL;
        
        SET @MobileNumber = '98765' + RIGHT('00000' + CAST(40000 + @Counter AS NVARCHAR(5)), 5);
        
        IF (@HasExtension = 1)
            SET @Extension = 'Pune-' + @CounterStr;
        ELSE
            SET @Extension = NULL;
        
        IF (@HasGenderType = 1)
            SET @GenderID = CASE WHEN @Counter % 2 = 0 THEN @MaleID ELSE @FemaleID END;
        ELSE
            SET @GenderID = NULL;
        
        IF (@HasBloodGroup = 1)
            SET @BloodGroupID = CASE 
                WHEN @Counter % 4 = 0 THEN @APlusID
                WHEN @Counter % 4 = 1 THEN @OPlusID
                WHEN @Counter % 4 = 2 THEN @BMinusID
                ELSE @ABPlusID
            END;
        ELSE
            SET @BloodGroupID = NULL;
        
        IF (@HasMaritalStatus = 1)
            SET @MaritalStatusID = CASE WHEN @Counter % 3 = 0 THEN @MarriedID ELSE @SingleID END;
        ELSE
            SET @MaritalStatusID = NULL;
        
        IF (@HasDepartment = 1)
            SET @DepartmentID = CASE 
                WHEN @Counter % 7 = 0 THEN @ITDeptID
                WHEN @Counter % 7 = 1 THEN @HRDeptID
                WHEN @Counter % 7 = 2 THEN @SalesDeptID
                WHEN @Counter % 7 = 3 THEN @FinanceDeptID
                WHEN @Counter % 7 = 4 THEN @AdminDeptID
                WHEN @Counter % 7 = 5 THEN @MarketingDeptID
                ELSE @OpsDeptID
            END;
        ELSE
            SET @DepartmentID = NULL;
        
        IF (@HasDesignation = 1)
        BEGIN
            SET @DesignationID = CASE 
                WHEN @Counter % 100 <= 70 THEN @SoftEngDesignID
                WHEN @Counter % 100 <= 85 THEN @TeamLeadDesignID
                WHEN @Counter % 100 <= 92 THEN @SeniorSoftEngDesignID
                WHEN @Counter % 100 <= 97 THEN @ManagerDesignID
                ELSE @DirectorDesignID
            END;
        END
        ELSE
            SET @DesignationID = NULL;

        IF (@HasReportingManager = 1 AND @Counter > 50)
        BEGIN
            SELECT TOP 1 @ReportingManagerID = ID 
            FROM [Employees] 
            WHERE DesignationID IN (@ManagerDesignID, @DirectorDesignID)
            ORDER BY NEWID();
        END
        ELSE
            SET @ReportingManagerID = NULL;

        -- INSERT EMPLOYEE

        INSERT INTO [Employees] 
            ([ID], [Code], [FirstName], [MiddleName], [LastName], [Email], [MobileNumber], 
             [Extension], [ResidentialStatus], [DOB], [PlaceOfBirth], [GenderTypeID], [BloodGroupID], 
             [MaritalStatusID], [MarriageDate], [Nationality], [Religion], [Caste], [PhysicallyChallenged], 
             [InternationalEmployee], [HeightInCm], [WeightInKG], [IDentificationMark], [Hobby], 
             [JoiningDate], [DepartmentID], [DesignationID], [ReportingManagerID], [CreatedByID])
        VALUES 
            (@EmployeeID, @EmployeeCode, @FirstName, 
             CASE WHEN @HasMiddleName = 1 THEN @MiddleName ELSE NULL END,
             @LastName, @Email, @MobileNumber, @Extension,
             CASE WHEN @HasResidentialStatus = 1 THEN 
                 CASE WHEN @Counter % 3 = 0 THEN 'Owned' 
                      WHEN @Counter % 3 = 1 THEN 'Rented' 
                      ELSE 'Hostel' END 
             ELSE NULL END,
             CASE WHEN @HasDOB = 1 THEN DATEADD(DAY, -(ABS(CHECKSUM(NEWID())) % 10950), DATEADD(YEAR, -25, GETDATE())) ELSE NULL END,
             CASE WHEN @HasPlaceOfBirth = 1 THEN 
                 CASE WHEN @Counter % 5 = 0 THEN 'Pune' 
                      WHEN @Counter % 5 = 1 THEN 'Mumbai' 
                      WHEN @Counter % 5 = 2 THEN 'Nagpur'
                      WHEN @Counter % 5 = 3 THEN 'Delhi'
                      ELSE 'Bangalore' END 
             ELSE NULL END,
             @GenderID, @BloodGroupID, @MaritalStatusID,
             CASE WHEN @MaritalStatusID = @MarriedID THEN DATEADD(YEAR, -(@Counter % 10), GETDATE()) ELSE NULL END,
             CASE WHEN @HasNationality = 1 THEN 'Indian' ELSE NULL END,
             CASE WHEN @HasReligion = 1 THEN 
                 CASE WHEN @Counter % 4 = 0 THEN 'Hindu' 
                      WHEN @Counter % 4 = 1 THEN 'Muslim'
                      WHEN @Counter % 4 = 2 THEN 'Christian'
                      ELSE 'Sikh' END 
             ELSE NULL END,
             CASE WHEN @HasCaste = 1 THEN 
                 CASE WHEN @Counter % 3 = 0 THEN 'General' 
                      WHEN @Counter % 3 = 1 THEN 'OBC'
                      ELSE 'SC' END 
             ELSE NULL END,
             CASE WHEN @Counter % 20 = 0 THEN 1 ELSE 0 END,
             CASE WHEN @Counter % 50 = 0 THEN 1 ELSE 0 END,
             CASE WHEN @HasHeight = 1 THEN 165.00 + (@Counter % 30) ELSE NULL END,
             CASE WHEN @HasWeight = 1 THEN 55.00 + (@Counter % 25) ELSE NULL END,
             CASE WHEN @HasIdentificationMark = 1 THEN 
                 CASE WHEN @Counter % 3 = 0 THEN 'Scar on left hand' 
                      WHEN @Counter % 3 = 1 THEN 'Mole on face'
                      ELSE 'Birthmark on neck' END 
             ELSE NULL END,
             CASE WHEN @HasHobby = 1 THEN 
                 CASE WHEN @Counter % 5 = 0 THEN 'Reading' 
                      WHEN @Counter % 5 = 1 THEN 'Sports'
                      WHEN @Counter % 5 = 2 THEN 'Music'
                      WHEN @Counter % 5 = 3 THEN 'Traveling'
                      ELSE 'Cooking' END 
             ELSE NULL END,
             DATEADD(MONTH, -(@Counter % 60), GETDATE()), 
             @DepartmentID, @DesignationID, @ReportingManagerID, @SystemAdminID);

        -- ATTENDANCE

        SET @IsAttendanceApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsAttendanceApplicable = 1)
        BEGIN
            SET @AttendanceCounter = 1;
            SET @AttendanceShiftID = CASE 
                WHEN @Counter % 3 = 0 THEN @GeneralShiftID
                WHEN @Counter % 3 = 1 THEN @MorningShiftID
                ELSE @EveningShiftID
            END;
            
            WHILE (@AttendanceCounter <= 10)
            BEGIN
                SET @AttendanceDate = DATEADD(DAY, -@AttendanceCounter, CAST(GETDATE() AS DATETIME2));
                
                IF (CAST(RAND() * 2 AS INT) = 1)
                    SET @InTime = DATEADD(HOUR, 9, DATEADD(MINUTE, 5 + (@Counter % 20), @AttendanceDate));
                ELSE
                    SET @InTime = NULL;
                
                IF (CAST(RAND() * 2 AS INT) = 1)
                    SET @OutTime = DATEADD(HOUR, 18, DATEADD(MINUTE, 0 + (@Counter % 30), @AttendanceDate));
                ELSE
                    SET @OutTime = NULL;
                
                INSERT INTO [Attendance] 
                    ([EmployeeID], [ShiftID], [AttendanceDate], [InTime], [OutTime], [Source], [CreatedByID])
                VALUES 
                    (@EmployeeID, @AttendanceShiftID, CAST(@AttendanceDate AS DATE), @InTime, @OutTime, 
                     @Counter % 2, @SystemAdminID);
                
                SET @AttendanceCounter = @AttendanceCounter + 1;
            END;
        END;

        -- WORKBREAK

        SET @IsWorkBreakApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsWorkBreakApplicable = 1)
        BEGIN
            DECLARE @HasBreakStart BIT = CAST(RAND() * 2 AS INT);
            DECLARE @HasBreakEnd BIT = CAST(RAND() * 2 AS INT);
            
            INSERT INTO [WorkBreak] 
                ([EmployeeID], [WorkBreakDate], [StartDateTime], [EndDateTime], [CreatedByID])
            VALUES 
                (@EmployeeID, CAST(GETDATE() AS DATE),
                 CASE WHEN @HasBreakStart = 1 THEN DATEADD(HOUR, 13, DATEADD(MINUTE, @Counter % 30, CAST(GETDATE() AS DATETIME2))) ELSE NULL END,
                 CASE WHEN @HasBreakEnd = 1 THEN DATEADD(HOUR, 13, DATEADD(MINUTE, 30 + (@Counter % 30), CAST(GETDATE() AS DATETIME2))) ELSE NULL END,
                 @SystemAdminID);
        END;

        -- BANK DETAILS

        SET @IsBankDetailsApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsBankDetailsApplicable = 1)
        BEGIN
            DECLARE @HasBranch BIT = CAST(RAND() * 2 AS INT);
            DECLARE @HasAccountType BIT = CAST(RAND() * 2 AS INT);
            
            INSERT INTO [BankDetails] 
                ([EmployeeID], [BankName], [Branch], [IFSC], [MICR], [AccountType], [AccountNumber], 
                 [NameAsPerRecord], [CreatedByID])
            VALUES 
                (@EmployeeID, 
                 CASE WHEN @Counter % 4 = 0 THEN 'SBI'
                      WHEN @Counter % 4 = 1 THEN 'HDFC'
                      WHEN @Counter % 4 = 2 THEN 'ICICI'
                      ELSE 'Axis Bank' END,
                 CASE WHEN @HasBranch = 1 THEN 
                     CASE WHEN @Counter % 3 = 0 THEN 'Pune' 
                          WHEN @Counter % 3 = 1 THEN 'Mumbai'
                          ELSE 'Bangalore' END 
                 ELSE NULL END,
                 'SBIN0000' + RIGHT('000' + CAST(@Counter % 999 AS NVARCHAR(3)), 3),
                 '411014' + RIGHT('000' + CAST(@Counter % 999 AS NVARCHAR(3)), 3),
                 CASE WHEN @HasAccountType = 1 THEN 
                     CASE WHEN @Counter % 2 = 0 THEN 'Savings' ELSE 'Current' END 
                 ELSE NULL END,
                 '1234567890' + RIGHT('000' + CAST(@Counter % 999 AS NVARCHAR(3)), 3),
                 @FirstName + ' ' + ISNULL(@MiddleName, '') + ' ' + @LastName,
                 @SystemAdminID);
        END;

        -- FAMILY MEMBERS 

        SET @IsFamilyApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsFamilyApplicable = 1)
        BEGIN
            SET @FamilyCounter = 1;
            DECLARE @FamilyMemberCount INT = 2 + (CAST(RAND() * 2 AS INT));
            
            WHILE (@FamilyCounter <= @FamilyMemberCount)
            BEGIN
                DECLARE @FamMiddleName BIT = CAST(RAND() * 2 AS INT);
                DECLARE @FamDOB BIT = CAST(RAND() * 2 AS INT);
                DECLARE @FamMobile BIT = CAST(RAND() * 2 AS INT);
                DECLARE @FamBloodGroup BIT = CAST(RAND() * 2 AS INT);
                DECLARE @FamNationality BIT = CAST(RAND() * 2 AS INT);
                
                DECLARE @RelationTypeID UNIQUEIDENTIFIER = 
                    CASE WHEN @FamilyCounter = 1 THEN @FatherRelID 
                         WHEN @FamilyCounter = 2 THEN @MotherRelID 
                         ELSE @SpouseRelID END;
                
                -- Generate unique family member first name
                SET @FamilyFirstName = CASE 
                    WHEN @FamilyCounter = 1 THEN CASE 
                        WHEN @Counter % 7 = 0 THEN 'Ramesh'
                        WHEN @Counter % 7 = 1 THEN 'Suresh'
                        WHEN @Counter % 7 = 2 THEN 'Mahesh'
                        WHEN @Counter % 7 = 3 THEN 'Dinesh'
                        WHEN @Counter % 7 = 4 THEN 'Ganesh'
                        WHEN @Counter % 7 = 5 THEN 'Naresh'
                        ELSE 'Rajendra'
                    END
                    WHEN @FamilyCounter = 2 THEN CASE 
                        WHEN @Counter % 7 = 0 THEN 'Savita'
                        WHEN @Counter % 7 = 1 THEN 'Sunita'
                        WHEN @Counter % 7 = 2 THEN 'Kavita'
                        WHEN @Counter % 7 = 3 THEN 'Anita'
                        WHEN @Counter % 7 = 4 THEN 'Geeta'
                        WHEN @Counter % 7 = 5 THEN 'Seema'
                        ELSE 'Rekha'
                    END
                    ELSE CASE 
                        WHEN @Counter % 7 = 0 THEN 'Sanjana'
                        WHEN @Counter % 7 = 1 THEN 'Anjali'
                        WHEN @Counter % 7 = 2 THEN 'Riya'
                        WHEN @Counter % 7 = 3 THEN 'Divya'
                        WHEN @Counter % 7 = 4 THEN 'Kavya'
                        WHEN @Counter % 7 = 5 THEN 'Tanvi'
                        ELSE 'Ishita'
                    END
                END;
                
                INSERT INTO [FamilyMembers] 
                    ([EmployeeID], [RelationTypeID], [FirstName], [MiddleName], [LastName], [DOB], 
                     [MobileNumber], [BloodGroupID], [Nationality], [CreatedByID])
                VALUES 
                    (@EmployeeID, @RelationTypeID, @FamilyFirstName,
                     CASE WHEN @FamMiddleName = 1 THEN @MiddleName ELSE NULL END,
                     @LastName, 
                     CASE WHEN @FamDOB = 1 THEN DATEADD(YEAR, -(55 - @FamilyCounter), GETDATE()) ELSE NULL END,
                     CASE WHEN @FamMobile = 1 THEN '98765' + RIGHT('00000' + CAST(50000 + (@Counter * 10 + @FamilyCounter) AS NVARCHAR(5)), 5) ELSE NULL END,
                     CASE WHEN @FamBloodGroup = 1 THEN @BloodGroupID ELSE NULL END,
                     CASE WHEN @FamNationality = 1 THEN 'Indian' ELSE NULL END,
                     @SystemAdminID);
                
                SET @FamilyCounter = @FamilyCounter + 1;
            END;
        END;

        -- IDENTIFIERS

        SET @IsIdentifiersApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsIdentifiersApplicable = 1)
        BEGIN
            DECLARE @IdentifierCount INT = 2 + (CAST(RAND() * 2 AS INT));
            DECLARE @IdCounter INT = 1;
            
            WHILE (@IdCounter <= @IdentifierCount)
            BEGIN
                DECLARE @IdIssuedDate BIT = CAST(RAND() * 2 AS INT);
                DECLARE @IdExpiryDate BIT = CAST(RAND() * 2 AS INT);
                DECLARE @IdFileName BIT = CAST(RAND() * 2 AS INT);
                DECLARE @IdFilePath BIT = CAST(RAND() * 2 AS INT);
                DECLARE @IdVerified BIT = CAST(RAND() * 2 AS INT);
                
                DECLARE @CurrentIdTypeID UNIQUEIDENTIFIER;
                DECLARE @CurrentIdNumber NVARCHAR(50);
                DECLARE @CurrentIdName NVARCHAR(100);
                
                IF (@IdCounter = 1)
                BEGIN
                    SET @CurrentIdTypeID = @AadhaarTypeID;
                    SET @CurrentIdNumber = '1234-5678-' + @CounterStr;
                    SET @CurrentIdName = 'Aadhaar_' + @EmployeeCode + '.pdf';
                END
                ELSE IF (@IdCounter = 2)
                BEGIN
                    SET @CurrentIdTypeID = @PANTypeID;
                    SET @CurrentIdNumber = 'ABCDE' + @CounterStr;
                    SET @CurrentIdName = 'PAN_' + @EmployeeCode + '.pdf';
                END
                ELSE
                BEGIN
                    SET @CurrentIdTypeID = @DrivingLicenseTypeID;
                    SET @CurrentIdNumber = 'MH12202' + @CounterStr;
                    SET @CurrentIdName = 'DL_' + @EmployeeCode + '.pdf';
                END;
                
                INSERT INTO [Identifiers] 
                    ([EmployeeID], [IdentifierTypeID], [Number], [IssuedDate], [ExpiryDate], 
                     [FileName], [FilePath], [Verified], [VerifiedByID], [CreatedByID])
                VALUES 
                    (@EmployeeID, @CurrentIdTypeID, @CurrentIdNumber,
                     CASE WHEN @IdIssuedDate = 1 THEN DATEADD(YEAR, -(4 + @IdCounter), GETDATE()) ELSE NULL END,
                     CASE WHEN @IdExpiryDate = 1 THEN DATEADD(YEAR, (10 + @IdCounter), GETDATE()) ELSE NULL END,
                     CASE WHEN @IdFileName = 1 THEN @CurrentIdName ELSE NULL END,
                     CASE WHEN @IdFilePath = 1 THEN '/ids/' ELSE NULL END,
                     CASE WHEN @IdVerified = 1 THEN DATEADD(YEAR, -1, GETDATE()) ELSE NULL END,
                     CASE WHEN @IdVerified = 1 THEN @SystemAdminID ELSE NULL END,
                     @SystemAdminID);
                
                SET @IdCounter = @IdCounter + 1;
            END;
        END;

        -- LEAVE REQUEST

        SET @IsLeaveRequestApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsLeaveRequestApplicable = 1)
        BEGIN
            DECLARE @LvFromDate BIT = CAST(RAND() * 2 AS INT);
            DECLARE @LvToDate BIT = CAST(RAND() * 2 AS INT);
            DECLARE @LvReason BIT = CAST(RAND() * 2 AS INT);
            
            DECLARE @LeaveTypeID UNIQUEIDENTIFIER = 
                CASE WHEN @Counter % 4 = 0 THEN @EarnedLeaveID 
                     WHEN @Counter % 4 = 1 THEN @SickLeaveID 
                     WHEN @Counter % 4 = 2 THEN @CompOffID
                     ELSE @CasualLeaveID END;
            
            IF @LeaveTypeID IS NULL
                SET @LeaveTypeID = @EarnedLeaveID;
            
            INSERT INTO [LeaveRequest] 
                ([EmployeeID], [LeaveTypeID], [FromDate], [ToDate], [Reason], [Status], [CreatedByID])
            VALUES 
                (@EmployeeID, @LeaveTypeID,
                 CASE WHEN @LvFromDate = 1 THEN DATEADD(DAY, 15 + (@Counter % 30), GETDATE()) ELSE NULL END,
                 CASE WHEN @LvToDate = 1 THEN DATEADD(DAY, 18 + (@Counter % 30), GETDATE()) ELSE NULL END,
                 CASE WHEN @LvReason = 1 THEN 
                     CASE WHEN @Counter % 3 = 0 THEN 'Personal work' 
                          WHEN @Counter % 3 = 1 THEN 'Medical emergency'
                          ELSE 'Family function' END 
                 ELSE NULL END,
                 @Counter % 2, @SystemAdminID);
        END;

        -- PF ACCOUNT

        SET @IsPFAccountApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsPFAccountApplicable = 1)
        BEGIN
            DECLARE @PfJoinDate BIT = CAST(RAND() * 2 AS INT);
            DECLARE @PfKYCStatus BIT = CAST(RAND() * 2 AS INT);
            DECLARE @PfVerified BIT = CAST(RAND() * 2 AS INT);
            
            INSERT INTO [PFAccount] 
                ([EmployeeID], [PFNumber], [UAN], [PFJoinDate], [KYCStatus], [Verified], 
                 [VerifiedByID], [CreatedByID])
            VALUES 
                (@EmployeeID, 'PF' + @CounterStr, 'UAN' + @CounterStr,
                 CASE WHEN @PfJoinDate = 1 THEN DATEADD(MONTH, -(@Counter % 60), GETDATE()) ELSE NULL END,
                 CASE WHEN @PfKYCStatus = 1 THEN 
                     CASE WHEN @Counter % 3 = 0 THEN 'Verified' 
                          WHEN @Counter % 3 = 1 THEN 'Pending'
                          ELSE 'Rejected' END 
                 ELSE NULL END,
                 CASE WHEN @PfVerified = 1 THEN GETDATE() ELSE NULL END,
                 CASE WHEN @PfVerified = 1 THEN @SystemAdminID ELSE NULL END,
                 @SystemAdminID);
        END;

        -- EMPLOYEE SHIFT

        SET @IsEmployeeShiftApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsEmployeeShiftApplicable = 1)
        BEGIN
            SET @EmployeeShiftID = CASE 
                WHEN @Counter % 3 = 0 THEN @GeneralShiftID 
                WHEN @Counter % 3 = 1 THEN @MorningShiftID
                ELSE @EveningShiftID 
            END;
            
            INSERT INTO [EmployeeShifts] 
                ([EmployeeID], [ShiftID], [CreatedByID])
            VALUES 
                (@EmployeeID, @EmployeeShiftID, @SystemAdminID);
        END;

        -- EMPLOYEE ROLE

        SET @IsEmployeeRoleApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsEmployeeRoleApplicable = 1)
        BEGIN
            DECLARE @SelectedRoleID UNIQUEIDENTIFIER = 
                CASE WHEN @Counter % 20 = 0 THEN @AdminRoleID
                     WHEN @Counter % 10 = 0 THEN @ManagerRoleID
                     WHEN @Counter % 5 = 0 THEN @HRMgrRoleID
                     ELSE @EmployeeRoleID END;
            
            IF @SelectedRoleID IS NULL
                SET @SelectedRoleID = @EmployeeRoleID;
            
            INSERT INTO [EmployeeRole] 
                ([EmployeeID], [RoleID], [CreatedByID])
            VALUES 
                (@EmployeeID, @SelectedRoleID, @SystemAdminID);
        END;

        -- AUTH MANAGER

        SET @IsAuthManagerApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsAuthManagerApplicable = 1)
        BEGIN
            SET @PasswordHash = '$2a$12$TestHash' + @CounterStr;
            
            DECLARE @AuthResetToken BIT = CAST(RAND() * 2 AS INT);
            DECLARE @AuthResetExpiry BIT = CAST(RAND() * 2 AS INT);
            DECLARE @AuthIsOnHold BIT = CAST(RAND() * 2 AS INT);
            DECLARE @AuthLastLogin BIT = CAST(RAND() * 2 AS INT);
            DECLARE @AuthLastFailed BIT = CAST(RAND() * 2 AS INT);
            DECLARE @AuthFailedAttempts BIT = CAST(RAND() * 2 AS INT);
            
            INSERT INTO [AuthManager] 
                ([EmployeeID], [PasswordHash], [PasswordResetToken], [PasswordResetTokenExpires],
                 [IsLoginOnHold], [LastLoginDate], [FailedLoginAttempts], [LastFailedLoginAttemptOn], 
                 [CreatedByID])
            VALUES 
                (@EmployeeID, @PasswordHash,
                 CASE WHEN @AuthResetToken = 1 THEN 'reset_token_' + @EmployeeCode ELSE NULL END,
                 CASE WHEN @AuthResetExpiry = 1 THEN DATEADD(HOUR, 24, GETDATE()) ELSE NULL END,
                 CASE WHEN @AuthIsOnHold = 1 THEN 1 ELSE 0 END,
                 CASE WHEN @AuthLastLogin = 1 THEN DATEADD(DAY, -(@Counter % 30), GETDATE()) ELSE NULL END,
                 CASE WHEN @AuthFailedAttempts = 1 THEN @Counter % 3 ELSE NULL END,
                 CASE WHEN @AuthLastFailed = 1 THEN DATEADD(DAY, -(@Counter % 7), GETDATE()) ELSE NULL END,
                 @SystemAdminID);
        END;

        -- REFRESH TOKEN

        SET @IsRefreshTokenApplicable = CAST(RAND() * 2 AS INT);
        
        IF (@IsRefreshTokenApplicable = 1)
        BEGIN
            DECLARE @TokenRevokedAt BIT = CAST(RAND() * 2 AS INT);
            DECLARE @TokenRevokedIP BIT = CAST(RAND() * 2 AS INT);
            DECLARE @TokenReplaced BIT = CAST(RAND() * 2 AS INT);
            
            INSERT INTO [RefreshTokens] 
                ([EmployeeID], [Token], [ExpiresAt], [RevokedAt], [RevokedByIp], [ReplacedToken], [CreatedByID])
            VALUES 
                (@EmployeeID,
                 'refresh_token_' + @EmployeeCode + '_' + CAST(@Counter AS NVARCHAR(10)),
                 DATEADD(DAY, 7, GETDATE()),
                 CASE WHEN @TokenRevokedAt = 1 THEN DATEADD(DAY, -(@Counter % 5), GETDATE()) ELSE NULL END,
                 CASE WHEN @TokenRevokedIP = 1 THEN '192.168.1.' + CAST((@Counter % 254) + 1 AS NVARCHAR(3)) ELSE NULL END,
                 CASE WHEN @TokenReplaced = 1 THEN 'old_refresh_token_' + @EmployeeCode ELSE NULL END,
                 @SystemAdminID);
        END;

        SET @Counter = @Counter + 1;
    END;

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorLine INT = ERROR_LINE();
    
    RAISERROR('Error at employee %d, Line %d: %s', 16, 1, @Counter, @ErrorLine, @ErrorMessage);
    THROW;
END CATCH;

GO

SET NOCOUNT OFF;
