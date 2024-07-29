from flask import Flask, send_file, jsonify, request
import geotiff

app = Flask(__name__, static_url_path='', static_folder='static')

@app.route('/')
def index():
    return send_file('static/leaflet/index.html')

if __name__ == '__main__':
    app.run(debug=True)