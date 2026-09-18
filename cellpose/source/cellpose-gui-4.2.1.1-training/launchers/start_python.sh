#!/bin/bash
eval "$(/opt/pixi shell-hook -e cellpose-gui-training --manifest-path /opt --frozen)"

PYTHONNOUSERSITE=1
LD_LIBRARY_PATH=/opt/.pixi/envs/cellpose-gui-training/lib/python3.13/site-packages/nvidia/cudnn/lib:$LD_LIBRARY_PATH
vglrun -d egl python "$@"