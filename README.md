# Migración de Datos desde CSV a MySQL

Este proyecto permite migrar datos desde archivos CSV a una base de datos MySQL. Los archivos CSV contienen datos relacionados con establecimientos, contactos, ubicaciones, actividades, direcciones, municipios, tipos de vialidad y tipos de asentamiento. El script automatiza el proceso de leer los archivos CSV y cargar los datos en las tablas correspondientes de una base de datos.

## Requisitos

Asegúrate de tener los siguientes requisitos:

- Python 3.x
- Las siguientes bibliotecas de Python:
  - `pandas`: Para manejar archivos CSV.
  - `pymysql`: Para interactuar con la base de datos MySQL.
  - `os`: Para verificar la existencia de archivos CSV.

Puedes instalar las dependencias usando `pip`:

```bash
pip install pandas pymysql

