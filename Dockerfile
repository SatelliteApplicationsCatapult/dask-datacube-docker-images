FROM continuumio/miniconda3:4.7.12

LABEL maintainer="Luigi Di Fraia"

# Downgrade Python to 3.6
RUN conda install --yes python=3.6

# Base Docker image
RUN conda install --yes \
    -c conda-forge \
    python-blosc \
    cytoolz \
    dask==2.12.0 \
    lz4 \
    nomkl \
    numpy==1.18.1 \
    pandas==1.0.1 \
    tini==0.18.0 \
    && conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && find /opt/conda/lib/python*/site-packages/bokeh/server/static -type f,l -name '*.js' -not -name '*.min.js' -delete \
    && rm -rf /opt/conda/pkgs

# Install datacube and useful packages to run Earth Observation Notebooks
RUN conda install --yes \
    -c conda-forge \
    boto3 \
    datacube=1.7 \
    descartes \
    distributed==2.12.0 \
    folium \
    geopandas \
    hdmedians \
    ipyleaflet \
    matplotlib \
    rasterstats \
    ruamel \
    ruamel.yaml \
    scikit-image \
    scikit-learn \
    scipy \
    seaborn \
    shapely \
    && conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && rm -rf /opt/conda/pkgs

RUN pip install --no-cache-dir \
    Cython==0.29.15 \
    hdstats==0.1.3 \
    lark-parser==0.8.2 \
    odc-algo==0.1.dev439+gd29f1df \
    --extra-index-url=https://packages.dea.ga.gov.au

COPY prepare.sh /usr/bin/prepare.sh

RUN mkdir /opt/app

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
