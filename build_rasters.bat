@echo off
REM This batch script optimizes rasters and ingests them into Terracotta.

REM Define directories
SET "RASTER_DIR=E:/Data/Sun"
SET "OPTIMIZED_DIR=E:/Data/Sun/COG"

REM Create directories if they do not exist
IF NOT EXIST "%OPTIMIZED_DIR%" (
    mkdir "%OPTIMIZED_DIR%"
)

REM activate terracotta conda(python) environmnet 
CALL conda activate terracotta

REM Optimize rasters using GDAL
terracotta optimize-rasters %RASTER_DIR%/*.tif -o %OPTIMIZED_DIR% --skip-existing --resampling-method bilinear --reproject True --in-memory --nproc -1

REM Ingest optimized rasters into Terracotta
terracotta ingest %OPTIMIZED_DIR%/{title}_{band}{}.tif -o sunmap.sqlite --skip-existing

REM Deactivate the conda environment
CALL conda deactivate

echo Done!
pause
