import geopandas as gpd
import plotly.express as px
import plotly.graph_objects as go




# Load the shapefile for U.S. states (adjust path as necessary)
gdf = gpd.read_file("../mapfiles/ne_10m_admin_1_states_provinces.shp")

# Filter for U.S. states only
us_states = gdf[gdf['iso_a2'] == 'US']

# Reproject to make compatible with Plotly's maps
us_states = us_states.to_crs("EPSG:4326")

# Add a custom column for the hover text you want
us_states['hover_text'] = us_states['name'] + ""  # Customize this line as needed

# Convert geometries to geojson format
geojson = us_states.geometry.__geo_interface__  # Convert to proper GeoJSON format

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

# **(1) Define a function to handle click events and redirect**
def handle_click(trace, points, selector):
    if points.point_inds:
        # **(2) Get the clicked state's name**
        clicked_state = us_states.iloc[points.point_inds[0]]['name']
        print(f"State clicked: {clicked_state}")
        
        # **(3) Construct the URL for redirection**
        # Redirect to a state-specific page (e.g., "/state/{state_name}")
        redirect_url = f"/state/{clicked_state.replace(' ', '_')}"
        
        # **(4) Simulate a redirection (or use in web frameworks)**
        print(f"Redirecting to: {redirect_url}")
        # In a web framework like Flask, you could redirect like this:
        # return redirect(redirect_url)

# **(5) Add the click callback to the figure**
fig.data[0].on_click(handle_click)

# Update layout for interactivity and custom hover
fig.update_traces(
    # marker_line_width=2,  # Default thickness of state borders
    # marker_line_color='brown',  # Default border color
    hovertemplate="<b>%{customdata}</b><br>Peach State<extra></extra>",  # Custom hover text with "Peach State"
    customdata=us_states['hover_text'],  # Custom data for hover text
)

# Add a callback for hover effect to change border thickness
fig.update_traces(
    marker=dict(line=dict(color='blue', width=3)),  # Change border color and width on hover
)

# Additional layout settings
fig.update_layout(
    hovermode="closest",
    geo=dict(
        scope="usa",
        projection_type="albers usa",
    )
)

# Show the map
fig.show()
