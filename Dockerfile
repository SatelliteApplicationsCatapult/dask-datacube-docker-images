FROM luigidifraia/dask-datacube:v3.1.1-alpha

LABEL maintainer="Luigi Di Fraia"

# Install additional useful EO-related SAC utilities
RUN pip install --no-cache-dir \
    git+https://github.com/SatelliteApplicationsCatapult/datacube-utilities.git#egg=datacube_utilities
