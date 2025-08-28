USE Guia5_1;
GO IF OBJECT_ID('sp_Calcular_Area', 'P') IS NOT NULL DROP PROCEDURE sp_Calcular_Area;
GO CREATE PROCEDURE sp_Calcular_Area(@Id INT) AS BEGIN
UPDATE Figuras
SET Area = Ancho * Largo
WHERE Id = @Id
    AND Tipo = 1;
UPDATE Figuras
SET Area = PI() * Radio * Radio
WHERE Id = @Id
    AND Tipo = 2;
END
GO -- Ejecutar para cada figura usando cursor
DECLARE Figura_Cursor CURSOR FOR
SELECT Id
FROM Figuras;
DECLARE @Id_ INT;
OPEN Figura_Cursor;
FETCH NEXT
FROM Figura_Cursor INTO @Id_;
WHILE @@FETCH_STATUS = 0 BEGIN EXEC sp_Calcular_Area @Id = @Id_;
FETCH NEXT
FROM Figura_Cursor INTO @Id_;
END CLOSE Figura_Cursor;
DEALLOCATE Figura_Cursor;
SELECT *
FROM Figuras;