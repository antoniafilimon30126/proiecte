
-- Creare tabel nou pentru rezultatele sortate
CREATE TABLE seriale_sortate (
    numele_serialului VARCHAR(255) NOT NULL,
    nume_platforma VARCHAR(255) NOT NULL,
    gen VARCHAR(255) NOT NULL,
    rating DECIMAL(3, 1) NOT NULL
);

-- Inserare înregistrări sortate în tabelul nou
INSERT INTO seriale_sortate (numele_serialului, nume_platforma, gen, rating)
SELECT numele_serialului, 'Netflix', genul, rating
FROM netflix
UNION ALL
SELECT numele_serialului, 'HBO', genul, rating
FROM hbo
UNION ALL
SELECT numele_serialului, 'Disney Plus', genul, rating
FROM disney_plus
ORDER BY rating DESC;

-- Selectare înregistrări din tabelul nou sortat
SELECT * FROM seriale_sortate;

-- Calculare rating mediu pentru platforma hbo 
SELECT AVG(rating) AS rating_mediu FROM hbo;

--Numărul total de seriale pentru fiecare categorie de vârstă în tabelul "disney_plus"
SELECT categorie_varsta, COUNT(*) AS numar_seriale FROM disney_plus GROUP BY categorie_varsta;

--Actualizarea genului pentru un anumit serial în tabelul "netflix"
UPDATE netflix SET genul = 'Thriller' WHERE numele_serialului = 'Stranger Things';

--Numărul total de seriale din fiecare platformă în baza de date
SELECT 'Netflix' AS platforma, COUNT(*) AS numar_seriale FROM netflix
UNION ALL
SELECT 'HBO' AS platforma, COUNT(*) AS numar_seriale FROM hbo
UNION ALL
SELECT 'Disney Plus' AS platforma, COUNT(*) AS numar_seriale FROM disney_plus;

--Selectarea serialelor din tabelul "hbo" care au rating mai mare decât media rating-urilor din tabelul "netflix"
SELECT h.numele_serialului, h.genul, h.rating
FROM hbo h
WHERE h.rating > (SELECT AVG(n.rating) FROM netflix n);


--Calcularea rating-ului mediu al serialelor pe fiecare platformă
CREATE FUNCTION CalculateAverageRating ()
RETURNS TABLE
AS
RETURN (
    SELECT 'Netflix' AS platforma, AVG(rating) AS rating_mediu
    FROM netflix
    UNION ALL
    SELECT 'HBO' AS platforma, AVG(rating) AS rating_mediu
    FROM hbo
    UNION ALL
    SELECT 'Disney Plus' AS platforma, AVG(rating) AS rating_mediu
    FROM disney_plus
);

SELECT *
FROM dbo.CalculateAverageRating();

-- Numărul total de seriale pe fiecare platformă, grupate după gen
CREATE FUNCTION CountSerialsByGenre ()
RETURNS TABLE
AS
RETURN (
    SELECT 'Netflix' AS platforma, genul, COUNT(*) AS numar_seriale
    FROM netflix
    GROUP BY genul
    UNION ALL
    SELECT 'HBO' AS platforma, genul, COUNT(*) AS numar_seriale
    FROM hbo
    GROUP BY genul
    UNION ALL
    SELECT 'Disney Plus' AS platforma, genul, COUNT(*) AS numar_seriale
    FROM disney_plus
    GROUP BY genul
);
SELECT *
FROM dbo.CountSerialsByGenre();


CREATE TABLE episoade (
    id INT PRIMARY KEY,
    numele_serialului VARCHAR(255),
    genul VARCHAR(255) NOT NULL,
    numar_episod INT,
    titlu_episod VARCHAR(255),
    durata INT,
    FOREIGN KEY (numele_serialului,genul) REFERENCES netflix(numele_serialului,genul)
);


INSERT INTO episoade (id, numele_serialului, genul, numar_episod, titlu_episod, durata)
VALUES
    (1, 'Riverdale', 'Mister', 1, 'The Rivers Edge', 50),
    (2, 'Bridgerton','Dragoste',  2, 'Shock and Deligh', 57),
    (3, 'Fetele Gilmore','Drama', 19, 'Emily in Wonderland', 43),
    (4, 'Stranger Things', 'Drama', 2, 'Chapter Two: The Weirdo on Maple Street', 48),
    (5, 'The Crown','Drama', 8, 'Pride and Joy', 90);
