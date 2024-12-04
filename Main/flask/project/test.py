from project import db
from .models import Demographics  # Import the Demographics model

# Fetch all demographic records
demographics_list = Demographics.query.all()

# Loop through the fetched records and print relevant details
for demographic in demographics_list:
    # Print Demographic data
    print(f"Demographic ID: {demographic.DemographicID}")
    print(f"Total Population: {demographic.TotalPopulation}")
    print(f"Age Distribution: {demographic.AgeDistribution}")
    print(f"Median Age: {demographic.MedianAge}")
    print(f"Urbanization Rate: {demographic.UrbanizatonRate}")
    
    # If there's a relationship with 'State', print State details
    if demographic.state:  # Ensure the related state data exists
        print(f"State: {demographic.state.Name}")  # This is assuming 'state' is the relationship name
    else:
        print("No related state found")

    print('-' * 50)  # Print a separator for clarity
