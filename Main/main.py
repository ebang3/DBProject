import os
import mysql.connector
from mysql.connector import Error
from dotenv import load_dotenv

# Load environment variables
load_dotenv()
user = os.getenv("MYSQL_USER")
password = os.getenv("MYSQL_PASSWORD")

# Path to the SQL file
sql_file_path = "setup.sql"  # Make sure this path is correct

try:
    # Connect to MySQL
    conn = mysql.connector.connect(
        host="localhost",
        user=user,
        password=password,
        database="dbmap"
    )
    cursor = conn.cursor()
    print("Connected to MySQL database successfully")

    # Test the connection with a simple query
    cursor.execute("SELECT DATABASE();")
    database_name = cursor.fetchone()
    print("Connected to database:", database_name[0])

    ### INSERTS DATA INTO DATABASE (COMMENT OUT AFTER INSERTING DATA)

    # Read and execute the SQL file
    with open(sql_file_path, 'r') as file:
        sql_commands = file.read()

    # Split commands by semicolon and execute each one
    for command in sql_commands.split(';'):
        if command.strip():  # Skip empty commands
            cursor.execute(command)
            conn.commit()  # Commit after each command if needed

    print("SQL file executed successfully")

    #######

    ### READ DATA FROM DATABASE (MAKE SURE TO HAVE INSERTED DATA BEFORE HAND)

    # Example 1: Read data from 'states' table
    cursor.execute("SELECT * FROM states;")
    states = cursor.fetchall()
    print("States:")
    for state in states:
        print(state)  # Each 'state' is a tuple of column values

    # Example 2: Read data from 'regions' table
    cursor.execute("SELECT * FROM regions;")
    regions = cursor.fetchall()
    print("\nRegions:")
    for region in regions:
        print(region)

    # Example 3: Read data from 'demographics' table
    cursor.execute("SELECT * FROM demographics;")
    demographics = cursor.fetchall()
    print("\nDemographics:")
    for demographic in demographics:
        print(demographic)

    # Example 4: Read data from 'diversity' table
    cursor.execute("SELECT * FROM diversity;")
    diversity_data = cursor.fetchall()
    print("\nDiversity:")
    for diversity in diversity_data:
        print(diversity)

    # Example 5: Read data from 'economy' table
    cursor.execute("SELECT * FROM economy;")
    economy_data = cursor.fetchall()
    print("\nEconomy:")
    for economy in economy_data:
        print(economy)

except Error as e:
    print("Error connecting to MySQL or executing SQL file:", e)

finally:
    # Close the connection
    if conn.is_connected():
        cursor.close()
        conn.close()
        print("MySQL connection is closed")
