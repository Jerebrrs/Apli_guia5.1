CREATE TABLE Figuras(
    Id INT PRiMARY IDENTITY(1, 1) NOT NULL,
    Area DECIMAL(18, 2),
    Tipo INT NOT NULL,
    --1 Es Recatnangulo, 2 Es Circulo
    Ancho DECIMAL(18, 2),
    Largo DECIMAL(18, 2),
    Radio DECIMAL(18, 2),
    CONSTRAINT PK_Figuras PRIMARY KEY (Id)
)