# Unsupervised Segmentation Using CNNs Applied to Food Analysis

This repository is a collection of [Jupyter](https://jupyter.org/) notebooks which contain the work done in the final Master's Thesis of the [Master's Degree in the Foundations of Data Science](http://www.ub.edu/datascience/master/) supervised by Petia Radeva, PhD. The [Master's Thesis report](https://github.com/mbrufau7/tfm_food_segm/blob/master/Brufau_Ferrer_Gavalas_TFM.pdf) is published in this repository in a PDF format.

In the recent times, there have been numerous papers on deep segmentation algorithms for vision tasks. The main challenge of these tasks is to obtain sufficient supervised pixel-level labels for the ground truth. The main goal of this project is to explore if Convolutional Neural Networks can be used for unsupervised segmentation. We follow a novel unsupervised deep architecture, capable of facing this challenge, called the W-net and we test it on food images. The main idea of this model is to concatenate two fully convolutional networks together into an autoencoder. The encoding layer produces a k-way pixelwise prediction, and both the reconstruction error of the autoencoder as well as the error from the decoder are jointly minimized during training. We search for the best architecture for this network and we compare the results for this unsupervised network with supervised results from a well-known network.

<p align="center"><img src="https://github.com/mbrufau7/tfm_food_segm/blob/master/Figures/W-net.PNG" align=middle width=645.87435pt height=348.58725pt/>
</p>
<p align="center">
<em>W-Net architecture: it consists of an Uenc (left side) and a corresponding Udec (right side). It has 46
convolutional layers which are structured into 18 modules marked with the red rectangles. Each module consists of two 3x3 convolutional layers. The first nine modules form the dense prediction base of the network and the second 9 correspond to the reconstruction decoder.</em>
</p>

## Implemented and tested architectures
All architectures have been tested with the UNIMIB2016 dataset for food images.

> - Binary U-net
> - Multiclass U-net
> - Apply scikitlearn classical N-cut to the UNIMIB2016 dataset
> - Embedding network & Centroid loss
> - W-net & Soft N-Cut loss
> - W-net & Centroid loss
> - W-net supervised
> - W-net & Centroid loss initialized with the weights from the supervised W-net

## Postprocessing

> - Separate connected components from the same class

## Visualization

> - Mean color for each post processed class
> - Contour visualization for each class

## Notebooks
For each notebook we provide the link for the jupyter notebook available in this repository and the link to the Google Colaboratory notebook, where we have been working for our project. The notebooks in Google Colaboratory have readonly permissions, but they can be ran without making any modification to the code.

#### Binary U-net [[github](https://github.com/mbrufau7/tfm_food_segm/blob/master/U_net_binary.ipynb)]  [[Colaboratory](https://drive.google.com/open?id=13Wqd3Hj52HLJljyJECTJq2PHNIS8vOpY)]
#### Multiclass U-net [[github](https://github.com/mbrufau7/tfm_food_segm/blob/master/U_net_multiclass.ipynb)]  [[Colaboratory](https://drive.google.com/open?id=1bzy_pKWti6Opgz4sX3LVkDF2bZIuTRUB)]
#### Classical N-cut implementation [[github](https://github.com/mbrufau7/tfm_food_segm/blob/master/N_cut_implementation_results.ipynb)]  [[Colaboratory](https://drive.google.com/open?id=1Kdy2pkUpq_zKY7FBXu0iZMkv_jCc_zm2)]
#### Embedding network with Centroid loss [[github](https://github.com/mbrufau7/tfm_food_segm/blob/master/Embedding_Centroid_loss.ipynb)]  [[Colaboratory](https://drive.google.com/open?id=1xa5zjmdpdZ62sgJNCWL7rUreXeAoNRtI)]
#### W-net with Soft N-Cut loss [[github](https://github.com/mbrufau7/tfm_food_segm/blob/master/W_net_%26_Soft_N_cut_loss.ipynb)]  [[Colaboratory](https://drive.google.com/open?id=1-4c47pnG6gzwY4eltTiPF4K3KiBZf-6Y)]
#### W-net with Centroid loss [[github](https://github.com/mbrufau7/tfm_food_segm/blob/master/W_net_Unsupervised_%26_Centroid_Loss_1_2.ipynb)]  [[Colaboratory](https://drive.google.com/open?id=1AdiIGQDuTA-LY7mh9fB2XQ3b1ZNWlEdy)] [[github](https://github.com/mbrufau7/tfm_food_segm/blob/master/W_net_Unsupervised_%26_Centroid_Loss_2_2.ipynb)]  [[Colaboratory](https://drive.google.com/open?id=15wJNUdi6b72wMKPFTmflN9G5WO0dZaPD)]
#### W-net supervised & W-net with Centroid loss initialized with weights from supervised W-net [[github](https://github.com/mbrufau7/tfm_food_segm/blob/master/W_supervised_crossdomain.ipynb)]  [[Colaboratory](https://drive.google.com/open?id=132PlyhrAIgyF1-1IQ3YftOt2dZvcY26O)]

## Contributions
Contributions are welcome!  For bug reports or requests please [submit an issue](https://github.com/mbrufau7/tfm_food_segm/issues).

## Contact
Feel free to contact us to discuss any issues, questions or comments.
> - Montserrat Brufau: [mbrufau7](https://github.com/mbrufau7)
> - Àlex Ferrer: [alexfcub](https://github.com/alexfcub)
> - Markos Gavalas: [MarkosGavalas](https://github.com/MarkosGavalas)

### BibTex reference format for citation for the Code
```
@misc{WnetMAM,
title={Unsupervised Segmentation Using CNNs Applied To Food Analysis},
url={https://github.com/mbrufau7/tfm_food_segm},
note={GitHub repository with a collection of Jupyter notebooks intended to solve a lot of problems related to the project.},
author={Brufau, Montserrat and Ferrer, Àlex and Gavalas, Markos},
  year={2018}
}
```
### BibTex reference format for citation for the report of the Master's Thesis

```
@misc{WnetMAMThesis,
title={Unsupervised Segmentation Using CNNs Applied To Food Analysis},
url={https://github.com/mbrufau7/tfm_food_segm/blob/master/Brufau_Ferrer_Gavalas_TFM.pdf},
note={Report of the Master's Thesis: Unsupervised Segmentation Using CNNs Applied To Food Analysis},
author={Brufau, Montserrat and Ferrer, Àlex and Gavalas, Markos},
  year={2018}
}
```

