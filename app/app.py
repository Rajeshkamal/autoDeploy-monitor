from flask import Flask, jsonify
app = Flask(__name__)
@app.route("/")
def home():
    return "<h1>AutoDeploy Monitor</h1><p>Your SRE Dashboard is running!</p>"
@app.route("/health")
def health():
    return jsonify({
        "status":"ok",
        "message":"app is healthy"
    })
@app.route("/info")
def info():
    return jsonify({
        "app-name": "AutoDeploy Monitor",
        "version": "1.0.0",
        "environment": "development"
    })
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
