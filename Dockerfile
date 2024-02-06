# Use an official OSRM backend image as the base image
FROM osrm/osrm-backend


# Set the working directory
WORKDIR /src

# Download OSM data
COPY . /src/
# Extract, partition, customize, and run OSRM backend
RUN osrm-extract -p /opt/car.lua vietnam-latest.osm.pbf
RUN osrm-partition vietnam-latest.osrm
RUN osrm-customize vietnam-latest.osrm
CMD osrm-routed --algorithm mld vietnam-latest.osrm

# Expose the OSRM backend port
EXPOSE 5000
