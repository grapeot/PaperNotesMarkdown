# An Interactive Approach to Semantic Modeling of Indoor Scenes with an RGBD Camera. Tianjia Shao, Weiwei Xu, Kun Zhou, Jingdong Wang, Dongping Li, and Baining Guo. ACM Transactions on Graphics (TOG), Siggraph Asia 2012

## Problem
* Given several RGB-D images, reconstruct the 3D scene, segment the object out, and determine their semantic labels

## Approach
* Adapt an existing segmentation approach, refine the 3D model and determine the semantic label by matching the depth map against a 3D model database
* Segmentation: basically [S&F 2011], adding some 3D geometric features
* Matching
    * Discriminative regression forest: 2.5D data -> instance ID in the database as well as pose
    * Training: on rendered depth maps of the objects in the database
    * Aggregation: sum up the probability
    * Database: in the supplementary materials, but cannot find it. Suspect this is very small.
* References
    * [S&F 2011]: S ILBERMAN , N., AND F ERGUS , R. 2011. Indoor scene segmentation using a structured light sensor. In Proceedings of the International Conference on Computer Vision - Workshop on 3D Representation and Recognition.

