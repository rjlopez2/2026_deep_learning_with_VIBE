#!/bin/bash

CONTAINER_PATH="/storage/research/dsl_vibe_rs/trainings/2026_deep_learning_with_VIBE/cellpose/source/cellpose-gui-4.2.1.1-training/cellpose-gui-4.2.1.1-training.sif"

apptainer exec --nv $CONTAINER_PATH /opt/launchers/start_cellpose.sh "$@"