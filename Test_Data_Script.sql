
USE TeclogosHRMS_DEV;
GO

BEGIN

-- INSERT MASTER DATA FIRST

INSERT INTO [GenderType] ([Name]) VALUES ('Male'), ('Female'), ('Other');

INSERT INTO [MaritalStatus] ([Name]) VALUES ('Single'), ('Married'), ('Divorced'), ('Widowed'), ('Separated');

INSERT INTO [BloodGroup] ([Name]) VALUES ('O+'), ('O-'), ('A+'), ('A-'), ('B+'), ('B-'), ('AB+'), ('AB-');

INSERT INTO [Department] ([Name]) VALUES ('Human Resources'), ('Finance'), ('Information Technology'), ('Administration'), ('Sales'), ('Marketing'), ('Operations');

INSERT INTO [Designation] ([Name]) VALUES ('Chief Executive Officer'), ('Chief Technology Officer'), ('Chief Financial Officer'), ('Director'), ('General Manager'), ('HR Manager'), ('Finance Manager'), ('Project Manager'), ('Software Architect'), ('Team Lead'), ('Senior Software Engineer'), ('Software Engineer');

INSERT INTO [Shifts] ([Name], [StartTime], [EndTime], [BreakDuration], [StandardHrs], [LateThreshold]) VALUES
('General Shift', '09:00:00', '18:00:00', '01:00:00', '08:00:00', '00:15:00'),
('Morning Shift', '06:00:00', '14:00:00', '00:45:00', '07:15:00', '00:10:00'),
('Afternoon Shift', '14:00:00', '22:00:00', '00:45:00', '07:15:00', '00:10:00'),
('Night Shift', '22:00:00', '06:00:00', '00:45:00', '07:15:00', '00:10:00'),
('Half Day Shift', '09:00:00', '13:00:00', '00:15:00', '03:45:00', '00:10:00'),
('Weekend Shift', '10:00:00', '16:00:00', '00:30:00', '05:30:00', '00:10:00');

INSERT INTO [RelationType] ([Name]) VALUES ('Father'), ('Mother'), ('Spouse'), ('Brother'), ('Sister'), ('Son'), ('Daughter'), ('Guardian'), ('Friend');

INSERT INTO [IdentifierType] ([Name]) VALUES ('Aadhaar Card'), ('PAN Card'), ('Passport'), ('Driving License'), ('Voter ID'), ('Ration Card'), ('Birth Certificate'), ('Marriage Certificate'), ('National ID Card'), ('Residence Permit'), ('Work Permit'), ('Social Security Number'), ('Tax Identification Number');

INSERT INTO [LeaveType] ([Name]) VALUES ('Loss Of Pay'), ('Comp - Off'), ('Half day'), ('Earned leave'), ('Sick Causal Leaves'), ('Restricted Holiday'), ('Paternity Leave');

INSERT INTO [Roles] ([Name], [Description]) VALUES
('Admin', 'Administrative control for managing employees, departments, and system configurations.'),
('HR Manager', 'Manages employee lifecycle, attendance, leaves, payroll, and compliance activities.'),
('Manager', 'Supervises a team, manages approvals, and monitors task and performance data.'),
('Lead Engineer', 'Responsible for technical leadership, task allocation, and progress reporting.'),
('Employee', 'Regular employee access to attendance, leave, and personal data.'),
('Intern', 'Limited access for trainees and interns with restricted permissions.');

INSERT INTO [OfficeHolidays] ([Name], [HolidayDate]) VALUES
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

-- DECLARE ALL VARIABLES

DECLARE @MaleID UNIQUEIDENTIFIER;
DECLARE @FemaleID UNIQUEIDENTIFIER;
DECLARE @OtherID UNIQUEIDENTIFIER;
DECLARE @SingleID UNIQUEIDENTIFIER;
DECLARE @MarriedID UNIQUEIDENTIFIER;
DECLARE @OPlusID UNIQUEIDENTIFIER;
DECLARE @APlusID UNIQUEIDENTIFIER;
DECLARE @BPlusID UNIQUEIDENTIFIER;
DECLARE @HRDeptID UNIQUEIDENTIFIER;
DECLARE @FinanceDeptID UNIQUEIDENTIFIER;
DECLARE @ITDeptID UNIQUEIDENTIFIER;
DECLARE @AdminDeptID UNIQUEIDENTIFIER;
DECLARE @SalesDeptID UNIQUEIDENTIFIER;
DECLARE @SoftEngDesignID UNIQUEIDENTIFIER;
DECLARE @TeamLeadDesignID UNIQUEIDENTIFIER;
DECLARE @SeniorSoftEngDesignID UNIQUEIDENTIFIER;
DECLARE @HRMgrDesignID UNIQUEIDENTIFIER;
DECLARE @ManagerDesignID UNIQUEIDENTIFIER;
DECLARE @GeneralShiftID UNIQUEIDENTIFIER;
DECLARE @MorningShiftID UNIQUEIDENTIFIER;
DECLARE @AfternoonShiftID UNIQUEIDENTIFIER;
DECLARE @FatherRelID UNIQUEIDENTIFIER;
DECLARE @MotherRelID UNIQUEIDENTIFIER;
DECLARE @AadhaarTypeID UNIQUEIDENTIFIER;
DECLARE @PANTypeID UNIQUEIDENTIFIER;
DECLARE @DrivingLicenseTypeID UNIQUEIDENTIFIER;
DECLARE @EarnedLeaveID UNIQUEIDENTIFIER;
DECLARE @SickLeaveID UNIQUEIDENTIFIER;
DECLARE @EmployeeRoleID UNIQUEIDENTIFIER;
DECLARE @ManagerRoleID UNIQUEIDENTIFIER;
DECLARE @HRMgrRoleID UNIQUEIDENTIFIER;
DECLARE @EMP001ID UNIQUEIDENTIFIER;
DECLARE @EMP002ID UNIQUEIDENTIFIER;
DECLARE @EMP003ID UNIQUEIDENTIFIER;
DECLARE @EMP004ID UNIQUEIDENTIFIER;
DECLARE @EMP005ID UNIQUEIDENTIFIER;
DECLARE @EMP001LeaveReqID UNIQUEIDENTIFIER;
DECLARE @EMP002LeaveReqID UNIQUEIDENTIFIER;
DECLARE @EMP003LeaveReqID UNIQUEIDENTIFIER;
DECLARE @EMP004LeaveReqID UNIQUEIDENTIFIER;
DECLARE @EMP005LeaveReqID UNIQUEIDENTIFIER;
DECLARE @ApprovalGrp1ID UNIQUEIDENTIFIER;
DECLARE @ApprovalGrp2ID UNIQUEIDENTIFIER;


-- GET MASTER DATA IDs

SELECT @MaleID = ID FROM [GenderType] WHERE [Name] = 'Male';
SELECT @FemaleID = ID FROM [GenderType] WHERE [Name] = 'Female';
SELECT @SingleID = ID FROM [MaritalStatus] WHERE [Name] = 'Single';
SELECT @MarriedID = ID FROM [MaritalStatus] WHERE [Name] = 'Married';
SELECT @OPlusID = ID FROM [BloodGroup] WHERE [Name] = 'O+';
SELECT @APlusID = ID FROM [BloodGroup] WHERE [Name] = 'A+';
SELECT @BPlusID = ID FROM [BloodGroup] WHERE [Name] = 'B+';
SELECT @HRDeptID = ID FROM [Department] WHERE [Name] = 'Human Resources';
SELECT @FinanceDeptID = ID FROM [Department] WHERE [Name] = 'Finance';
SELECT @ITDeptID = ID FROM [Department] WHERE [Name] = 'Information Technology';
SELECT @AdminDeptID = ID FROM [Department] WHERE [Name] = 'Administration';
SELECT @SalesDeptID = ID FROM [Department] WHERE [Name] = 'Sales';
SELECT @SoftEngDesignID = ID FROM [Designation] WHERE [Name] = 'Software Engineer';
SELECT @TeamLeadDesignID = ID FROM [Designation] WHERE [Name] = 'Team Lead';
SELECT @SeniorSoftEngDesignID = ID FROM [Designation] WHERE [Name] = 'Senior Software Engineer';
SELECT @HRMgrDesignID = ID FROM [Designation] WHERE [Name] = 'HR Manager';
SELECT @ManagerDesignID = ID FROM [Designation] WHERE [Name] = 'General Manager';
SELECT @GeneralShiftID = ID FROM [Shifts] WHERE [Name] = 'General Shift';
SELECT @MorningShiftID = ID FROM [Shifts] WHERE [Name] = 'Morning Shift';
SELECT @AfternoonShiftID = ID FROM [Shifts] WHERE [Name] = 'Afternoon Shift';
SELECT @FatherRelID = ID FROM [RelationType] WHERE [Name] = 'Father';
SELECT @MotherRelID = ID FROM [RelationType] WHERE [Name] = 'Mother';
SELECT @AadhaarTypeID = ID FROM [IdentifierType] WHERE [Name] = 'Aadhaar Card';
SELECT @PANTypeID = ID FROM [IdentifierType] WHERE [Name] = 'PAN Card';
SELECT @DrivingLicenseTypeID = ID FROM [IdentifierType] WHERE [Name] = 'Driving License';
SELECT @EarnedLeaveID = ID FROM [LeaveType] WHERE [Name] = 'Earned leave';
SELECT @SickLeaveID = ID FROM [LeaveType] WHERE [Name] = 'Sick Causal Leaves';
SELECT @EmployeeRoleID = ID FROM [Roles] WHERE [Name] = 'Admin';
SELECT @ManagerRoleID = ID FROM [Roles] WHERE [Name] = 'Manager';
SELECT @HRMgrRoleID = ID FROM [Roles] WHERE [Name] = 'HR Manager';

-- INSERT EMPLOYEES

INSERT INTO [Employees] ([Code], [FirstName], [MiddleName], [LastName], [Email], [MobileNumber], [Extension], [ResidentialStatus], [DOB], [PlaceOfBirth], [GenderTypeID], [BloodGroupID], [MaritalStatusID], [Nationality], [Religion], [Caste], [PhysicallyChallenged], [InternationalEmployee], [HeightInCm], [WeightInKG], [Hobby], [JoiningDate], [DepartmentID], [DesignationID], [ReportingManagerID])
VALUES 
('EMP001', 'Gaurav', 'Kailas', 'Thube', 'gaurav.thube@teclogos.com', '9876543210', 'Pune-001', 'Rented', '2003-11-20', 'Parner', @MaleID, @OPlusID, @SingleID, 'Indian', 'Hindu', 'Maratha', 0, 0, 177.70, 65.00, 'Swimming', '2025-10-11', @ITDeptID, @SoftEngDesignID, NULL),
('EMP002', 'Ajay', 'Baburao', 'Pise', 'ajay.pise@teclogos.com', '9876543211', 'Pune-002', 'Hostel', '2003-05-12', 'Shegaon', @MaleID, @APlusID, @SingleID, 'Indian', 'Hindu', 'Maratha', 0, 0, 157.70, 55.00, 'Reading', '2025-06-05', @AdminDeptID, @TeamLeadDesignID, NULL),
('EMP003', 'Atharv', 'Santosh', 'Supekar', 'atharv.supekar@teclogos.com', '9876543212', 'Pune-003', 'Owned', '2002-08-22', 'Satara', @MaleID, @OPlusID, @SingleID, 'Indian', 'Hindu', 'Maratha', 0, 0, 187.00, 59.00, 'Writing', '2025-06-12', @ITDeptID, @SeniorSoftEngDesignID, NULL),
('EMP004', 'Shambhuraje', 'Santosh', 'Bhosale', 'shambhu.bhosale@teclogos.com', '9876543213', 'Pune-004', 'Rented', '2003-04-19', 'Karmala', @MaleID, @APlusID, @SingleID, 'Indian', 'Hindu', 'Maratha', 0, 0, 187.00, 59.00, 'Singing', '2025-06-08', @HRDeptID, @HRMgrDesignID, NULL),
('EMP005', 'Sanika', 'Umesh', 'Ghodake', 'sanika.ghodake@teclogos.com', '9876543214', 'Pune-005', 'Hostel', '2003-03-03', 'Kanhur', @FemaleID, @OPlusID, @MarriedID, 'Indian', 'Hindu', 'Sonar', 0, 0, 165.00, 59.00, 'Drawing', '2025-05-19', @SalesDeptID, @ManagerDesignID, NULL);

-- GET EMPLOYEE IDs
SELECT @EMP001ID = ID FROM [Employees] WHERE [Code] = 'EMP001';
SELECT @EMP002ID = ID FROM [Employees] WHERE [Code] = 'EMP002';
SELECT @EMP003ID = ID FROM [Employees] WHERE [Code] = 'EMP003';
SELECT @EMP004ID = ID FROM [Employees] WHERE [Code] = 'EMP004';
SELECT @EMP005ID = ID FROM [Employees] WHERE [Code] = 'EMP005';

-- INSERT ATTENDANCE

INSERT INTO [Attendance] ([EmployeeID], [ShiftID], [AttendanceDate], [InTime], [OutTime], [Source])
VALUES
(@EMP001ID, @GeneralShiftID, '2025-11-07', '2025-11-07 09:05:00', '2025-11-07 18:10:00', 0),
(@EMP001ID, @GeneralShiftID, '2025-11-06', '2025-11-06 09:00:00', '2025-11-06 17:45:00', 0),
(@EMP002ID, @MorningShiftID, '2025-11-07', '2025-11-07 06:00:00', '2025-11-07 14:00:00', 0),
(@EMP002ID, @AfternoonShiftID, '2025-11-06', '2025-11-06 14:00:00', '2025-11-06 22:00:00', 0),
(@EMP003ID, @GeneralShiftID, '2025-11-07', '2025-11-07 09:10:00', '2025-11-07 18:20:00', 0),
(@EMP003ID, @MorningShiftID, '2025-11-06', '2025-11-06 06:00:00', '2025-11-06 14:15:00', 0),
(@EMP004ID, @GeneralShiftID, '2025-11-07', '2025-11-07 09:00:00', '2025-11-07 18:00:00', 0),
(@EMP005ID, @AfternoonShiftID, '2025-11-07', '2025-11-07 14:05:00', '2025-11-07 22:10:00', 0);


-- INSERT WORKBREAK

INSERT INTO [WorkBreak] ([EmployeeID], [WorkBreakDate], [StartDateTime], [EndDateTime])
VALUES
(@EMP001ID, '2025-11-07', '2025-11-07 13:00:00', '2025-11-07 13:30:00'),
(@EMP001ID, '2025-11-06', '2025-11-06 13:15:00', '2025-11-06 13:45:00'),
(@EMP002ID, '2025-11-07', '2025-11-07 10:15:00', '2025-11-07 10:45:00'),
(@EMP002ID, '2025-11-06', '2025-11-06 18:00:00', '2025-11-06 18:45:00'),
(@EMP003ID, '2025-11-07', '2025-11-07 13:30:00', '2025-11-07 14:00:00'),
(@EMP003ID, '2025-11-06', '2025-11-06 10:00:00', '2025-11-06 10:30:00'),
(@EMP004ID, '2025-11-07', '2025-11-07 13:00:00', '2025-11-07 13:45:00'),
(@EMP005ID, '2025-11-07', '2025-11-07 18:15:00', '2025-11-07 18:50:00');


-- INSERT BANKDETAILS

INSERT INTO [BankDetails] ([EmployeeID], [BankName], [Branch], [IFSC], [MICR], [AccountType], [AccountNumber], [NameAsPerRecord])
VALUES
(@EMP001ID, 'State Bank of India', 'Pune Main Branch', 'SBIN0000456', '411014001', 'Savings', '123456789012', 'Gaurav Kailas Thube'),
(@EMP002ID, 'HDFC Bank', 'Mumbai Central', 'HDFC0001234', '400010005', 'Current', '987654321098', 'Ajay Baburao Pise'),
(@EMP003ID, 'ICICI Bank', 'Nagpur Civil Lines', 'ICIC0000567', '440001008', 'Savings', '456123789654', 'Atharv Santosh Supekar'),
(@EMP004ID, 'Axis Bank', 'Nashik City', 'UTIB0000987', '422001010', 'Salary', '321789654123', 'Shambhuraje Santosh Bhosale'),
(@EMP005ID, 'Bank of Maharashtra', 'Sambhaji Nagar Branch', 'MAHB0000789', '431005002', 'Savings', '741258963000', 'Sanika Umesh Ghodake');


-- INSERT FAMILYMEMBERS

INSERT INTO [FamilyMembers] ([EmployeeID], [RelationTypeID], [FirstName], [MiddleName], [LastName], [DOB], [MobileNumber], [BloodGroupID], [Nationality])
VALUES
(@EMP001ID, @FatherRelID, 'Kailas', NULL, 'Thube', '1970-05-10', '9876501234', @OPlusID, 'Indian'),
(@EMP001ID, @MotherRelID, 'Meena', 'Kailas', 'Thube', '1975-08-22', '9876501235', @APlusID, 'Indian'),
(@EMP002ID, @FatherRelID, 'Baburao', NULL, 'Pise', '1968-12-11', '9876502234', @OPlusID, 'Indian'),
(@EMP002ID, @MotherRelID, 'Asha', 'Baburao', 'Pise', '1972-09-17', '9876502235', @APlusID, 'Indian'),
(@EMP003ID, @FatherRelID, 'Santosh', NULL, 'Supekar', '1971-07-30', '9876534567', @OPlusID, 'Indian'),
(@EMP003ID, @MotherRelID, 'Sunita', 'Santosh', 'Supekar', '1976-11-05', '9876545678', @APlusID, 'Indian');


-- INSERT IDENTIFIERS

INSERT INTO [Identifiers] ([EmployeeID], [IdentifierTypeID], [Number], [IssuedDate], [ExpiryDate], [FileName], [FilePath], [Verified])
VALUES
(@EMP001ID, @AadhaarTypeID, '1234-5678-9012', '2015-01-10', NULL, 'Aadhar_EMP001.pdf', '/uploads/identifiers/', '2025-11-01 10:00:00'),
(@EMP001ID, @PANTypeID, 'ABCDE1234F', '2012-03-15', NULL, 'PAN_EMP001.pdf', '/uploads/identifiers/', '2025-11-01 10:00:00'),
(@EMP001ID, @DrivingLicenseTypeID, 'MH12 2020123456789', '2019-05-12', '2039-05-11', 'DL_EMP001.pdf', '/uploads/identifiers/', '2025-01-10 10:00:00'),
(@EMP002ID, @AadhaarTypeID, '9876-5432-1098', '2016-08-22', NULL, 'Aadhar_EMP002.pdf', '/uploads/identifiers/', '2025-11-01 10:00:00'),
(@EMP002ID, @PANTypeID, 'PQRES5678G', '2014-02-10', NULL, 'PAN_EMP002.pdf', '/uploads/identifiers/', '2025-11-01 10:00:00'),
(@EMP003ID, @AadhaarTypeID, '4567-8901-2345', '2017-11-05', NULL, 'Aadhar_EMP003.pdf', '/uploads/identifiers/', '2025-11-01 10:00:00'),
(@EMP003ID, @PANTypeID, 'LMNOP3456K', '2013-04-18', NULL, 'PAN_EMP003.pdf', '/uploads/identifiers/', '2025-11-01 10:00:00');


-- INSERT LEAVEREQUEST


INSERT INTO [LeaveRequest] ([EmployeeID], [LeaveTypeID], [FromDate], [ToDate], [Reason], [Status])
VALUES
(@EMP001ID, @EarnedLeaveID, '2025-11-10', '2025-11-12', 'Personal work', 1),
(@EMP002ID, @SickLeaveID, '2025-11-08', '2025-11-08', 'Flu and fever', 0),
(@EMP003ID, @EarnedLeaveID, '2025-11-20', '2025-11-25', 'Family vacation', 0),
(@EMP004ID, @EarnedLeaveID, '2025-11-15', '2025-11-16', 'Personal reasons', 1),
(@EMP005ID, @SickLeaveID, '2025-11-25', '2025-11-27', 'Doctors appointment', 0);


-- GET LEAVE REQUEST IDs

SELECT @EMP001LeaveReqID = LR.ID FROM [LeaveRequest] LR INNER JOIN [Employees] E ON LR.EmployeeID = E.ID WHERE E.Code = 'EMP001';
SELECT @EMP002LeaveReqID = LR.ID FROM [LeaveRequest] LR INNER JOIN [Employees] E ON LR.EmployeeID = E.ID WHERE E.Code = 'EMP002';
SELECT @EMP003LeaveReqID = LR.ID FROM [LeaveRequest] LR INNER JOIN [Employees] E ON LR.EmployeeID = E.ID WHERE E.Code = 'EMP003';
SELECT @EMP004LeaveReqID = LR.ID FROM [LeaveRequest] LR INNER JOIN [Employees] E ON LR.EmployeeID = E.ID WHERE E.Code = 'EMP004';
SELECT @EMP005LeaveReqID = LR.ID FROM [LeaveRequest] LR INNER JOIN [Employees] E ON LR.EmployeeID = E.ID WHERE E.Code = 'EMP005';


-- INSERT PFACCOUNT

INSERT INTO [PFAccount] ([EmployeeID], [PFNumber], [UAN], [PFJoinDate], [KYCStatus], [Verified])
VALUES
(@EMP001ID, 'PF001234', 'UAN123456789', '2015-01-10', 'Verified', GETUTCDATE()),
(@EMP002ID, 'PF001235', 'UAN123456790', '2018-03-15', 'Verified', GETUTCDATE()),
(@EMP003ID, 'PF001236', 'UAN123456791', '2016-07-20', 'Pending', NULL),
(@EMP004ID, 'PF001237', 'UAN123456792', '2017-05-25', 'Verified', GETUTCDATE()),
(@EMP005ID, 'PF001238', 'UAN123456793', '2014-09-01', 'Verified', GETUTCDATE());

PRINT '✓ PFAccount: 5 records inserted';


-- INSERT EMPLOYEEROLE

INSERT INTO [EmployeeRole] ([EmployeeID], [RoleID])
VALUES
(@EMP001ID, @EmployeeRoleID),
(@EMP002ID, @ManagerRoleID),
(@EMP003ID, @EmployeeRoleID),
(@EMP004ID, @HRMgrRoleID),
(@EMP005ID, @ManagerRoleID);

PRINT '✓ EmployeeRole: 5 records inserted';


-- INSERT AUTHMANAGER

INSERT INTO [AuthManager] ([EmployeeID], [PasswordHash], [PasswordResetToken], [PasswordResetTokenExpires], [LastLoginDate], [FailedLoginAttempts], [LastFailedLoginAttemptOn])
VALUES
(@EMP001ID, '$2a$12$zrTSW46OiL8cByHWEcE4A.DLvZBjgTsSxnvHm4MwEnJ0FVysscTj6', NULL, NULL, DATEADD(DAY, -1, GETUTCDATE()), 0, NULL),
(@EMP002ID, '$2a$12$gLLCMkDDmPKjKbwZvvt6DOy2KEanR0uno2YCThDzlG9Qtv/ufFQl2', NULL, NULL, GETUTCDATE(), 0, NULL),
(@EMP003ID, '$2a$12$n/DjUPyfD9stz90TvmDTiOLelTNDQjUdjS1zr6ugm0sBLUMugMBJa', NULL, NULL, DATEADD(DAY, -5, GETUTCDATE()), 0, NULL),
(@EMP004ID, '$2a$12$Ywp.PC31h/7x2awjL1clK.bM9WYYhJQ1NHWXpPfefFFC2MfqRoRli', NULL, NULL, NULL, 0, NULL),
(@EMP005ID, '$2a$12$on4c.U3cIVcc4v4p3.LYmeM9e.hl5ZudluWOQ38z7lO5kDixSRyaS', NULL, NULL, DATEADD(DAY, -2, GETUTCDATE()), 0, NULL);

-- INSERT REFRESHTOKENS

INSERT INTO [RefreshTokens] ([EmployeeID], [Token], [ExpiresAt])
VALUES
(@EMP001ID, 'refresh_token_emp001_' + CAST(NEWID() AS NVARCHAR(36)), DATEADD(DAY, 7, GETUTCDATE())),
(@EMP002ID, 'refresh_token_emp002_' + CAST(NEWID() AS NVARCHAR(36)), DATEADD(DAY, 7, GETUTCDATE())),
(@EMP003ID, 'refresh_token_emp003_' + CAST(NEWID() AS NVARCHAR(36)), DATEADD(DAY, 7, GETUTCDATE())),
(@EMP004ID, 'refresh_token_emp004_' + CAST(NEWID() AS NVARCHAR(36)), DATEADD(DAY, 7, GETUTCDATE())),
(@EMP005ID, 'refresh_token_emp005_' + CAST(NEWID() AS NVARCHAR(36)), DATEADD(DAY, 7, GETUTCDATE()));


-- INSERT APPROVALGROUP

INSERT INTO [ApprovalGroup] ([Name], [Description], [TotalLevels], [IsSequential], [DepartmentID])
VALUES 
('Level 1 Approvers', 'Manager level approval', 1, 1, NULL),
('Level 2 Approvers', 'Director level approval', 1, 1, NULL);

SELECT @ApprovalGrp1ID = ID FROM [ApprovalGroup] WHERE [Name] = 'Level 1 Approvers';
SELECT @ApprovalGrp2ID = ID FROM [ApprovalGroup] WHERE [Name] = 'Level 2 Approvers';


-- INSERT APPROVALGROUPMEMBERS

INSERT INTO [ApprovalGroupMembers] ([EmployeeID], [ApprovalGroupID], [RoleID], [Level], [IsMandatory], [CanDelegate])
VALUES
(@EMP002ID, @ApprovalGrp1ID, @ManagerRoleID, 1, 1, 1),
(@EMP004ID, @ApprovalGrp1ID, @HRMgrRoleID, 1, 1, 0);


-- INSERT LEAVE APPROVAL WORKFLOW

INSERT INTO [LeaveApprovalWorkflow] ([LeaveRequestID], [ApprovalGroupID], [ApprovalLevel], [ApprovedStatus], [Remark])
VALUES
(@EMP001LeaveReqID, @ApprovalGrp1ID, 1, 1, 'Approved by Manager'),
(@EMP002LeaveReqID, @ApprovalGrp1ID, 1, 0, 'Waiting for Manager approval'),
(@EMP003LeaveReqID, @ApprovalGrp1ID, 1, 0, 'Rejected - Conflict with project deadline'),
(@EMP004LeaveReqID, @ApprovalGrp1ID, 1, 1, 'Approved by Manager'),
(@EMP004LeaveReqID, @ApprovalGrp2ID, 2, 0, 'Pending Director approval'),
(@EMP005LeaveReqID, @ApprovalGrp1ID, 1, 1, 'Approved by Manager'),
(@EMP005LeaveReqID, @ApprovalGrp2ID, 2, 1, 'Approved by Director');


END;


