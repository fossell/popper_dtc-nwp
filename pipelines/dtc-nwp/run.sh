#!/bin/bash
#[wf] Run the dtc-nwp container 
set -ex

# [wf] create output directories
mkdir -p ${PWD}/sandy/wrfprd ${PWD}/sandy/postprd

## [wf] run WPS/WRF/UPP (NWP: pre-proc, model, post-proc) script in docker-space
#docker run --rm --volumes-from wps_geog --volumes-from sandy \
# -v ${PWD}/scripts:/scripts \
# -v ${PWD}/sandy/wrfprd:/wrfprd  \
# -v ${PWD}/sandy/postprd:/postprd \
# --name run-dtc-nwp-sandy dtc-nwp /scripts/sandy_20121027/run/run-dtc-nwp.ksh

# [wf] Don't run the WPS/WRF/UPP (NWP: pre-proc, model, post-proc) script in docker-space
docker run --rm --volumes-from wps_geog --volumes-from sandy \
 -v ${PWD}/scripts:/scripts \
 -v ${PWD}/sandy/wrfprd:/wrfprd  \
 -v ${PWD}/sandy/postprd:/postprd \
 --name run-dtc-nwp-sandy dtc-nwp /scripts/sandy_20121027/run/run-dtc-nwp.ksh \
 -skip wps -skip real -skip wrf -skip upp

exit 0
