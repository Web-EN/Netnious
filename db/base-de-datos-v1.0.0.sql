CREATE TYPE roles_name AS ENUM (
    'director',
    'profesor',
    'alumno'
);

CREATE TABLE "Clase-Horario" (
    "Horario_id" INT NOT NULL,
    "Clase_id" INT NOT NULL
);

CREATE TABLE "Nivel" (
    "id" SERIAL PRIMARY KEY,
    "nivel" VARCHAR(255) NOT NULL,
    "orden_nivel" INT NOT NULL
);

CREATE TABLE "Cursos" (
    "id" SERIAL PRIMARY KEY,
    "Nombre del curso" VARCHAR(255) NOT NULL
);

CREATE TABLE "Profesores" (
    "id" SERIAL PRIMARY KEY,
    "Nombres" VARCHAR(255) NOT NULL,
    "Apellidos" VARCHAR(255) NOT NULL,
    "Documento de Identidad" INT NOT NULL,
    "Fecha de Nacimiento" DATE NOT NULL,
    "Correo Electronico" VARCHAR(255) NOT NULL,
    "Telefono" INT NOT NULL,
    "Direccion" VARCHAR(255) NOT NULL,
    "Usuario_id" INT NOT NULL
);

CREATE TABLE "Alumno" (
    "id" SERIAL PRIMARY KEY,
    "Nombres" VARCHAR(255) NOT NULL,
    "Apellido Paterno" VARCHAR(255) NOT NULL,
    "Apellido Materno" VARCHAR(255) NOT NULL,
    "Documento de Identidad" INT NOT NULL,
    "Fecha de Nacimiento" DATE NOT NULL,
    "Apoderado_id" INT NOT NULL,
    "Usuario_id" INT NOT NULL
);

CREATE TABLE "Año escolar" (
    "id" SERIAL PRIMARY KEY,
    "año" INT NOT NULL,
    "comienzo" DATE NOT NULL,
    "finalizacion" DATE NOT NULL
);

CREATE TABLE "Clases" (
    "id" SERIAL PRIMARY KEY,
    "Nombre de clase" VARCHAR(255) NOT NULL,
    "Periodo_id" INT NOT NULL,
    "Profesor_id" INT NOT NULL,
    "Curso_id" INT NOT NULL
);

CREATE TABLE "Roles" (
    "id" SERIAL PRIMARY KEY,
    "rol" roles_name NOT NULL,
    "permisos" INT NOT NULL
);

CREATE TABLE "Año y nivel del alumno" (
    "Alumno_id" INT NOT NULL,
    "Nivel_id" INT NOT NULL,
    "Año_id" INT NOT NULL
);

CREATE TABLE "Periodos" (
    "id" SERIAL PRIMARY KEY,
    "año_id" INT NOT NULL,
    "periodo" VARCHAR(255) NOT NULL,
    "comienzo" DATE NOT NULL,
    "finalizacion" DATE NOT NULL
);

CREATE TABLE "Apoderado" (
    "id" SERIAL PRIMARY KEY,
    "Nombre" VARCHAR(255) NOT NULL,
    "Apellido Paterno" VARCHAR(255) NOT NULL,
    "Apellido Materno" VARCHAR(255) NOT NULL,
    "Documento de Identidad" INT NOT NULL,
    "Parentesco" VARCHAR(255) NOT NULL,
    "Fecha de Nacimiento" DATE NOT NULL,
    "Dirección" VARCHAR(255) NOT NULL,
    "Teléfono" INT NOT NULL
);

CREATE TABLE "Clase-Alumno" (
    "Clase_id" INT NOT NULL,
    "Alumno_id" INT NOT NULL,
    "Nota_id" INT NOT NULL
);

CREATE TABLE "Notas" (
    "id" SERIAL PRIMARY KEY,
    "Practica" DOUBLE PRECISION NOT NULL,
    "Examen Mensual" DOUBLE PRECISION NOT NULL,
    "Examen Bimestral" DOUBLE PRECISION NOT NULL
);

CREATE TABLE "Horario" (
    "id" SERIAL PRIMARY KEY,
    "Dia_id" INT NOT NULL,
    "Hora de finalización" TIME NOT NULL,
    "Hora de comienzo" TIME NOT NULL
);

CREATE TABLE "Usuarios" (
    "id" SERIAL PRIMARY KEY,
    "usuario" VARCHAR(255) NOT NULL,
    "hashed_pass" VARCHAR NOT NULL,
    "sal" VARCHAR NOT NULL,
    "Rol_id" INT NOT NULL
);

ALTER TABLE "Clase-Alumno" ADD CONSTRAINT "clase_alumno_alumno_id_foreign" FOREIGN KEY("Alumno_id") REFERENCES "Alumno"("id");
ALTER TABLE "Año y nivel del alumno" ADD CONSTRAINT "año y nivel del alumno_nivel_id_foreign" FOREIGN KEY("Nivel_id") REFERENCES "Nivel"("id");
ALTER TABLE "Alumno" ADD CONSTRAINT "alumno_usuario_id_foreign" FOREIGN KEY("Usuario_id") REFERENCES "Usuarios"("id");
ALTER TABLE "Clases" ADD CONSTRAINT "clases_periodo_id_foreign" FOREIGN KEY("Periodo_id") REFERENCES "Periodos"("id");
ALTER TABLE "Año y nivel del alumno" ADD CONSTRAINT "año y nivel del alumno_año_id_foreign" FOREIGN KEY("Año_id") REFERENCES "Año escolar"("id");
ALTER TABLE "Alumno" ADD CONSTRAINT "alumno_apoderado_id_foreign" FOREIGN KEY("Apoderado_id") REFERENCES "Apoderado"("id");
ALTER TABLE "Profesores" ADD CONSTRAINT "profesores_usuario_id_foreign" FOREIGN KEY("Usuario_id") REFERENCES "Usuarios"("id");
ALTER TABLE "Clase-Horario" ADD CONSTRAINT "clase_horario_horario_id_foreign" FOREIGN KEY("Horario_id") REFERENCES "Horario"("id");
ALTER TABLE "Usuarios" ADD CONSTRAINT "usuarios_rol_id_foreign" FOREIGN KEY("Rol_id") REFERENCES "Roles"("id");
ALTER TABLE "Clase-Horario" ADD CONSTRAINT "clase_horario_clase_id_foreign" FOREIGN KEY("Clase_id") REFERENCES "Clases"("id");
ALTER TABLE "Clase-Alumno" ADD CONSTRAINT "clase_alumno_nota_id_foreign" FOREIGN KEY("Nota_id") REFERENCES "Notas"("id");
ALTER TABLE "Clases" ADD CONSTRAINT "clases_curso_id_foreign" FOREIGN KEY("Curso_id") REFERENCES "Cursos"("id");
ALTER TABLE "Clases" ADD CONSTRAINT "clases_profesor_id_foreign" FOREIGN KEY("Profesor_id") REFERENCES "Profesores"("id");
ALTER TABLE "Año y nivel del alumno" ADD CONSTRAINT "año y nivel del alumno_alumno_id_foreign" FOREIGN KEY("Alumno_id") REFERENCES "Alumno"("id");
ALTER TABLE "Periodos" ADD CONSTRAINT "periodos_año_id_foreign" FOREIGN KEY("año_id") REFERENCES "Año escolar"("id");
ALTER TABLE "Clase-Alumno" ADD CONSTRAINT "clase_alumno_clase_id_foreign" FOREIGN KEY("Clase_id") REFERENCES "Clases"("id");

CREATE TABLE "Anuncio" (
    "id" SERIAL PRIMARY KEY,
    "mensaje" TEXT,
    "fecha" DATE NOT NULL
);

CREATE TABLE "Documento" (
    "id" SERIAL PRIMARY KEY,
    "nombre" VARCHAR(255) NOT NULL,
    "ruta_archivo" VARCHAR(255) NOT NULL
);