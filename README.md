**Article: Multiscale Principle of Relevant Information for Hyperspectral Image Classification**,

**to be published in Machine Learning Journal (Springer)**

Authors: Yantao Wei, Shujian Yu, Luis Sanchez Giraldo, Jose C. Principe

arxiv: https://arxiv.org/abs/1907.06022


**We provide two demos: 1) Principle of Relevant Information (PRI) on synthetic data (Fig. 1 in the manuscript); and 2) Multiscale PRI (MPRI) for hyperspectral image (HSI) classification on Indian Pines dataset.**

![image](https://github.com/SJYuCNEL/Principle-of-Relevant-Information-and-HSI-Classification/blob/main/MPRI_architecture.png)MP
The multiscale principle of relevant information (MPRI) is a new multilayer architecture to extract spectral-spatial features by performing PRI (an unsupervised information-theoretic learning principle [1]) and LDA iteratively and successively on HSI data cube (after normalization). The extracted features are fed into a k-nearest neighbors (KNN) classifier to predict pixel labels.

[1] Principe, Jose C. Information theoretic learning: Renyi's entropy and kernel perspectives. Springer Science & Business Media, 2010.
