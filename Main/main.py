import os
from pymongo import MongoClient
from dotenv import load_dotenv

load_dotenv()
password = os.getenv("MONGO_PASSWORD")
print("MongoDB password:", password)
conn = f"mongodb+srv://admin:{password}@dbmap.cvnuy.mongodb.net/DBProject?retryWrites=true&w=majority"
client = MongoClient(conn)


# Test the connection
try:
    # Get a list of databases
    databases = client.list_database_names()
    print("Connected to MongoDB. Databases:", databases)

    # Select the database
    db = client["DBMap"]  # Replace with your database name
    print("Using database:", db.name)

    # You can also test collections
    collections = db.list_collection_names()
    print("Collections in the database:", collections)

except Exception as e:
    print("Error connecting to MongoDB:", str(e))

# Testing data
states_data = [
    {"StateID": 1, "Name": "California", "Nickname": "Golden State", "Capital": "Sacramento", "Size": 163696, "RegionID": 1},
    {"StateID": 2, "Name": "Texas", "Nickname": "Lone Star State", "Capital": "Austin", "Size": 268596, "RegionID": 2},
    {"StateID": 3, "Name": "Florida", "Nickname": "Sunshine State", "Capital": "Tallahassee", "Size": 65758, "RegionID": 3}
]

regions_data = [
    {"RegionID": 1, "RegionName": "West", "StateCount": 13},
    {"RegionID": 2, "RegionName": "South", "StateCount": 16},
    {"RegionID": 3, "RegionName": "Southeast", "StateCount": 12}
]

demographic_data = [
    {"DemographicID": 1, "StateID": 1, "TotalPopulation": 39538223, "AgeDistribution": {"0-18": 23.5, "19-34": 22.5, "35-54": 27, "55-74": 20, "75+": 7}, "MedianAge": 36.5, "UrbanizationRate": 95},
    {"DemographicID": 2, "StateID": 2, "TotalPopulation": 29145505, "AgeDistribution": {"0-18": 25.2, "19-34": 20.4, "35-54": 28.2, "55-74": 19.2, "75+": 7}, "MedianAge": 35.5, "UrbanizationRate": 85},
    {"DemographicID": 3, "StateID": 3, "TotalPopulation": 21538187, "AgeDistribution": {"0-18": 21.3, "19-34": 21.1, "35-54": 26.8, "55-74": 22.8, "75+": 8}, "MedianAge": 42, "UrbanizationRate": 91}
]

diversity_data = [
    {"DiversityID": 1, "StateID": 1, "RaceEthnicity": {"White": 39.4, "Hispanic": 39.3, "Black": 6.5, "Asian": 15.5, "Other": 2.3}},
    {"DiversityID": 2, "StateID": 2, "RaceEthnicity": {"White": 41.2, "Hispanic": 40.2, "Black": 12.5, "Asian": 5, "Other": 1.1}},
    {"DiversityID": 3, "StateID": 3, "RaceEthnicity": {"White": 53.3, "Hispanic": 26.3, "Black": 16, "Asian": 2.9, "Other": 1.5}}
]

economy_data = [
    {"EconomyID": 1, "StateID": 1, "GrossStateProduct": 3200000, "UnemploymentRate": 7.5, "MedianHouseholdIncome": 80000, "PovertyRate": 12, "MajorIndustries": ["Technology", "Agriculture", "Entertainment"]},
    {"EconomyID": 2, "StateID": 2, "GrossStateProduct": 1800000, "UnemploymentRate": 6.7, "MedianHouseholdIncome": 64000, "PovertyRate": 14.5, "MajorIndustries": ["Energy", "Agriculture", "Manufacturing"]},
    {"EconomyID": 3, "StateID": 3, "GrossStateProduct": 1100000, "UnemploymentRate": 5.9, "MedianHouseholdIncome": 58000, "PovertyRate": 13, "MajorIndustries": ["Tourism", "Agriculture", "Healthcare"]}
]

# Use this to delete all data
# Delete old data from MongoDB
collections = db.list_collection_names()
for collection_name in collections:
    collection = db[collection_name]
    result = collection.delete_many({})
    print("Data from", collection_name, "deleted")

# Insert testing data into MongoDB
db.State.insert_many(states_data)
db.Region.insert_many(regions_data)
db.Demographic.insert_many(demographic_data)
db.Diversity.insert_many(diversity_data)
db.Economy.insert_many(economy_data)

print("Testing Data inserted successfully!")