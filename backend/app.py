from flask import Flask, jsonify
from flask_cors import CORS
import psycopg2
import psycopg2.extras
import os

app = Flask(__name__)
CORS(app)

#funcion para establecer y devolver conexion con bd usando variables de entorno
def get_db_connection():
    conn = psycopg2.connect(
        host=os.environ.get('POSTGRES_HOST'),
        database=os.environ.get('POSTGRES_DB'),
        user=os.environ.get('POSTGRES_USER'),
        password=os.environ.get('POSTGRES_PASSWORD')
    )
    return conn

#devuelve estado activo para healthcheck de docker
@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({"status": "active"}), 200

#obtiene datos de integrantes desde bd
@app.route('/api/team', methods=['GET'])
def get_team():
    try: 
        conn = get_db_connection() #instancia conexion a bd

        #crea cursor que formatea datos q obtendra al realizar la query en formato campo:valor
        cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        cur.execute('SELECT * FROM members;')
        members = cur.fetchall() #extrae resultado de query y los guarda en var 'members'
        cur.close() #destruye cursor (libera memoria del servidor)
        conn.close() #cierra conexion a bd
        return jsonify(members), 200 #convierte la respuesta a json y la envia
    except Exception as e:
        return jsonify({"error": str(e)}), 500

#devuelve metadatos del back
@app.route('/api/info', methods=['GET'])
def get_info():
    return jsonify({"service": "backend", "version": "1.0", "language": "python 3.12"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)