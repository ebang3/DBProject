from flask import Flask, request, jsonify, url_for, redirect, render_template
from project import create_app
from project.models import Demographics, Diversity, Economy, Regions, States
from project import db
app = create_app()

@app.route('/', methods=['GET'])
def home():
    return render_template('index.html')

@app.route('/map', methods=['GET'])
def hello():
    return jsonify({'message': 'MAP'})

@app.route('/demographics', methods=['GET'])
def states():
    # Query the data and get all the results
    data = db.session.query(
        Demographics,
        Diversity,
        Economy,
        Regions,
        States
    ).join(States, Demographics.StateID == States.StateID) \
     .join(Diversity, Diversity.StateID == States.StateID) \
     .join(Economy, Economy.StateID == States.StateID) \
     .join(Regions, States.RegionID == Regions.RegionID) \
     .all()  # Execute the query and return all results as a list
    
    # Group the data by StateID (this step is optional depending on how you want to display)
    grouped_data = {}
    for row in data:
        state_id = row.States.StateID
        if state_id not in grouped_data:
            grouped_data[state_id] = {
                'state_name': row.States.Name,
                'demographics': [],
                'diversity': [],
                'economy': [],
                'regions': [],
            }
        
        # Group the data for each state
        grouped_data[state_id]['demographics'].append({
            'total_population': row.Demographics.TotalPopulation,
            'age_distribution': row.Demographics.AgeDistribution,
            'median_age': row.Demographics.MedianAge,
            'urbanization_rate': row.Demographics.UrbanizatonRate
        })
        grouped_data[state_id]['diversity'].append({
            'race_ethnicity': row.Diversity.RaceEthnicity
        })
        grouped_data[state_id]['economy'].append({
            'gsp': row.Economy.GrossStateProduct,
            'unemployment_rate': row.Economy.UnemploymentRate,
            'median_household_income': row.Economy.MedianHouseholdIncome,
            'poverty_rate': row.Economy.PovertyRate,
            'major_industries': row.Economy.MajorIndustries
        })
        grouped_data[state_id]['regions'].append({
            'region_name': row.Regions.RegionName,
            'state_count': row.Regions.StateCount
        })
    
    return render_template('demographics.html', state_data=grouped_data)

if __name__ == '__main__':
    app.run(debug=True)
    