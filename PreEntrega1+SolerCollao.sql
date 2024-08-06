-- Creación de la base de datos de veterinaria --

CREATE SCHEMA veterinaria;
USE veterinaria;


-- Creación de tablas --

CREATE TABLE dueño(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    rut VARCHAR(20) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion VARCHAR(100),
    correo VARCHAR(100) NOT NULL
);

CREATE TABLE mascota(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dueño_id INT NOT NULL,
	FOREIGN KEY (dueño_id) REFERENCES dueño(id),
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(100) NOT NULL,
    raza VARCHAR(100) NOT NULL,
    color VARCHAR(100) NOT NULL,
    sexo VARCHAR(100) NOT NULL,
    fecha_nac DATE NOT NULL,
    esterilizado BOOLEAN NOT NULL,
    chip BOOLEAN NOT NULL, 
    peso FLOAT
);

CREATE TABLE antiparasitarios(
	tipo VARCHAR(20) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    proxima_fecha DATE NOT NULL,
    mascota_id INT NOT NULL,
    FOREIGN KEY (mascota_id) REFERENCES mascota(id)
);

CREATE TABLE vacunas(
	tipo VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    marca VARCHAR(100) NOT NULL,
    fecha_proxima DATE NOT NULL,
    mascota_id INT NOT NULL,
    FOREIGN KEY (mascota_id) REFERENCES mascota(id)
);

CREATE TABLE agenda(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha DATE NOT NULL,
    nombre_dueño VARCHAR(100) NOT NULL,
    nombre_mascota VARCHAR(100) NOT NULL
);

CREATE TABLE consulta(
	fecha_id INT NOT NULL,
	FOREIGN KEY (fecha_id) REFERENCES agenda(id),
    razon_consulta VARCHAR(200) NOT NULL,
    peso FLOAT,
    anamnesis VARCHAR(1000) NOT NULL,
    plan_diagnostico VARCHAR(1000) NOT NULL,
    plan_terapeutico VARCHAR(1000) NOT NULL,
    prediagnostico VARCHAR(300) NOT NULL,
    diagnostico VARCHAR(300) NOT NULL,
    tratamiento VARCHAR(2000) NOT NULL,
    fecha_proxima DATE,
    mascota_id INT NOT NULL,
    FOREIGN KEY (mascota_id) REFERENCES mascota(id)
);


-- Creación de los registros a modo de ejemplo --
-- Dueños --
INSERT INTO dueño(nombre, apellido, rut, telefono, direccion, correo) 
values("Constanza", "Jimenez", "17228544-9", "+56987333455", "Comuna de San Ramón, Santiago, Chile", "constanza@gmail.com");
INSERT INTO dueño(nombre, apellido, rut, telefono, direccion, correo) 
values("Fernando", "López", "7665409-1", "+56977778888", "Comuna de Las Condes, Santiago, Chile", "fernando@gmail.com");
INSERT INTO dueño(nombre, apellido, rut, telefono, direccion, correo) 
values("Salvador", "De la Jara", "4665980-0", "+56922335544", "Comuna de La Pintana, Santiago, Chile", "salvador@gmail.com");
INSERT INTO dueño(nombre, apellido, rut, telefono, direccion, correo) 
values("Luis", "Moraga", "9876778-k", "+56911435577", "Comuna de La Reina, Santiago, Chile", "luis@gmail.com");
INSERT INTO dueño(nombre, apellido, rut, telefono, direccion, correo) 
values("Iñaki", "Vergara", "18546770-k", "+56977640998", "Comuna de San Bernardo, Santiago, Chile", "iñaki@gmail.com");


-- Mascotas --
INSERT INTO mascota(dueño_id, nombre, especie, raza, color, sexo, esterilizado, chip, peso, fecha_nac) 
values(1, "Mayra", "Perro", "Pastor Alemán", "Típico", "Hembra", true, true, 31.5, "2017-05-30");
INSERT INTO mascota(dueño_id, nombre, especie, raza, color, sexo, esterilizado, chip, peso, fecha_nac) 
values(2, "Saiph", "Gato", "British Shorthair", "Gris", "Macho", true, false, 6.7, "2012-02-11");
INSERT INTO mascota(dueño_id, nombre, especie, raza, color, sexo, esterilizado, chip, peso, fecha_nac) 
values(5, "Pelusa", "Perro", "Poodle", "Blanco", "Hembra", false, false, 4.3, "2020-12-15");
INSERT INTO mascota(dueño_id, nombre, especie, raza, color, sexo, esterilizado, chip, peso, fecha_nac) 
values(3, "Dobby", "Perro", "Fox Terrier", "Típico", "Macho", true, true, 8.2, "2016-10-01");
INSERT INTO mascota(dueño_id, nombre, especie, raza, color, sexo, esterilizado, chip, peso, fecha_nac) 
values(4, "Pelusa", "Perro", "Bichón maltés", "Blanco", "Macho", true, true, 3.8, "2022-03-21");
INSERT INTO mascota(dueño_id, nombre, especie, raza, color, sexo, esterilizado, chip, peso, fecha_nac) 
values(2, "Nannuq", "Gato", "Cymric", "Negro con blanco", "Macho", true, false, 6.3, "2012-01-01");
INSERT INTO mascota(dueño_id, nombre, especie, raza, color, sexo, esterilizado, chip, peso, fecha_nac) 
values(2, "Ray", "Perro", "Basset leonado de Bretaña", "Típico", "Macho", false, false, 7.8, "2019-02-05");
INSERT INTO mascota(dueño_id, nombre, especie, raza, color, sexo, esterilizado, chip, peso, fecha_nac) 
values(5, "Maqui", "Perro", "Golden Retriever", "Rubio", "Macho", true, false, 28.8, "2015-06-30");
INSERT INTO mascota(dueño_id, nombre, especie, raza, color, sexo, esterilizado, chip, peso, fecha_nac) 
values(5, "Copito", "Gato", "Bosque de Noruega", "Típico", "Macho", true, true, 3.7, "2014-11-20");
INSERT INTO mascota(dueño_id, nombre, especie, raza, color, sexo, esterilizado, chip, peso, fecha_nac) 
values(5, "Leoncito", "Gato", "Bombay de pelo largo", "Negro", "Macho", true, false, 4.1, "2010-12-12");


-- Antiparasitarios --
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Interno", "Drontal", "2024-04-24", "2024-07-24", 1);
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Interno", "Drontal", "2024-05-20", "2024-08-20", 1);
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Externo", "Bravecto", "2023-12-24", "2024-03-24", 5);
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Interno", "Drontal", "2024-03-30", "2024-06-30", 5);
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Interno", "Drontal", "2024-07-05", "2024-10-05", 5);
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Interno", "Drontal", "2024-04-24", "2024-07-24", 3);
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Externo", "Bravecto", "2022-04-24", "2022-07-24", 2);
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Interno", "Drontal", "2022-12-30", "2023-03-30", 2);
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Interno", "Drontal", "2021-11-08", "2022-02-08", 4);
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Interno", "Drontal", "2022-03-10", "2022-06-10", 4);
INSERT INTO antiparasitarios(tipo, marca, fecha, proxima_fecha, mascota_id)
values("Externo", "Bravecto", "2022-06-17", "2022-09-17", 4);


-- Vacunas --
INSERT INTO vacunas(tipo, marca, fecha, fecha_proxima, mascota_id)
values("Antirrábica", "xxxx", "2024-01-28", "2026-01-28", 10);
INSERT INTO vacunas(tipo, marca, fecha, fecha_proxima, mascota_id)
values("Óctuple", "xxxx", "2024-04-30", "2025-04-30", 9);
INSERT INTO vacunas(tipo, marca, fecha, fecha_proxima, mascota_id)
values("Óctuple", "xxxx", "2023-10-10", "2024-10-10", 10);
INSERT INTO vacunas(tipo, marca, fecha, fecha_proxima, mascota_id)
values("Triple felina", "xxxx", "2024-07-10", "2025-07-10", 6);
INSERT INTO vacunas(tipo, marca, fecha, fecha_proxima, mascota_id)
values("KC", "xxxx", "2024-05-03", "2025-05-03", 1);
INSERT INTO vacunas(tipo, marca, fecha, fecha_proxima, mascota_id)
values("Óctuple", "xxxx", "2024-05-13", "2025-05-13", 1);
INSERT INTO vacunas(tipo, marca, fecha, fecha_proxima, mascota_id)
values("Antirrábica", "xxxx", "2024-05-13", "2026-05-13", 1);
INSERT INTO vacunas(tipo, marca, fecha, fecha_proxima, mascota_id)
values("Óctuple", "xxxx", "2024-06-22", "2025-06-22", 8);
INSERT INTO vacunas(tipo, marca, fecha, fecha_proxima, mascota_id)
values("Triple felina", "xxxx", "2022-10-07", "2023-10-07", 2);


-- Agenda --
INSERT INTO agenda(fecha, nombre_dueño, nombre_mascota)
values("2024-08-05", "Iñaki Vergara", "Pelusa");
INSERT INTO agenda(fecha, nombre_dueño, nombre_mascota)
values("2024-08-20", "Catalina Ortuzar", "Manchas");
INSERT INTO agenda(fecha, nombre_dueño, nombre_mascota)
values("2024-08-11", "Daniela Astudillo", "Yuki");
INSERT INTO agenda(fecha, nombre_dueño, nombre_mascota)
values("2024-08-31", "Patricio Collao", "Esponjoso");
INSERT INTO agenda(fecha, nombre_dueño, nombre_mascota)
values("2024-07-25", "Luis Moraga", "Pelusa");


-- Consultas --
INSERT INTO consulta(fecha_id, razon_consulta, peso, anamnesis, plan_diagnostico, plan_terapeutico, prediagnostico, diagnostico, tratamiento, mascota_id)
values(
	1, 
    "Control para vacunas", 
    4.5, 
    "Buen estaado de salud, sin hallazgos encontrados", 
    "Proseguir con vacunaciones",
    "Ninguno",
    "Ninguno",
    "Ninguno",
    "Se aplica la vauna antirrábica y óctuple. Dejar a disposición abundante agua",
    3
);
INSERT INTO consulta(fecha_id, razon_consulta, anamnesis, plan_diagnostico, plan_terapeutico, prediagnostico, diagnostico, tratamiento, fecha_proxima, mascota_id)
values(
	5, 
    "Urgencia por atropello", 
    "A primera vista se ve dañada la pata izquierda trasera y la cola",
    "Se prosigue realizar radiografías y ecografía para ver daño de huesos y tejidos",
    "Requerirá terapia de movilidad una vez haya reposado por los días a determinar",
    "Fractura de para izquierda trasera",
    "Fractura interna del hueso x de la pata trasera izquierda y esguince de grado 2 en la cola",
    "Mantener movilizado y que se mueva lo menos posible. Se receta x remedio cada 12 horas por 10 días. Próximo control en 10 días",
    "2024-08-04",
    5
);


-- Sección de consultas y subconsultas --
-- Muestra la agenda de los días próximos --
SELECT * FROM agenda
WHERE fecha >= DATE(NOW());

-- Muestra las mascotas ordenadas por dueño --
SELECT * FROM mascota
ORDER BY dueño_id ASC;

-- Vacunas y Antiparasitarios pendientes (1: pendiente, 0: no vencido) --
SELECT 
	MAX(fecha_proxima) < DATE(NOW()) AS "Vencimiento Vacuna", 
    MAX(fecha_proxima) AS "Próxima Vacuna", 
    m.nombre AS "Nombre Mascota", 
    tipo AS "Tipo Vacuna", 
    CONCAT(d.nombre, ' ', d.apellido) AS "Nombre Dueño"
FROM vacunas
JOIN mascota AS m
ON vacunas.mascota_id = m.id 
JOIN dueño AS d
ON d.id = m.dueño_id
GROUP BY mascota_id, tipo
ORDER BY MAX(fecha_proxima), MAX(fecha_proxima) < DATE(NOW()) DESC;

SELECT 
	MAX(proxima_fecha) < DATE(NOW()) AS "Vencimiento Antiparasitario", 
    MAX(proxima_fecha) AS "Próxima vacuna", 
    m.nombre AS "Nombre Mascota", 
    tipo AS "Tipo Antiparasitario", 
    CONCAT(d.nombre, ' ', d.apellido) AS "Nombre Dueño"
FROM antiparasitarios
JOIN mascota AS m
ON antiparasitarios.mascota_id = m.id 
JOIN dueño AS d
ON d.id = m.dueño_id
GROUP BY mascota_id, tipo
ORDER BY MAX(proxima_fecha), MAX(proxima_fecha) < DATE(NOW()) DESC;

-- Mascotas asociadas a cada dueño --
SELECT CONCAT(d.nombre, ' ', apellido) AS 'Nombre Dueño', m.nombre AS 'Nombre Mascota' 
FROM dueño AS d
JOIN mascota AS m
ON d.id = m.dueño_id;

-- Número de mascotas por dueño -- 
SELECT CONCAT(d.nombre, ' ', d.apellido) AS "Nombre Dueño", count(m.dueño_id) AS "Número de mascotas" 
FROM dueño AS d
JOIN mascota AS m
ON d.id = m.dueño_id
GROUP BY m.dueño_id;

-- Nombre de mascota 'Pelusa' repetido --
SELECT * FROM mascota
WHERE nombre LIKE 'Pelusa';

-- Mostrar los dueños que han puesto chip a alguna mascota --
SELECT CONCAT(d.nombre, ' ',d.apellido) AS 'Nombre Dueño', m.chip AS 'Chip' 
FROM dueño AS d
JOIN mascota AS m
ON d.id = m.dueño_id
WHERE chip = 1;

-- Mostrar historial de Antiparasitarios ordenados por mascota --
SELECT m.nombre AS "nombre mascota", a.* FROM antiparasitarios AS a
JOIN mascota AS m
ON m.id = a.mascota_id
ORDER BY a.mascota_id, a.fecha;

-- Historial de Vacunas ordenados por mascota --
SELECT m.nombre AS "nombre mascota", v.* FROM vacunas AS v
JOIN mascota AS m
ON m.id = v.mascota_id
ORDER BY v.mascota_id, v.fecha;

-- Cantidad de mascotas sin chip -- 
SELECT count(chip) AS "Cantidad de mascotas sin chip" FROM mascota
WHERE chip = 0;

-- Mostrar las mascotas que no tienen chip --
SELECT * FROM mascota
WHERE chip = 0;

-- Cálculo de la edad por mascota --
SELECT nombre, especie, raza, color, YEAR(NOW()) - YEAR(fecha_nac) AS "edad"
FROM mascota;

