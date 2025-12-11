CREATE TABLE articulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    contenido TEXT,
    FULLTEXT(contenido)
) ENGINE=InnoDB;

INSERT INTO articulos (titulo, contenido) VALUES
('Primer artículo', 'Este es un artículo de prueba sobre bases de datos MySQL y FULLTEXT.'),
('Segundo artículo', 'Aprender MySQL es importante para manejar datos eficientemente.'),
('Tercer artículo', 'El índice FULLTEXT permite buscar palabras dentro de campos de texto largo.');


SELECT * 
FROM articulos
WHERE MATCH(contenido) AGAINST('MySQL' IN NATURAL LANGUAGE MODE);


SELECT * 
FROM articulos
WHERE MATCH(contenido) AGAINST('+MySQL +FULLTEXT' IN BOOLEAN MODE);

