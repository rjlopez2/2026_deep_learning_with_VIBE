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


## 1. Data preparation

Download and organize the dataset for easy GUI  and programatically handeling. Launch Jupyter lab by executing in your command line the following script:

```bash
./start_jupyterlab.sh
```

Open the `01_data_preparation.ipynb` file and execute the full script. This will pull the data from zenodo, extract it and splitting the data and reorganize the files. If the scripts run correctly you will be able to see  a zip file an 3 folders:
- `A172`
- `A172_splits_n100_seed42`
- `A172_manual_training` 

as swonw bellow on the `../data/` folder:

```bash
├── A172
│   ├── test
│   │   ├── input
│   │   └── output
│   └── train
│       ├── input
│       └── output
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
└── A172_manual_training
    ├── A172_Phase_A7_1_00d04h00m_3.tif
    ├── A172_Phase_A7_1_01d00h00m_2.tif
    ├── A172_Phase_A7_1_01d00h00m_4.tif
    └...
```

The folder `A172`contains the orginal data from the .zip file. There are over  ~600 images from train and test sets. For the seek of this excercise, we will use only 100 images from this dataset and split it into `train` `test` and `validation` sets, each with its image + annotation (masks with the sufix name `'*_seg.npy'`) respectively. That is the content of the `A172_splits_n100_seed42` folder. Finally, the folder `A172_manual_training` is a copy of images only (no mask) from the `train` split.

## 2. Manually fine-tuning your model with human in the loop

1. Launch the GUI by executing the following command from the `'../scripts'`:

```bash
./start_cellpose.sh
```

2. Open any sample image from the validation folder located at: `../data/A172_manual_training/`

3. On the Segmentation pannel, select a model or use the default and click Run to segment the cells of your image.

4. Drawing pannel, togggel the MASK ON to visualy asses the segmentation quality. Add, delete or edit ROIs that were missed or wrongly predicted. Save the mask with `Ctrl + s` when you are happy. Use the help assistance to find additional information about how to use the cellpose GUI. 

5. Repeat this process with few images: load image -> predict with your model -> modify the mask if need it -> save your mask

6. Train your own model with your new annotations: from the top menu select: `Models -> Train new model with image + mask in folder`. You can adjuts here your train settings. Note that at the right site will be displayed teh mask that you have created. For the model parameters you can reduce the n_epochs, give a memmorable name to your model and let the other values as they are. click OK to start your triaining. Monitor the training process on the command line.

7. Use your model to predict/segment your images: load one of your images and under the Segmentation pannel use the "user-trained models" to select your newly trained model. Hit run to use it for segmenting your images. Do you see any improvement?



## Fine-tuning your model programatically