# Material for the workshop "Deep learning tools using VIBE"

# Aim

The aim of this exercise is to become familiar with Cellpose, a generalist algorithm for cellular segmentation from microscopy images. 
You will:

1. Explore the Cellpose GUI and its main features such as create, modify and remove annotations.
2. Segment images using the default models.
3. Visually evaluate the quality of the resulting segmentation.
4. Retrain a model using a toy dataset.
5. Systematically assess segmentation quality using standard metrics available through the Cellpose API.


# The tasks

We will try to use cellpose to segment microscopy images from live cells. We will first inspect the quality of the segmentation using specialized deep learning models and compare the segmentation with the correct annotation (ground truth). First we will try to iteratively fine tune a generalist model with our dataset using the GUI. Then we will try to do a more advanced exercise and train our model with more control programmatically.

Finally, we will asses the performance quality of our model using standard benchmark and metrics.


## 1. Data preparation

To prepare your setup to run this project please follow these steps:

- Create a new folder on your home directory for this project.
- Copy the `2026_deep_learning_with_VIBE.zip` file located on the location: `/storage/research/dsl_vibe_rs/trainings/2026_deep_learning_with_VIBE` and unzip the file. Hint: right click and try to decompress it with PeaZip. From now on you will work in your own copy of this project. 
- Explore the `../data_cp/` folder, it contains the following 5 folders 
    - `A172`
    - `A172_splits_n50_seed42`
    - `A172_splits_n100_seed42`
    - `A172_splits_n200_seed42`
    - `A172_splits_n500_seed42`
The folder `A172` is the original dataset which we will not use. There are over ~600 images from train and test sets altogether. The other folders contain subsets of the original dataset of varying sizes: n= 50, 100, 200, 500 as indicated on their names. Inside any of this subsets you will find the following folder structure:

```bash
└── A172_splits_n50_seed42
    ├── manual_training_n50_seed42
    ├── test
    ├── train
    └── validation
```
Inside, you will find the data split as 80% for the train 10% for test + 10% for validation for the respective size. Each of them contain a pair of images + masks (Annotations). The `'manual_training_n**_seed**'` folder contains the exact content of the train split except that it does not contain the mask.

Source data for training the model and exercise are findable in Zenodo [here](https://zenodo.org/records/10277106).

### (Optional) Data preparation via scripts
We can download and organize the dataset programmatically for easy handling with the GUI.

!!! note 
To run the section to pull the data from zenodo, you will to install the package `zenodo_get` in your environment or manually the folder from Zenodo (see link above). 

Steps: 
- Launch jupyterlab: `Applications -> VIBE -> VIBE Applications -> jupyterlab -> jupyterlab (cellpose-gui-4.2.1.1)[VIBE]`
- navigate to the folder you saved the the project and open the 
jupyter notebook `01_data_preparation.ipynb` and follow the instructions to execute the full script. This will check it the data directories exist, if not, it will be pulled from zenodo, extract it and splitting the data and reorganize the files. If the scripts run correctly you will be able to see the folders with the same content as explained above.




## 2. Manually fine-tuning your model with human in the loop

1. Launch the cellpose application by navigating to: `Applications -> VIBE -> VIBE Applications -> cellpose -> cellpose (cellpose-gui-4.2.1.1) [VIBE]`


2. Open any sample image from the folder `../data/A172_manual_training/` that was decompressed in the previous step. Drag and drop option is possible.

3. On the Segmentation panel, select any of the default model but the `cpsam_v2`. Use for instance the `cpdino` model. Hit "run" to segment the cells of your image.

4. On the Drawing panel, toggle the MASK ON to visually asses the segmentation quality. Add, delete or edit ROIs that were missed or wrongly predicted. Save the mask with `Ctrl + s` when you are happy. Use the help assistance or go to the [official documentation](https://cellpose.readthedocs.io/en/latest/gui.html) to find additional information about how to use the cellpose GUI. 

5. Repeat this process with few images (at least 5): load image -> predict with your model -> modify the mask if need it -> save your mask

6. Train your own model with your new annotations: from the top menu select: `Models -> Train new model with image + mask in folder`. You can adjust here your train settings. Note that at the right site will be displayed teh mask that you have created. For the model parameters you can reduce the n_epochs, give a memorable name to your model and let the other values as they are. click OK to start your training. Monitor the training process on the command line.

7. Use your model to predict/segment your images: load one of your images and under the Segmentation panel use the "user-trained models" to select your newly trained model. Hit run to use it for segmenting your images. Do you see any improvement?


## 3. Fine-tuning your model programmatically (Optional)

- Open the notebook `02_train_model.ipynb` under the `scripts` folder.
- Follow the instructions from the notebook and execute the cells for training a new model.

## 4. Asses the quality of the model from benchmark metrics

- Open the notebook `03_asses_model.ipynb` under the `scripts` folder.
- Follow the instructions from the notebook and execute the cells to obtain and evaluate the metrics of your model.