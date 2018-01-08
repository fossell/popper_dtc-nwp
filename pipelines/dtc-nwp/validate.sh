#!/bin/bash
# [wf] Generate output plots and validate model runs.
set -ex

# [wf] Create output directories
mkdir -p ${PWD}/sandy/nclprd ${PWD}/sandy/metprd

# [wf] Run NCL script in docker-space
docker run --rm  \
 -v ${PWD}/scripts:/scripts \
 -v ${PWD}/sandy/wrfprd:/wrfprd \
 -v ${PWD}/sandy/nclprd:/nclprd \
 --name run-dtc-ncl-sandy dtc-ncl /scripts/sandy_20121027/run/ncl_run_all.ksh

# [wf] Run MET script in docker-space
docker run --rm --volumes-from sandy \
 -v ${PWD}/scripts:/scripts \
 -v ${PWD}/sandy/postprd:/postprd \
 -v ${PWD}/sandy/metprd:/metprd \
 --name run-dtc-met-sandy dtc-met /scripts/sandy_20121027/run/run-dtc-met.ksh

exit 0
