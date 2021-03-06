**Article: Multiscale Principle of Relevant Information for Hyperspectral Image Classification**,

**to be published in Machine Learning Journal (Springer)**

Authors: Yantao Wei, Shujian Yu, Luis Sanchez Giraldo, Jose C. Principe

arxiv: https://arxiv.org/abs/1907.06022


**We provide two demos: 1) Principle of Relevant Information (PRI) on synthetic data (Fig. 1 in the manuscript); and 2) Multiscale PRI (MPRI) for hyperspectral image (HSI) classification on Indian Pines dataset.**

## Principle of Relevant Information (PRI) and its Objective
PRI is an unsupervised principle that aims to perform mode decomposition of a random variable *X* with a known and fixed probability distribution *g* [1]. Suppose we aim to obtain (from *X*) a reduced statistical representation characterized by another random variable *Z* with probability distribution *f*. 

The PRI casts this problem as a trade-off between the entropy *H(f)* of *Z* and its descriptive power about *X* in terms of their divergence *D(f\|\|g)*:

![1](http://latex.codecogs.com/svg.latex?J(f)=H(f)+\beta*D(f\|\|g),)

where β is a hyper-parameter controlling the amount of relevant information that *Z* can extract from *X*. The minimization of entropy can be viewed as a means of reducing uncertainty (or redundancy) and finding the statistical regularities in the outcomes, whereas the minimization of information divergence ensures that such regularities are closely related to *X*. The PRI is similar in spirit to the Information Bottleneck (IB) approach [2], but the formulation is different because PRI does not require a relevant auxiliary variable *Y* and the optimization is done directly on the random variable *X* (rather than the joint distribution *p(X,Y)* as in the IB).

![image](https://github.com/SJYuCNEL/Principle-of-Relevant-Information-and-HSI-Classification/blob/main/PRI_synthetic_data.PNG)
Fig.1. Illustration of the structures revealed by the PRI for (a) Intersect data set. As the values of β increase the solution passes through (b) a single point, (c) modes, (d) and (e) principal curves at different dimensions, and in the extreme case of (f) β reaches infinity, we get back the data themselves as the solution.

## The Architecture of MPRI
![image](https://github.com/SJYuCNEL/Principle-of-Relevant-Information-and-HSI-Classification/blob/main/MPRI_architecture.png)
Fig.2. The multiscale principle of relevant information (MPRI) is a new multilayer architecture to extract spectral-spatial features by performing PRI and LDA iteratively and successively on HSI data cube (after normalization). The extracted features are fed into a k-nearest neighbors (KNN) classifier to predict pixel labels.

## The Performance of MPRI on HSI Classification

![image](https://github.com/SJYuCNEL/Principle-of-Relevant-Information-and-HSI-Classification/blob/main/Indian_Pine_accuracy.png)

Fig.3. Overall accuracy (OA) values of different competing methods with respect to different percentages of training samples per class on Indian Pines dataset.

[1] Principe, Jose C. Information theoretic learning: Renyi's entropy and kernel perspectives. Springer Science & Business Media, 2010.

[2] Tishby, Naftali; Pereira, Fernando C.; Bialek, William. The Information Bottleneck Method. The 37th annual Allerton Conference on Communication, Control, and Computing, pp. 368–377, 1999
