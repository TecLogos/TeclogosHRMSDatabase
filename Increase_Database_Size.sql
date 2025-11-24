
--increase database size

USE TeclogosHRMS_DEV;
GO

EXEC sp_spaceused;

ALTER DATABASE TeclogosHRMS_DEV 
MODIFY FILE (
    NAME = 'TeclogosHRMS_DEV',   -- logical name of MDF
    SIZE = 512MB                
);

ALTER DATABASE TeclogosHRMS_DEV 
MODIFY FILE (
    NAME = 'TeclogosHRMS_DEV_log',  -- logical name of LDF
    SIZE = 256MB                    -- increase to 256 MB (example)
);

SELECT name, physical_name, size * 8 / 1024 AS Size_MB
FROM sys.database_files;

SELECT *
FROM Employees
ORDER BY Code ASC;

select * from Attendance;
select * from RefreshTokens;
select * from FamilyMembers;
select * from Department;
select * from Designation;
select * from Roles;
select * from EmployeeRole;
select * from MaritalStatus;
select * from Employees;
select * from RelationType;
select * from BankDetails;
select * from IdentifierType;
select * from Identifiers;
select * from PFAccount;

select * from AuthManager
order by PasswordHash Asc;

 UPDATE AuthManager
 SET PasswordHash = '$2a$12$8.nOlV.bvpcc/zVjV0eD0eTinvwRXLYvUaAO1DBXKpVPUydrADURi'
 WHERE EmployeeID = '674F271F-E345-4CAE-BF30-6A7537D326DE';

 select * from FamilyMembers where EmployeeID = '674F271F-E345-4CAE-BF30-6A7537D326DE';

 select * from Employees where ID = '674F271F-E345-4CAE-BF30-6A7537D326DE';

 select * from EmployeeRole where EmployeeID = '674F271F-E345-4CAE-BF30-6A7537D326DE';

 select * from BankDetails where ID = '4a668e91-6644-421e-9e14-5b3834035d98';

 update EmployeeRole set RoleID = 'EDF04E2A-7CC7-42DB-9E13-C2D753930A54' where EmployeeID ='674F271F-E345-4CAE-BF30-6A7537D326DE'; 
