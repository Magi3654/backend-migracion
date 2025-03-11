import pandas as pd
import pymysql
import os

# Conectar a la base de datos
conn = pymysql.connect(host="10.4.8.40", user="ilse", password="", database="inegi_db")
cursor = conn.cursor()

# Lista de archivos CSV y sus respectivas tablas
files_and_tables = {
    "establecimientos.csv": "establecimientos",
    "contactos.csv": "contactos",
    "ubicaciones.csv": "ubicaciones",
    "actividades.csv": "actividades",
    "direcciones.csv": "direcciones",
    "municipios.csv": "municipios",
    "tipos_vialidad.csv": "tipos_vialidad",
    "tipos_asentamiento.csv": "tipos_asentamiento"
}

for file_path, table_name in files_and_tables.items():
    if os.path.exists(file_path):
        # Leer el archivo CSV
        df = pd.read_csv(file_path)

        # Insertar datos en MySQL
        if table_name == "establecimientos":
            query = "INSERT INTO establecimientos (nom_estab, raz_social, codigo_act, fecha_alta) VALUES (%s, %s, %s, %s)"
        elif table_name == "contactos":
            query = "INSERT INTO contactos (establecimiento_id, telefono, correoelec, www, contactos) VALUES (%s, %s, %s, %s, %s)"
        elif table_name == "ubicaciones":
            query = "INSERT INTO ubicaciones (establecimiento_id, latitud, longitud) VALUES (%s, %s, %s)"
        elif table_name == "actividades":
            query = "INSERT INTO actividades (establecimiento_id, codigo_act) VALUES (%s, %s)"
        elif table_name == "direcciones":
            query = "INSERT INTO direcciones (establecimiento_id, numero_ext, edificio, edificio_e, numero_int, nomb_asent, cod_postal, municipio_id, tipo_vial_id, tipo_asent_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        elif table_name == "municipios":
            query = "INSERT INTO municipios (cve_mun, cve_loc, nombre_municipio, nombre_localidad) VALUES (%s, %s, %s, %s)"
        elif table_name == "tipos_vialidad":
            query = "INSERT INTO tipos_vialidad (tipo_vial) VALUES (%s)"
        elif table_name == "tipos_asentamiento":
            query = "INSERT INTO tipos_asentamiento (tipo_asent) VALUES (%s)"

        cursor.executemany(query, df.values.tolist())
        conn.commit()
        print(f"Datos de {file_path} migrados a {table_name}.")
    else:
        print(f"El archivo {file_path} no existe.")

conn.close()
print("Migración completada.")
