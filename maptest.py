from flask import Flask, render_template
import geopandas as gpd
import plotly.express as px
import plotly.graph_objects as go

app = Flask(__name__)

# Load the shapefile for U.S. states (adjust path as necessary)
gdf = gpd.read_file("../mapfiles/ne_10m_admin_1_states_provinces.shp")

# Filter for U.S. states only
us_states = gdf[gdf['iso_a2'] == 'US']

# Reproject to make compatible with Plotly's maps
us_states = us_states.to_crs("EPSG:4326")

# Add a custom column for the hover text you want
us_states['hover_text'] = us_states['name']  # Customize this line as needed

# Convert geometries to geojson format
geojson = us_states.geometry.__geo_interface__  # Convert to proper GeoJSON format

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
        # Add JavaScript for the redirection logic
        updatemenus=[dict(
            type='buttons', 
            showactive=False, 
            buttons=[dict(
                label="Click a state",
                method="relayout",
                args=[{"mapbox.center": {"lat": 37.0902, "lon": -95.7129}}]  # Adjust this to center the map
            )]
        )],
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
    # Return a simple page for the clicked state
    return render_template('state_page.html', state_name=state_name)

if __name__ == '__main__':
    app.run(debug=True)
