# Material for the workshop "Deep learning tools using VIBE"

# Aim

The aim of this exercise is to become familiar with [CAREamics](https://careamics.github.io/latest/), a python library aimed at simplifying the use of state of the art image restoration deep-learning algorithms, from well-established algorithms (CARE, Noise2Void) to cutting-edge methods (MicroSplit).
You will:

1. Get familiar with the GUI and explore some of its functionalities.
2. Create your custom deep learning denoising model by reetraining the default model with a toy dataset.
3. Monitor the loss curve to  understand the learning process. 
5. Assess the denoising quality using standard metrics available through the CAREamics API.


# The tasks

In this exercise, we will try to use CAREamics to denoise microscopy data. First we will try to load the dataset and visualize it via the napari interface. We will then adjust the settings to train our custom model and finall we will compute some metrics to asses how good the performance for this task the model is.

## 1. Fine-tune your denoising model interactively with napari-careamics


- Go to the project folder for this exercise and open the `Denosising_Dataset`. You will find the folder `manual_training` and inside, the data for training and testing as indicated bellow:
```bash
└── manual_training
    ├── Training
    │   ├── high
    │   └── low
    └── test
        ├── High
        └── Low
```

As indicated by the [CARE](https://henriqueslab.org/pages/care) development and research group:

    CARE networks are trained on pairs of images depicting the same content - one image acquired under suboptimal conditions (low signal-to-noise ratio, low resolution etc.) serves as the input, while the other image shows the desired target quality. The type of restoration determines what constitutes the input and target images. For example, for image denoising the input could be a low laser power acquisition exhibiting high noise, while the target is a clean image obtained with higher laser power.

In our example the folder called "high" contain images of cellular nuclei staining with optimal acquisition conditions (high signal-to-noise ratio, SNR) and the folder called "low" contains the suboptimal images with low SNR.

- Launch the napari-careamics application from the Applications menu: `Applications -> VIBE -> VIBE Applications -> napari -> napari (napari-careamics-40.0.20)[VIBE]`

- Visualize one pair of images (low and high) from any of the two sets: use for instance the test folder.

- Launch the plugin within the napari app via: `Plugins -> CAREamics -> CARE``

- Take 2 minutes to explore the app and the different options and configuration. Feel free to read. more form the official documentation of the [CAREamics plugin](https://careamics.github.io/latest/content/guides/ui/).

- Go to the data loading section and select the tab "From disk". Choose the right folder from the `manual_training` as indicated in the table bellow:

| Input         |  Dataset | 
| :------------ | :------: |
| Train         | ../manual_training/Training/low/ |
| Val           | ../manual_training/test/low/     | 
| Train target  | ../manual_training/Training/high/  
| Val target    | ../manual_training/test/high/      |


- From the training parameters tab select the following settings:
	- enable 3d: no (default)
	- Axes: YZ (default)
	- \# Epochs: 60
	- batch size: 32
	- patch xy: 32

- Click the "Train" button to start the training. For 100 Epoch under these settings it may take about 5 min using the RTX 6000 graphic card.

- Monitor the evolution of the training in the "Training Progress" panel and observe the loss curves for the training and validation sets.