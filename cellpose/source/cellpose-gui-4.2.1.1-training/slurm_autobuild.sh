#! /bin/bash

############### Run this script from the main folder of your application ###############
################ Builds the container and saves it in VIBE container storage ###########
################ By default is stored in the local application folder ###########
############### Logs are stored in <application_folder>/build_logs ##################


#SBATCH --account=gratis
#SBATCH --partition=epyc2
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=4GB
#SBATCH --qos=job_gratis
#SBATCH --job-name=ruben-custom-container-build
#SBATCH --output=/dev/null
#SBATCH --error=/dev/null
#SBATCH --mail-user=ruben.lopez@unibe.ch
#SBATCH --mail-type=FAIL

# CONTAINER_DIR=$(pwd)
CONTAINER_DIR=$(readlink -f $HOME/Desktop/dsl_vibe_rs/trainings/2026_deep_learning_with_VIBE/cellpose/source/cellpose-gui-4.2.1.1-training)
CONTAINER_NAME="cellpose-gui-4.2.1.1-training"
LOG_FILE_NAME=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE_DIRECTORY="${CONTAINER_DIR}/build_logs"
LOG_FILE="${LOG_FILE_DIRECTORY}/build_${CONTAINER_NAME}_${LOG_FILE_NAME}.log"

# Ensure log directory exists
mkdir -p "$LOG_FILE_DIRECTORY"

# Redirect all output to log file once we know its path
# (sbatch --output was set to /dev/null to avoid a separate slurm log;
#  all meaningful output goes to our own log file instead)
exec > >(tee -a "$LOG_FILE") 2>&1

echo "[INFO] SLURM Job ID: ${SLURM_JOB_ID:-N/A}"
echo "[INFO] Running on node: $(hostname)"
echo "[INFO] Working directory: $(pwd)"


# Start timer
START_TIME=$(date +%s)

echo "****************************************"
echo -e "\n[INFO] Starting build for container: ${CONTAINER_NAME}.sif"

apptainer build \
    --force "${CONTAINER_DIR}/${CONTAINER_NAME}.sif" "${CONTAINER_DIR}/build.def"



# Capture exit code
BUILD_EXIT_CODE=$?

# End timer
END_TIME=$(date +%s)
ELAPSED=$(( END_TIME - START_TIME ))
MINUTES=$(( ELAPSED / 60 ))
SECONDS=$(( ELAPSED % 60 ))

echo -e "\n[INFO] Build completed in ${MINUTES}m ${SECONDS}s"

# Report success or failure
if [ $BUILD_EXIT_CODE -eq 0 ]; then
    echo "[SUCCESS] Container ${CONTAINER_NAME}.sif built successfully at ${DESTINATION_FOLDER}"
else
    echo "[ERROR] Build failed for ${CONTAINER_NAME}.sif (exit code: ${BUILD_EXIT_CODE})"
    echo "[INFO] Check the full log at: $LOG_FILE"
    exit $BUILD_EXIT_CODE
fi


echo "[INFO] Done. Logs saved to: $LOG_FILE"
echo "****************************************"