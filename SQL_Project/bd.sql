CREATE DATABASE PlatformedeStreaming;
USE PlatformedeStreaming;

CREATE TABLE platforme (
    id INT NOT NULL,
    nume_platforma VARCHAR(255) NOT NULL,
    PRIMARY KEY (nume_platforma)
);

USE PlatformedeStreaming;

CREATE TABLE netflix (
    numele_serialului VARCHAR(255) NOT NULL,
    genul VARCHAR(255) NOT NULL,
    rating DECIMAL(3, 1) NOT NULL,
    categorie_varsta VARCHAR(50) NOT NULL,
    PRIMARY KEY (numele_serialului, genul)
);

USE PlatformedeStreaming;

INSERT INTO netflix (numele_serialului, genul, rating, categorie_varsta)
VALUES
    ('Stranger Things', 'Dramă', 8.8, '16+'),
    ('Breaking Bad', 'Crimă', 9.5, '18+'),
    ('Friends', 'Comedie', 8.9, '14+'),
    ('Game of Thrones', 'Fantezie', 9.3, '18+'),
    ('The Office', 'Comedie', 8.9, '14+'),
    ('Black Mirror', 'Sci-Fi', 8.8, '16+'),
    ('Money Heist', 'Acțiune', 8.3, '16+'),
    ('Stranger Things', 'Mister', 8.8, '16+'),
    ('Narcos', 'Dramă', 8.8, '18+'),
    ('The Crown', 'Dramă', 8.7, '16+');


USE PlatformedeStreaming;

INSERT INTO netflix (numele_serialului, genul, rating, categorie_varsta)
VALUES
    ('Stranger Things', 'Dramă', 8.8, '16+'),
    ('Breaking Bad', 'Crimă', 9.5, '18+'),
    ('Riverdale', 'Mister', 6.5, '14+'),
    ('Bridgerton', 'Dragoste', 7.4, '16+'),
    ('The Office', 'Comedie', 8.9, '14+'),
    ('Black Mirror', 'Sci-Fi', 8.8, '16+'),
    ('Money Heist', 'Acțiune', 8.3, '16+'),
    ('Fetele Gilmore', 'Drama', 8.2, '12+'),
    ('Narcos', 'Dramă', 8.8, '18+'),
    ('The Crown', 'Dramă', 8.7, '16+');


USE PlatformedeStreaming;

CREATE TABLE hbo (
    numele_serialului VARCHAR(255) NOT NULL,
    genul VARCHAR(255) NOT NULL,
    rating DECIMAL(3, 1) NOT NULL,
    categorie_varsta VARCHAR(50) NOT NULL,
    PRIMARY KEY (numele_serialului, genul)
);

USE PlatformedeStreaming;

INSERT INTO hbo (numele_serialului, genul, rating, categorie_varsta)
VALUES
    ('Westworld', 'Sci-Fi', 8.7, '18+'),
    ('Chernobyl', 'Dramă', 9.4, '16+'),
    ('Friends', 'Comedie', 8.9, '14+'),
    ('Game of Thrones', 'Fantezie', 9.3, '18+'),
    ('Succession', 'Dramă', 8.6, '16+'),
    ('Barry', 'Comedie', 8.3, '16+'),
    ('The Sopranos', 'Dramă', 9.2, '18+'),
    ('Curb Your Enthusiasm', 'Comedie', 8.7, '16+'),
    ('True Detective', 'Crimă', 8.9, '18+'),
    ('Silicon Valley', 'Comedie', 8.5, '16+');

USE PlatformedeStreaming;

CREATE TABLE disney_plus (
    numele_serialului VARCHAR(255) NOT NULL,
    genul VARCHAR(255) NOT NULL,
    rating DECIMAL(3, 1) NOT NULL,
    categorie_varsta VARCHAR(50) NOT NULL,
    PRIMARY KEY (numele_serialului, genul)
);

   USE PlatformedeStreaming;

INSERT INTO disney_plus (numele_serialului, genul, rating, categorie_varsta)
VALUES
    ('The Simpsons', 'Comedie', 8.7, '12+'),
    ('Modern Family', 'Sitcom', 8.5, '12+'),
    ('Buried Secrets of the Bible', 'Istorie', 6.8, '0+'),
    ('9-1-1', 'Drama', 7.8, '16+'),
    ('Anatomia lui Grey', 'Drama', 7.6, '14+'),
    ('The Kardashians', 'Documentar', 4.7, '16+')
    ('Phineas si Ferb', 'Animație', 8.1, '6+'),
    ('Loki', 'SF', 8.6, '12+'),
    ('How i met your mother', 'Comedie', 8.3, '14+'),
    ('Wild Crime', 'Crima', 7.3, '14+');




