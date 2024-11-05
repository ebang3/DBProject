# To display the interactive map

import geopandas as gpd
import plotly.express as px

# Load the shapefile for U.S. states (adjust path as necessary)
gdf = gpd.read_file("./mapfiles/ne_10m_admin_1_states_provinces.shp")

# Filter for U.S. states only
us_states = gdf[gdf['iso_a2'] == 'US']

# Reproject to make compatible with Plotly's maps
us_states = us_states.to_crs("EPSG:4326")

# Create the Plotly figure
fig = px.choropleth(
    data_frame=us_states,
    geojson=us_states.geometry, 
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

# Update layout for interactivity
fig.update_traces(
    marker_line_width=2,  # Default thickness of state borders
    marker_line_color='brown',  # Default fill color
    hovertemplate="<b>%{hovertext}</b><extra></extra>",  # Custom hover text
)

# Highlight the border of the state on hover
fig.update_traces(
    hoverinfo='text',
    text=us_states['name'],  # Show the name of the state on hover
    marker=dict(line=dict(width=2)),  # Default border width
)

# Add a callback for hover effect to change border thickness
fig.update_traces(
    marker=dict(line=dict(color='blue', width=3)),  # Change border color and width on hover
)
  # thicker borders for states
fig.update_layout(
    hovermode="closest",
    geo=dict(
        scope="usa",
        projection_type="albers usa",
    )
)

# Show the map
fig.show()
