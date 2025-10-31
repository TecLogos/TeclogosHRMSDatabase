
-- Use the database
USE TeclogosHRMS;
GO

-- Employees ---

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_GenderType
FOREIGN KEY (GenderTypeID) REFERENCES GenderType(ID);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_BloodGroup
FOREIGN KEY (BloodGroupID) REFERENCES BloodGroup(ID);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Department
FOREIGN KEY (DepartmentID) REFERENCES Department(ID);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Designation
FOREIGN KEY (DesignationID) REFERENCES Designation(ID);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_ReportingManager
FOREIGN KEY (ReportingManagerID) REFERENCES Employees(ID);
GO

 -- System default FKs

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO

-- GenderType --- 

 -- System default FKs

ALTER TABLE GenderType
ADD CONSTRAINT FK_GenderType_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE GenderType
ADD CONSTRAINT FK_GenderType_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE GenderType
ADD CONSTRAINT FK_GenderType_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO

-- BloodGroup --- 

 -- System default FKs

ALTER TABLE BloodGroup
ADD CONSTRAINT FK_BloodGroup_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE BloodGroup
ADD CONSTRAINT FK_BloodGroup_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE BloodGroup
ADD CONSTRAINT FK_BloodGroup_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO

-- Department --- 

 -- System default FKs

ALTER TABLE Department
ADD CONSTRAINT FK_Department_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE Department
ADD CONSTRAINT FK_Department_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE Department
ADD CONSTRAINT FK_Department_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- Designation --- 

 -- System default FKs

ALTER TABLE Designation
ADD CONSTRAINT FK_Designation_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE Designation
ADD CONSTRAINT FK_Designation_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE Designation
ADD CONSTRAINT FK_Designation_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- Attendance ---           

ALTER TABLE Attendance
ADD CONSTRAINT FK_Attendance_EmpID
FOREIGN KEY (EmpID) REFERENCES Employees(ID);
GO

ALTER TABLE Attendance
ADD CONSTRAINT FK_Attendance_Shift
FOREIGN KEY (ShiftID) REFERENCES Shifts(ID);
Go


 -- System default FKs

ALTER TABLE Attendance
ADD CONSTRAINT FK_Attendance_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE Attendance
ADD CONSTRAINT FK_Attendance_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE Attendance
ADD CONSTRAINT FK_Attendance_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO

-- OfficeHolidays --- 

 -- System default FKs

ALTER TABLE OfficeHolidays
ADD CONSTRAINT FK_OfficeHolidays_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE OfficeHolidays
ADD CONSTRAINT FK_OfficeHolidays_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE OfficeHolidays
ADD CONSTRAINT FK_OfficeHolidays_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- Shifts --- 

 -- System default FKs

ALTER TABLE Shifts
ADD CONSTRAINT FK_Shifts_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE Shifts
ADD CONSTRAINT FK_Shifts_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE Shifts
ADD CONSTRAINT FK_Shifts_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- WorkBreak ---

ALTER TABLE WorkBreak
ADD CONSTRAINT FK_WorkBreak_EmpID
FOREIGN KEY (EmpID) REFERENCES Employees(ID);
Go

 -- System default FKs

ALTER TABLE WorkBreak
ADD CONSTRAINT FK_WorkBreak_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE WorkBreak
ADD CONSTRAINT FK_WorkBreak_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO


ALTER TABLE WorkBreak
ADD CONSTRAINT FK_WorkBreak_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- BankDetails ---

ALTER TABLE BankDetails
ADD CONSTRAINT FK_BankDetails_EmpID
FOREIGN KEY (EmpID) REFERENCES Employees(ID);
GO

 -- System default FKs

ALTER TABLE BankDetails
ADD CONSTRAINT FK_BankDetails_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE BankDetails
ADD CONSTRAINT FK_BankDetails_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE BankDetails
ADD CONSTRAINT FK_BankDetails_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO

-- FamilyMembers ---

ALTER TABLE FamilyMembers
ADD CONSTRAINT FK_FamilyMembers_EmpID
FOREIGN KEY (EmpID) REFERENCES Employees(ID);
GO

ALTER TABLE FamilyMembers
ADD CONSTRAINT FK_FamilyMembers_RelationType
FOREIGN KEY (RelationTypeId) REFERENCES RelationType(ID);
GO

ALTER TABLE FamilyMembers
ADD CONSTRAINT FK_FamilyMembers_GenderType
FOREIGN KEY (GenderTypeID) REFERENCES GenderType(ID);
GO

ALTER TABLE FamilyMembers
ADD CONSTRAINT FK_FamilyMembers_BloodGroup
FOREIGN KEY (BloodGroupID) REFERENCES BloodGroup(ID);
GO


 -- System default FKs

ALTER TABLE FamilyMembers
ADD CONSTRAINT FK_FamilyMembers_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE FamilyMembers
ADD CONSTRAINT FK_FamilyMembers_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE FamilyMembers
ADD CONSTRAINT FK_FamilyMembers_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- RelationType --- 

 -- System default FKs

ALTER TABLE RelationType
ADD CONSTRAINT FK_RelationType_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE RelationType
ADD CONSTRAINT FK_RelationType_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE RelationType
ADD CONSTRAINT FK_RelationType_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- IdentifierType --- 

 -- System default FKs

ALTER TABLE IdentifierType
ADD CONSTRAINT FK_IdentifierType_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE IdentifierType
ADD CONSTRAINT FK_IdentifierType_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE IdentifierType
ADD CONSTRAINT FK_IdentifierType_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- Identifiers --- 

ALTER TABLE Identifiers
ADD CONSTRAINT FK_Identifiers_EmpID
FOREIGN KEY (EmpID) REFERENCES Employees(ID);
GO

ALTER TABLE Identifiers
ADD CONSTRAINT FK_Identifiers_IdentifierType
FOREIGN KEY (IdentifierTypeId) REFERENCES IdentifierType(ID);
GO

ALTER TABLE Identifiers
ADD CONSTRAINT FK_Identifiers_VerifiedBy
FOREIGN KEY (VerifiedByID) REFERENCES Employees(ID);
GO

 -- System default FKs

ALTER TABLE Identifiers
ADD CONSTRAINT FK_Identifiers_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE Identifiers
ADD CONSTRAINT FK_Identifiers_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE Identifiers
ADD CONSTRAINT FK_Identifiers_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- Leaves --- 

ALTER TABLE Leaves
ADD CONSTRAINT FK_Leaves_EmpID
FOREIGN KEY (EmpID) REFERENCES Employees(ID);
GO

 -- System default FKs

ALTER TABLE Leaves
ADD CONSTRAINT FK_Leaves_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE Leaves
ADD CONSTRAINT FK_Leaves_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE Leaves
ADD CONSTRAINT FK_Leaves_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- PFAccount --- 

ALTER TABLE PFAccount
ADD CONSTRAINT FK_PFAccount_EmpID
FOREIGN KEY (EmpID) REFERENCES Employees(ID);
GO

ALTER TABLE PFAccount
ADD CONSTRAINT FK_PFAccount_VerifiedBy
FOREIGN KEY (VerifiedByID) REFERENCES Employees(ID);
GO

 -- System default FKs

ALTER TABLE PFAccount
ADD CONSTRAINT FK_PFAccount_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE PFAccount
ADD CONSTRAINT FK_PFAccount_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE PFAccount
ADD CONSTRAINT FK_PFAccount_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- Roles --- 

 -- System default FKs

ALTER TABLE Roles
ADD CONSTRAINT FK_Roles_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE Roles
ADD CONSTRAINT FK_Roles_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE Roles
ADD CONSTRAINT FK_Roles_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO

-- RefreshTokens --- 

ALTER TABLE RefreshTokens
ADD CONSTRAINT FK_RefreshTokens_EmpID
FOREIGN KEY (EmpID) REFERENCES Employees(ID);
GO

 -- System default FKs

ALTER TABLE RefreshTokens
ADD CONSTRAINT FK_RefreshTokens_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE RefreshTokens
ADD CONSTRAINT FK_RefreshTokens_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE RefreshTokens
ADD CONSTRAINT FK_RefreshTokens_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- EmpRole --- 

ALTER TABLE EmpRole
ADD CONSTRAINT FK_EmpRole_EmpID
FOREIGN KEY (EmpID) REFERENCES Employees(ID);
GO

ALTER TABLE EmpRole
ADD CONSTRAINT FK_EmpRole_Role
FOREIGN KEY (RoleId) REFERENCES Roles(ID);
GO

 -- System default FKs

ALTER TABLE EmpRole
ADD CONSTRAINT FK_EmpRole_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE EmpRole
ADD CONSTRAINT FK_EmpRole_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE EmpRole
ADD CONSTRAINT FK_EmpRole_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO


-- AuthManager --- 

ALTER TABLE AuthManager
ADD CONSTRAINT FK_AuthManager_EmpID
FOREIGN KEY (EmpID) REFERENCES Employees(ID);
GO

 -- System default FKs

ALTER TABLE AuthManager
ADD CONSTRAINT FK_AuthManager_CreatedBy
FOREIGN KEY (CreatedById) REFERENCES Employees(ID);
GO

ALTER TABLE AuthManager
ADD CONSTRAINT FK_AuthManager_ModifiedBy
FOREIGN KEY (ModifiedById) REFERENCES Employees(ID);
GO

ALTER TABLE AuthManager
ADD CONSTRAINT FK_AuthManager_DeletedBy
FOREIGN KEY (DeletedById) REFERENCES Employees(ID);
GO
