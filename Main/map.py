import geopandas as gpd
import plotly.express as px

# Load the shapefile for U.S. states (adjust path as necessary)
gdf = gpd.read_file("./ne_10m_admin_1_states_provinces/ne_10m_admin_1_states_provinces.shp")

# Filter for U.S. states only
us_states = gdf[gdf['iso_a2'] == 'US']  # Use 'admin' if 'iso_a2' is not present or doesn't work

# Reproject to make compatible with Plotly's maps
us_states = us_states.to_crs("EPSG:4326")

# Create the Plotly figure
fig = px.choropleth(
    data_frame=us_states,
    geojson=us_states.geometry,  # Pass the geometry separately
    locations=us_states.index,
    hover_name="name",  # Adjust based on available column name for state names
    title="Interactive Map of U.S. States"
)

# Set the geo properties to display the map properly
fig.update_geos(
    visible=False,
    showcountries=True,
    countrycolor="Black",
    showsubunits=True,
    subunitcolor="Gray"
)

# Update layout for interactivity
fig.update_traces(marker_line_width=2)  # thicker borders for states
fig.update_layout(
    hovermode="closest",
    geo=dict(
        scope="usa",
        projection_type="albers usa",
    )
)

# Show the map
fig.show()
