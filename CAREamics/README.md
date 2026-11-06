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


- Go to the project folder for this exercise and open the folder: `CAREamics`.
- Explore the content of the folder `Denoising_dataset`. You will find the folder `manual_training` and inside the data for training and testing as indicated bellow:
```bash
└── manual_training
    ├── Training
    │   ├── high
    │   └── low
    └── test
        ├── High
        └── Low
```
