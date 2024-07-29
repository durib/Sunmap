@echo off
REM This batch script optimizes rasters and ingests them into Terracotta.

REM activate terracotta conda(python) environmnet 
CALL conda activate terracotta

REM Optimize rasters using GDAL
terracotta connect localhost:5001

REM Deactivate the conda environment
CALL conda deactivate