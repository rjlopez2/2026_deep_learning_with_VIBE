# Material for the workshop "Deep learning tools using VIBE"

## Deep learning tools using VIBE

This workshop provides a hands-on introduction to modern deep learning workflows for microscopy image analysis in the VIBE environment. VIBE (Virtual Imaging at University of Bern) is a virtual platform for advanced and interactive image analysis designed for researchers at the University of Bern. It is powered by the university’s high-performance computing infrastructure and delivered through an Open OnDemand-based desktop environment, making it well suited for computationally intensive image analysis tasks and reproducible scientific workflows.

The course is designed for researchers, students, and practitioners working with biological and biomedical imaging data who want to apply deep learning tools to real microscopy problems without having to build the full analysis pipeline from scratch. Throughout the workshop, participants will use VIBE as the working environment for image inspection, data preparation, model training, evaluation, and downstream analysis.

The workshop combines interactive graphical tools with reproducible Python notebooks to cover the full lifecycle of a deep learning project: data preparation, model selection, training, validation, visualization, and quantitative evaluation. The goal is to teach participants how to use state-of-the-art tools to solve common microscopy analysis tasks in a practical and application-oriented way.

The workshop is structured around two complementary exercises:

- Cell segmentation with Cellpose: participants learn how to work with microscopy images containing cells or nuclei, compare predictions with ground truth annotations, refine labels interactively, and fine-tune a generalist segmentation model on a task-specific dataset. The exercise includes data preparation, model training, visualization of segmentation results, and quantitative performance assessment using standard segmentation metrics.

- Image denoising and restoration with CAREamics: participants explore microscopy denoising using paired low-noise and high-quality images, train a denoising model, monitor the learning process through loss curves, and evaluate reconstruction quality using objective metrics. The exercise emphasizes the practical workflow of restoring noisy images while preserving biological structures.

Across both modules, participants learn how to:
- organize microscopy datasets into training, validation, and test splits;
- use VIBE applications and graphical tools for image inspection and annotation;
- initialize and fine-tune pretrained deep learning models on small custom datasets;
- monitor and interpret model training behavior;
- compare baseline and adapted models;
- assess performance using both visual inspection and quantitative metrics;
- export trained models and integrate them into downstream analysis workflows.

By the end of the course, participants will have practical experience with modern deep learning tools for microscopy image analysis and a clear understanding of the end-to-end workflow required to train, validate, and evaluate models in a real biological imaging context. They will also be familiar with VIBE as a collaborative and scalable platform for interactive image analysis and advanced scientific workflows.