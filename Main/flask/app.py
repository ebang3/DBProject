from flask import Flask, request, jsonify, url_for, redirect, render_template
from project import create_app

app = create_app()

@app.route('/', methods=['GET'])
def home():
    return render_template('index.html')

@app.route('/map', methods=['GET'])
def hello():
    return jsonify({'message': 'MAP'})

if __name__ == '__main__':
    app.run(debug=True)
    