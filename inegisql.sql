CREATE DATABASE inegi_db;


CREATE TABLE establecimientos (
    id SERIAL PRIMARY KEY,
    nom_estab TEXT NOT NULL,
    raz_social TEXT NOT NULL,
    codigo_act TEXT NOT NULL,
    fecha_alta DATE NOT NULL
);

CREATE TABLE contactos (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    establecimiento_id BIGINT UNSIGNED NOT NULL,
    telefono TEXT,
    correoelec TEXT,
    www TEXT,
    contactos TEXT,
    CONSTRAINT fk_contactos_establecimiento FOREIGN KEY (establecimiento_id) 
        REFERENCES establecimientos(id) ON DELETE CASCADE
);

CREATE TABLE ubicaciones (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    establecimiento_id BIGINT UNSIGNED NOT NULL,
    latitud TEXT,
    longitud TEXT,
    CONSTRAINT fk_ubicaciones_establecimiento FOREIGN KEY (establecimiento_id) 
        REFERENCES establecimientos(id) ON DELETE CASCADE
);

CREATE TABLE actividades (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    establecimiento_id BIGINT UNSIGNED NOT NULL,
    codigo_act TEXT NOT NULL,
    CONSTRAINT fk_actividades_establecimiento FOREIGN KEY (establecimiento_id) 
        REFERENCES establecimientos(id) ON DELETE CASCADE
);

CREATE TABLE direcciones (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    establecimiento_id BIGINT UNSIGNED NOT NULL,
    numero_ext TEXT,
    edificio TEXT,
    edificio_e TEXT,
    numero_int TEXT,
    nomb_asent TEXT,
    cod_postal TEXT,
    municipio_id BIGINT UNSIGNED NOT NULL,
    tipo_vial_id BIGINT UNSIGNED NOT NULL,
    tipo_asent_id BIGINT UNSIGNED NOT NULL,
    CONSTRAINT fk_direcciones_establecimiento FOREIGN KEY (establecimiento_id) 
        REFERENCES establecimientos(id) ON DELETE CASCADE,
    CONSTRAINT fk_direcciones_municipio FOREIGN KEY (municipio_id) 
        REFERENCES municipios(id) ON DELETE CASCADE,
    CONSTRAINT fk_direcciones_tipo_vial FOREIGN KEY (tipo_vial_id) 
        REFERENCES tipos_vialidad(id) ON DELETE CASCADE,
    CONSTRAINT fk_direcciones_tipo_asent FOREIGN KEY (tipo_asent_id) 
        REFERENCES tipos_asentamiento(id) ON DELETE CASCADE
);


CREATE TABLE municipios (
    id SERIAL PRIMARY KEY,
    cve_mun TEXT,
    cve_loc TEXT,
    nombre_municipio TEXT NOT NULL,
    nombre_localidad TEXT NOT NULL
);

CREATE TABLE tipos_vialidad (
    id SERIAL PRIMARY KEY,
    tipo_vial TEXT NOT NULL
);

CREATE TABLE tipos_asentamiento (
    id SERIAL PRIMARY KEY,
    tipo_asent TEXT NOT NULL
);

