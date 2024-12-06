from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import ForeignKey
from sqlalchemy.dialects.mysql import JSON
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


class Demographics(db.Model):
    __tablename__='demographics'
    DemographicID=db.Column(db.Integer, primary_key=True, nullable=False)
    StateID=db.Column(db.Integer, db.ForeignKey('states.StateID'), nullable=False)
    TotalPopulation=db.Column(db.Integer, nullable=True)
    AgeDistribution=db.Column(JSON, nullable=True)
    MedianAge=db.Column(db.Numeric(3,1), nullable=True)
    UrbanizatonRate=db.Column(db.Numeric(5,2), nullable=True)

class Diversity(db.Model):
    __tablename__='diversity'
    DiversityID=db.Column(db.Integer, primary_key=True, nullable=False)
    StateID=db.Column(db.Integer, db.ForeignKey('states.StateID'), nullable=False)
    RaceEthnicity=db.Column(JSON, nullable=True)

class Economy(db.Model):
    __tablename__='economy'
    EconomyID=db.Column(db.Integer, primary_key=True, nullable=False)
    StateID=db.Column(db.Integer, db.ForeignKey('states.StateID'), nullable=False)
    GrossStateProduct=db.Column(db.Numeric(10,2), nullable=True)
    UnemploymentRate=db.Column(db.Numeric(4,2), nullable=True)
    MedianHouseholdIncome=db.Column(db.Integer, nullable=True)
    PovertyRate=db.Column(db.Numeric(4,2), nullable=True)
    MajorIndustries=db.Column(JSON, nullable=True)

class Regions(db.Model):
    __tablename__='regions'
    RegionID=db.Column(db.Integer, primary_key=True, nullable=False)
    RegionName=db.Column(db.String(50), nullable=True)
    StateCount=db.Column(db.Integer, nullable=True)

class States(db.Model):
    __tablename__='states'
    StateID=db.Column(db.Integer, primary_key=True, nullable=False)
    Name=db.Column(db.String(50), nullable=True)
    Nickname=db.Column(db.String(50), nullable=True)
    Capital=db.Column(db.String(50), nullable=True)
    Size=db.Column(db.Integer, nullable=True)
    RegionID=db.Column(db.Integer, db.ForeignKey('regions.RegionID'))

