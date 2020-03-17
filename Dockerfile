FROM luigidifraia/dask-datacube:v1.1.0-alpha

LABEL maintainer="Luigi Di Fraia"

RUN pip install --quiet --no-cache-dir \
    Cython==0.29.15 \
    hdstats==0.1.3 \
    lark-parser==0.8.2 \
    odc-algo==0.1.dev439+gd29f1df \
    --extra-index-url=https://packages.dea.ga.gov.au

