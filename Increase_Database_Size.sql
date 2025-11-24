
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
 SET PasswordHash = '$2a$12$mRTqA2Fk4w7l/MRon5egKeWnQkE9o5rjQPJ2BgHGeVWT7Nozduo3i'
 WHERE EmployeeID = 'B162D331-1DC4-4FDA-94AA-766CF6A11927';

 select * from FamilyMembers where EmployeeID = '1DF638B8-65C2-4F39-9CDF-1E9589EDC896';

 select * from Employees where ID = 'DFD06F19-966C-48BC-BFD0-2F9CFB2A9D41';

 select * from EmployeeRole where EmployeeID = '674F271F-E345-4CAE-BF30-6A7537D326DE';

 select * from BankDetails where EmployeeID = '455F7043-05E5-4EAE-A644-2560655CF049';

 update EmployeeRole set RoleID = 'EDF04E2A-7CC7-42DB-9E13-C2D753930A54' where EmployeeID ='674F271F-E345-4CAE-BF30-6A7537D326DE'; 


SELECT e.ID, e.Code, e.FirstName, e.LastName
FROM Employees e
LEFT JOIN FamilyMembers f 
    ON e.ID = f.EmployeeID AND f.IsDeleted = 0
WHERE f.EmployeeID IS NULL 
  AND e.IsDeleted = 0;

  SELECT e.ID, e.Code, e.FirstName, e.LastName, e.Email
FROM Employees e
LEFT JOIN AuthManager a ON e.ID = a.EmployeeID AND a.IsDeleted = 0
WHERE e.IsDeleted = 0
  AND (a.EmployeeID IS NULL OR a.PasswordHash IS NULL OR a.PasswordHash = '');
