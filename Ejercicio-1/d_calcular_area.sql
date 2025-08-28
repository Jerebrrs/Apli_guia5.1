USE Guia5_1;
GO
SELECT f.Id,
    Tipo =CASE
        --case?
        WHEN f.Tipo = 1 THEN 'Rectangulo' --WHN Que significa?
        WHEN f.Tipo = 2 THEN 'Circulo' -- THEN Que significa?
        ELSE 'Desconocido'
    END,
    f.area,
    f.Ancho,
    f.largo,
    f.radio
FROM Figuras f --CREAR UN PROCEDIMIENTO DE ALMACENAMIENTO QUE CALCULE EL AREA DE LAS FIGURAS
    CREATE PROCEDURE sp_Calcular_Area(@Id INT) --@ es porq es una variable
    AS BEGIN -- UPDATE Figuras SET Area= Ancho*Largo
    -- WHERE Id=@Id AND Tipo=1;
    -- UPDATE Figuras SET Area=PI()*Radio*Radio
    -- WHERE Id=@Id AND Tipo=2;
UPDATE Figuras
SET Area = CASE
        WHEN Tipo = 1 THEN Ancho * Largo
        WHEN Tipo = 2 THEN 3.1415 * POWER(Radio, 2)
        ELSE NULL
    END
WHERE Id = @Id;
END
GO