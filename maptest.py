from flask import Flask, render_template, jsonify
import geopandas as gpd
import plotly.express as px

app = Flask(__name__)

# Load the shapefile for U.S. states (adjust path as necessary)
gdf = gpd.read_file("../mapfiles/ne_10m_admin_1_states_provinces.shp")

# Filter for U.S. states only
us_states = gdf[gdf['iso_a2'] == 'US']

# Reproject to make compatible with Plotly's maps
us_states = us_states.to_crs("EPSG:4326")

# Add a custom column for hover text
us_states['hover_text'] = us_states['name']

# Convert geometries to GeoJSON format
geojson = us_states.geometry.__geo_interface__

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
        visible=True,  # Make the map visible
        showcountries=True,
        countrycolor="Black",
        showsubunits=True,
        subunitcolor="Gray",
    )

    # Prepare the map for rendering
    fig.update_layout(
        hovermode="closest",
        geo=dict(
            scope="usa",
            projection_type="albers usa",
        )
    )

    # Plotly figure HTML representation
    graph_html = fig.to_html(full_html=False)


    # Render the HTML template and pass graph_html
    return render_template('index.html', graph_html=graph_html)

@app.route('/state/<state_id>')
def state_info(state_id):
    # Retrieve the state name based on the clicked state ID (index)
    try:
        clicked_state = us_states.iloc[int(state_id)]  # Convert state_id to index
        state_name = clicked_state['name']
        # Respond with a JSON object containing the state name
        return jsonify({"message": f"State clicked: {state_name}"})
    except IndexError:
        return jsonify({"error": "Invalid state clicked"}), 400

if __name__ == "__main__":
    app.run(debug=True)
