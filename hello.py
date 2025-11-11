from flask import Flask, render_template, redirect, url_for

app = Flask(__name__)


# Renders template
@app.route("/")
def hello_world():
    return render_template("index.html")


# Always redirects to hellow world
@app.route("/<path:any_path>")
def redirect_to_home(any_path):
    return redirect(url_for("hello_world"))
