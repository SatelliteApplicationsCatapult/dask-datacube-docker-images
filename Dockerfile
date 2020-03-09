FROM luigidifraia/dask-datacube:v1.1.0-alpha

LABEL maintainer="Luigi Di Fraia"

RUN pip install --quiet \
    Cython \
    hdstats \
    lark-parser \
    odc-algo \
    --extra-index-url=https://packages.dea.ga.gov.au

