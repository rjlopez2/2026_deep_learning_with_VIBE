# Material for the workshop "Deep learning tools using VIBE"

# Data

Source data for training the model and excercise are findable in zenodeo [here](https://zenodo.org/records/10277106)

# Experimental

Things being ignored by gitignore are kept in the temp folder, for instance, experimental work.

# Stepts to run this exercice:

# Aim

The aim of this exercise is to become familiar with Cellpose and its graphical user interface, and to learn how to use it to segment microscopy images. You will:

1. Explore the Cellpose GUI and its main features.
2. Segment images using the default models.
3. Visually evaluate the quality of the resulting segmentations.
4. Retrain a model using the exercise data.
5. Systematically assess segmentation quality using standard metrics available through the Cellpose API.


# The tasks

We will try to use cellpose to segment microscopy images from live cells. We will first inspect the quality of the segmentation using specialized deep learning models and compare the segmentation with the correct annotation (ground truth). First we will try to iteratively fine tune a generalist model with our dataset using the GUI. Then we will try to do a more advanced excercice and train aour model with more control programatically.
Finally, we will asses the performance quality of our model in a systematic way using standard benchmark and metrics.


## Manual fine-tuning with human in the loop

1. Organize the dataset for easy GUI handeling (run the jupyter notebook `01_data_preparation.ipynb`)
2. create a new folder under the directory `../data/`
2. Open the GUI and disable the option to show the masks by default ("MASK On [X])
2. Open any sample image from the validation folder located at: `../data/A172_splits_n100_seed42/validation/`
3. Select a model of your preference from the list and use it to infer the segmentation. Push run.
4. Visually inspect the segmentation made by teh model: Was it good? all cells were nicely segmented? are there any false positive?
5. 