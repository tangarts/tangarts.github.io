---
title: nets
date: 2020-06-02
modified: 2020-08-24
slug: nets
status:
---


> **NN overparameterization:** We can train large deep slow neural networks to
> human-level performance on many tasks, and we can then train small shallow
> fast versions of those NNs to save energy/enable mobile deployment, so why
> can’t we train small shallow fast NNs in the first place? And what would
> happen if we did figure it out?


### Architecture:

Neural networks are essentially layers of linear transformations with
non-linear activation funcitons between the layers. The ith hidden layer
expressed as:

$$h_i = f(\sum_i^n W_jh_{i-1})$$

If we specified our activation function to be a sigmoid transformation
$\sigma(\bf{z})_i = \frac{exp{z_i}}{\sum_j=1^K exp{z_j}}$ then we obtain a
multinomi al logistic regression classifier

The benefit of adding layers to our neural network has to do with learning
complexity. 

### MNSIT Digits

With images we see that the first few layers learn high level features such as the edges of the digit. As we increase layer depth, more abstract feautres such as the number of curves a digit has.


Current architecture design

Convolutional Layers: 

Recurrent layers:

