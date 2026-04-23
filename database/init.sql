CREATE TABLE IF NOT EXISTS members (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    legajo INT UNIQUE NOT NULL,
    feature VARCHAR(100),
    servicio VARCHAR(100),
    estado VARCHAR(50)
);


INSERT INTO members (nombre, apellido, legajo, feature, servicio)
VALUES ('Franco', 'Arce', '33307', 'feature 01', 'Coordinación, Infraestructura Base y README');
VALUES ('Dante', 'Barbe', '33376', 'feature 02', 'Frontend — Página Web con HTML y JavaScript');
VALUES ('Santiago', 'Andrada', '33363', 'feature 03', 'Backend — API REST con Python y Flask');
VALUES ('Nicolás', 'Diez', '33381', 'feature 04', 'Base de Datos con PostgreSQL');
VALUES ('Ramiro', 'Gil', '33495', 'feature 05', 'Panel de Monitoreo con Portainer');