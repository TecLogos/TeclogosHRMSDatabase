
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