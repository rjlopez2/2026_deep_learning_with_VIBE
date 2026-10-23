# Material for the workshop "Deep learning tools using VIBE"

# Data

Source data for training the model and excercise are findable in zenodeo [here](https://zenodo.org/records/10277106)

# Experimental

Things being ignored by gitignore are kept in the temp folder, for instance, experimental work.

# Stepts to run this exercice:

# Aim

The aim of this exercise is to become familiar with Cellpose, a generalist algorithm for cellular segmentation from microscopy images. 
You will:

1. Explore the Cellpose GUI and its main features such as create, modify and remove annotations.
2. Segment images using the default models.
3. Visually evaluate the quality of the resulting segmentations.
4. Retrain a model using a toy dataset.
5. Systematically assess segmentation quality using standard metrics available through the Cellpose API.


# The tasks

We will try to use cellpose to segment microscopy images from live cells. We will first inspect the quality of the segmentation using specialized deep learning models and compare the segmentation with the correct annotation (ground truth). First we will try to iteratively fine tune a generalist model with our dataset using the GUI. Then we will try to do a more advanced excercice and train aour model with more control programatically.

Finally, we will asses the performance quality of our model using standard benchmark and metrics.


## Manually fine-tuning your model with human in the loop

1. Organize the dataset for easy GUI handeling. Run the jupyter notebook `01_data_preparation.ipynb`. This will pull the data from zenodo, extract it and create a couple of others folders by splitting the data. If the scripts run correctly you will be able to see the following folder structure under the `../data/` folder:

```bash
├── A172
│   ├── test
│   └── train
├── A172_splits_n100_seed42
│   ├── test
│   │   ├── A172_Phase_A7_2_02d20h00m_3_seg.npy
│   │   ├── A172_Phase_A7_2_02d20h00m_3.tif
│   │   └...
│   ├── train
│   │   ├── A172_Phase_A7_1_00d04h00m_3_seg.npy
│   │   ├── A172_Phase_A7_1_00d04h00m_3.tif
│   │   └...
│   └── validation
│       ├── A172_Phase_A7_1_01d00h00m_1_seg.npy
│       ├── A172_Phase_A7_1_01d00h00m_1.tif
│       └...
├── A172.zip
└── manual_train
```
Note that in each of the splits there exist pairs of image + mask with the sufix name `'*_seg.npy'`

2. create a new folder call it `'manual_train'` under the directory `../data/` and copy the content from the `../data/A172_splits_n100_seed42/validation/` folder.
2. Launch the GUI by executing the following command from the `'../scripts'`:
```bash
./start_cellpose.sh
```
2. Open any sample image from the validation folder located at: `../data/A172_splits_n100_seed42/validation/`
3. Delete or correct the mask: Using Delete multiple ROIs pannel try to delete mask and create new one
3. Select a model of your preference from the list and use it to infer the segmentation. Push run.
4. Visually inspect the segmentation made by teh model: Was it good? all cells were nicely segmented? are there any false positive?
5. 


## Fine-tuning your model programatically