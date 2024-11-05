import os
import geopandas as gpd

gdf = gpd.read_file("./ne_10m_admin_1_states_provinces/ne_10m_admin_1_states_provinces.shp")
print(gdf)

import geopandas as gpd
import plotly.graph_objects as go
import json

# Load the shapefile for U.S. states (adjust path as necessary)
gdf = gpd.read_file("./mapfiles/ne_10m_admin_1_states_provinces.shp")

# Filter for U.S. states only
us_states = gdf[gdf['iso_a2'] == 'US']

# Reproject to make compatible with Plotly's maps
us_states = us_states.to_crs("EPSG:4326")

# Convert geometries to GeoJSON format
us_states_geojson = json.loads(us_states.to_json())

# Create a figure
fig = go.Figure()

# Add the states
for i, feature in enumerate(us_states_geojson['features']):
    state_name = feature['properties']['name']
    
    # Add the state polygon
    fig.add_trace(go.Scattergeo(
        geojson=feature,
        locations=[state_name],
        hoverinfo='text',
        text=state_name,
        marker=dict(line=dict(width=0.5, color='black')),
        name=state_name
    ))

# Update layout
fig.update_layout(
    title='Interactive Map of U.S. States',
    geo=dict(
        scope='usa',
        projection_type='albers usa',
        showland=True,
        landcolor='lightgray',
        countrycolor='black',
        subunitcolor='gray',
    ),
    hovermode='closest'
)

# Show the map
fig.show()
