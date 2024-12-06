from flask import Flask, request, jsonify, url_for, redirect, render_template
from init import create_app
from init.models import Demographics, Diversity, Economy, Regions, States
from init import db
import geopandas as gpd
import plotly.express as px
import plotly.graph_objects as go

app = create_app()

# Load the shapefile for U.S. states (adjust path as necessary)
gdf = gpd.read_file("./mapfiles/ne_10m_admin_1_states_provinces.shp")

# Filter for U.S. states only
us_states = gdf[gdf['iso_a2'] == 'US']

# Reproject to make compatible with Plotly's maps
us_states = us_states.to_crs("EPSG:4326")

# Add a custom column for the hover text you want
us_states['hover_text'] = us_states['name']  # Customize this line as needed

# Convert geometries to geojson format
geojson = us_states.geometry.__geo_interface__  # Convert to proper GeoJSON format

@app.template_filter('format_number')
def format_number(value):
    if isinstance(value, (int, float)):
        return "{:,}".format(value)
    return value

@app.route('/')
def index():
    # Create the Plotly figure
    fig = px.choropleth(
        data_frame=us_states,
        geojson=geojson, 
        locations=us_states.index,
        hover_name="name",  
        title="Interactive Map of U.S. States"
    )
    # Set the geo properties to display the map properly
    fig.update_geos(
        visible=False,
        showcountries=True,
        countrycolor="Black",
        showsubunits=True,
        subunitcolor="Gray",
    )
    # Add JavaScript for handling the click event and redirect
    fig.update_layout(
        geo=dict(
            scope="usa",
            projection_type="albers usa",
        ),
        hovermode="closest",
        # Include the custom click handling via JavaScript
        annotations=[
            dict(
                x=0.5,
                y=0.5,
                showarrow=False,
                text="Click a state to get details!",
                font=dict(size=15, color="black"),
                align="center"
            )
        ],
        # Embed Plotly chart as an HTML div
        plot_bgcolor="white"
    )
    # Include a JavaScript script for redirection on click
    plot_div = fig.to_html(full_html=False, include_plotlyjs='cdn')
    
    return render_template('index.html', plot_div=plot_div)

@app.route('/state/<state_name>')
def state_page(state_name):
    # Query the data for the selected state
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
     .filter(States.Name == state_name) \
     .all()  # Filter to match the selected state

    # Process data for the selected state
    state_data = {
        'state_name': state_name,
        'demographics': [],
        'diversity': [],
        'economy': [],
        'regions': [],
    }

    for row in data:
        # Append data for the state
        state_data['demographics'].append({
            'total_population': row.Demographics.TotalPopulation,
            'age_distribution': row.Demographics.AgeDistribution,
            'median_age': row.Demographics.MedianAge,
            'urbanization_rate': row.Demographics.UrbanizatonRate,
        })
        state_data['diversity'].append({
            'race_ethnicity': row.Diversity.RaceEthnicity,
        })
        state_data['economy'].append({
            'gsp': row.Economy.GrossStateProduct,
            'unemployment_rate': row.Economy.UnemploymentRate,
            'median_household_income': row.Economy.MedianHouseholdIncome,
            'poverty_rate': row.Economy.PovertyRate,
            'major_industries': row.Economy.MajorIndustries,
        })
        state_data['regions'].append({
            'region_name': row.Regions.RegionName,
            'state_count': row.Regions.StateCount,
        })

    # Render the state-specific page with the queried data
    return render_template('state_page.html', state_data=state_data)

@app.route('/states')
def states_table():
    # Query the data for all states
    states_data = db.session.query(
        States.Name,
        Demographics.TotalPopulation,
        Demographics.MedianAge,
        Demographics.AgeDistribution,
        Demographics.UrbanizatonRate,
        Diversity.RaceEthnicity,
        Economy.GrossStateProduct,
        Economy.MedianHouseholdIncome,
        Economy.UnemploymentRate,
        Economy.PovertyRate,
        Economy.MajorIndustries,
        Regions.RegionName
    ).join(Demographics, Demographics.StateID == States.StateID) \
     .join(Diversity, Diversity.StateID == States.StateID) \
     .join(Economy, Economy.StateID == States.StateID) \
     .join(Regions, States.RegionID == Regions.RegionID) \
     .all()

    # Prepare the data for the template
    state_data = []
    for row in states_data:
        state_data.append({
            'name': row.Name,
            'total_population': row.TotalPopulation,
            'median_age': row.MedianAge,
            'age_distribution': row.AgeDistribution,
            'urbanization_rate': row.UrbanizatonRate,
            'race_ethnicity': row.RaceEthnicity,
            'gsp': row.GrossStateProduct,
            'median_household_income': row.MedianHouseholdIncome,
            'unemployment_rate': row.UnemploymentRate,
            'poverty_rate': row.PovertyRate,
            'major_industries': row.MajorIndustries,
            'region_name': row.RegionName,
        })

    # Render the states table page with the queried data
    return render_template('states_table.html', state_data=state_data)

if __name__ == '__main__':
    app.run(debug=True)
    