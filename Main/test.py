import os
import geopandas as gpd

gdf = gpd.read_file("./ne_10m_admin_1_states_provinces/ne_10m_admin_1_states_provinces.shp")
print(gdf)