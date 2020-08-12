FROM luigidifraia/dask-datacube:v3.0.1-alpha

LABEL maintainer="Luigi Di Fraia"

# Install additional useful EO-related SAC utilities
RUN pip install --no-cache-dir \
    git+https://github.com/SatelliteApplicationsCatapult/datacube-utilities.git@odc-1.8-testing#egg=datacube_utilities
