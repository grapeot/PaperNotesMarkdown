# Scott Satkin, Jason Lin, and Martial Hebert, Data-Driven Scene Understanding from 3D Models, BMVC 2012

## Problem
* Input: a database of 3D models, a single 2D image of indoor scenes
* Expected output: a _configuration_ of the scene, mainly the location, pose of the 3D objects.

## Formulation
* Intuition: given the result and the camera parameters, it's trivial to render the 2D image. Therefore the problem is how to _explain_ the 2D image with the 3D configurations
* Formulation: $ \max_{R_i, t_i, b_i} p(R_i, t_i, b_i, I) $
    * Maximize the consistency of the 3D configuration (rotation $R_i$, translation $t_i$ and binary selection indicator $b_i$) with the input 2D image
* There are already approaches generating possible configuration candidates, only need to propose a way to rerank them (the contribution)

## Approach
* First do the auto-calibration to determine the camera parameters
* From the configuration, can determine the following factors for every pixel
    * Surface normals
    * Possibility to be a certain object
    * Whether is an edge
* Also possible to estimate the info from the 2D image
    * Surface normals [16]
    * Possibility to be a certain object [23]
    * Whether is an edge (gPb)
* Learn linear weights to combine the pixel-wise features to a consistency score with SVM-like formulation
* Maximize such consistency score
* References (the same number as in the paper)
    * [16] V. Hedau, D. Hoiem, and D. Forsyth. Recovering the spatial layout of cluttered rooms. In ICCV, 2009.
    * [23] D. Lee, M. Hebert, and T. Kanade. Geometric reasoning for single image structure recovery. In CVPR, 2009
