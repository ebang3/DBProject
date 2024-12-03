from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from . import db
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin

class User(UserMixin, db.Model):
    __tablename__='user'
    id=db.Column(db.Integer, primary_key=True)
    username=db.Column(db.String(100), unique=True, nullable=False)
    email=db.Column(db.String(100),unique=True)
    password_hash = db.Column(db.String(128), nullable=False)
    
    def __repr__(self):
        return '<User %r> ' % self.username

