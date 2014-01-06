# Scott Satkin, Martial Hebert, 3DNN: Viewpoint Invariant 3D Geometry Matching for Scene Understanding, ICCV 2013

## Problem
* Input: a database of 3D models, a single 2D image of indoor scenes
* Expected output: a _configuration_ of the scene, mainly the location, pose of the 3D objects.

## Formulation
* Intuition: given the result and the camera parameters, it's trivial to render the 2D image. Therefore the problem is how to _explain_ the 2D image with the 3D configurations
* Formulation: $ \max_{R_i, t_i, b_i} p(R_i, t_i, b_i, I) $
    * Maximize the consistency of the 3D configuration (rotation $R_i$, translation $t_i$ and binary selection indicator $b_i$) with the input 2D image
* There are already approaches generating possible configuration candidates, only need to propose a way to rerank them (the contribution)

## Approach (Compared with [28])
* Do not stick to a single pose. For each candidate configuration, estimate multiple possible camera poses, and simultaneously optimize on all the promising candidates
* In each iteration of the optimization, also do geometry refinement
    * Adjust the pose of each 3D model by minimizing a consistency cost between the 3D model and the observed image region based on SIFT flow
* References
    * [28] S. Satkin, J. Lin, and M. Hebert. Data-driven scene understanding from 3D models. In BMVC, 2012
