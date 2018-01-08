#!/bin/bash
# [wf] create data volumes
set -x

# [wf] cleanup data volumes
docker rm wps_geog
docker rm sandy

set -e

# [wf]  create wps geog data volume
docker create -v /WPS_GEOG --name wps_geog ivotron/dtc-nwp-wps_geog

# [wf] create sandy data volume 
docker create -v /case_data/sandy_20121027 --name sandy ivotron/dtc-nwp-sandy

