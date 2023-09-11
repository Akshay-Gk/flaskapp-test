from flask import Flask
import os
 
app = Flask(__name__)
@app.route('/')
def index():
    return '<h1><center>Flask application version3</center></h1>'
 
flask_port = os.getenv('FLASK_PORT',8080)
app.run(host='0.0.0.0', port=flask_port)
