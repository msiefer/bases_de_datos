DROP DATABASE IF EXISTS INSTITUTO;
CREATE DATABASE INSTITUTO;
USE INSTITUTO;

CREATE TABLE ALUMNOS (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    f_nacimiento DATE,
    localidad VARCHAR(50) DEFAULT 'SIN DATOS',
    sexo ENUM('H','M') NOT NULL
);

CREATE TABLE ASIGNATURAS (
    id_asignatura INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    curso VARCHAR(20)
);

CREATE TABLE NOTAS (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    nota DECIMAL(4,2),
    convocatoria ENUM('ORDINARIA','EXTRAORDINARIA') DEFAULT 'ORDINARIA',

    FOREIGN KEY (id_alumno) REFERENCES ALUMNOS(id_alumno)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_asignatura) REFERENCES ASIGNATURAS(id_asignatura)
        ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO ALUMNOS (nombre, f_nacimiento, localidad, sexo) VALUES
('Ana López',       '2005-03-10', 'Granada', 'M'),
('Carlos Ruiz',     '2004-07-22', 'Atarfe',  'H'),
('María Gómez',     '2006-01-05', 'Granada', 'M'),
('Jorge Martín',    '2003-11-15', 'Sevilla', 'H'),
('Lucía Romero',    '2004-05-19', 'Madrid',  'M');

INSERT INTO ASIGNATURAS (nombre, curso) VALUES
('Matemáticas', '1º Bach'),
('Lengua',      '1º Bach'),
('Inglés',      '1º Bach'),
('Historia',    '1º Bach'),
('Física',      '1º Bach');

INSERT INTO NOTAS (id_alumno, id_asignatura, nota, convocatoria) VALUES
(1, 1, 7.5, 'ORDINARIA'),
(1, 2, 8.0, 'ORDINARIA'),
(1, 3, 6.2, 'ORDINARIA'),

(2, 1, 4.5, 'ORDINARIA'),
(2, 4, 5.0, 'EXTRAORDINARIA'),

(3, 2, 9.0, 'ORDINARIA'),
(3, 3, 8.5, 'ORDINARIA'),

(4, 1, 6.0, 'ORDINARIA'),
(4, 5, 7.1, 'ORDINARIA'),

(5, 1, 8.2, 'ORDINARIA');
