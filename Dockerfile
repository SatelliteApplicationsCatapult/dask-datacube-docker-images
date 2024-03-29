FROM continuumio/anaconda3:2020.02

LABEL maintainer="Emily Selwood"


RUN conda install --yes     python=3.6
RUN conda install --yes mamba -n base -c conda-forge

RUN mamba install --yes -c conda-forge \
        python-blosc \
        cytoolz \
        dask==2.23.0 \
        lz4 \
        nomkl \
        numpy==1.18.1 \
        pandas==1.0.1  \
        pyproj==2.6.1.post1\
        psycopg2 \
        tini==0.18.0 

RUN mamba install --yes \
    -c conda-forge \
    gdal==3.0.4

RUN mamba install --yes \
    -c conda-forge \
    boto3 \
    datacube==1.8.3 \
    # folium~=0.12.1 \
    distributed \
    scipy \
    xarray==0.16.2 \
    && conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && find /opt/conda/lib/python*/site-packages/bokeh/server/static -type f,l -name '*.js' -not -name '*.min.js' -delete \
    && rm -rf /opt/conda/pkgs

RUN pip install --no-cache-dir  odc-algo==0.1.dev439+gd29f1df hdstats==0.1.8 rasterio==1.2.10 --extra-index-url=https://packages.dea.ga.gov.au
# RUN apt-get --allow-releaseinfo-change update  && apt-get install -y libpoppler-dev
# Install additional useful EO-related SAC utilities
RUN pip install --no-cache-dir \
    git+https://github.com/SatelliteApplicationsCatapult/datacube-utilities.git#egg=datacube_utilities
