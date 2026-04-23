CREATE TABLE IF NOT EXISTS members (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    legajo INT UNIQUE NOT NULL,
    feature VARCHAR(100),
    servicio VARCHAR(100),
    estado VARCHAR(50)
);

Legajo	Apellido	Nombre 
33307	Arce	Franco
33376	Barbe	Dante
33363	Andrada	Santiago
33381	Diez	Nicolás
33495	Gil	Ramiro
feature: 
feature 01
feature 02
feature 03
feature 04
feature 05
servicio: 
Coordinación, Infraestructura Base y README
Frontend — Página Web con HTML y JavaScript
Backend — API REST con Python y Flask
Base de Datos con PostgreSQL
Panel de Monitoreo con Portainer


INSERT INTO members (nombre, apellido, legajo, feature, servicio)
VALUES ('Franco', 'Arce', '33307', 'feature 01', 'Coordinación, Infraestructura Base y README');
VALUES ('Dante', 'Barbe', '33376', 'feature 02', 'Frontend — Página Web con HTML y JavaScript');
VALUES ('Santiago', 'Andrada', '33363', 'feature 03', 'Backend — API REST con Python y Flask');
VALUES ('Nicolás', 'Diez', '33381', 'feature 04', 'Base de Datos con PostgreSQL');
VALUES ('Ramiro', 'Gil', '33495', 'feature 05', 'Panel de Monitoreo con Portainer');