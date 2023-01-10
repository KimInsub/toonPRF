# toonPRF tutorial for PSYCH204A

Basic analysis script for estimating pRF in human visual cortex. Most of the scripts were written by Dawn Finzi

### Dependencies
vistasoft (https://github.com/vistalab/vistasoft)

### MRI data and ROIs
You can download NIfTI MRI files and pre-drawn ROIs of a test participant here: https://osf.io/zvb58/ 

### Analysis steps

pRF_workflow.m
1) Initialization
2) Stimulus inspection (Finzi et al, 2021)
3) Align inplane anatomy to volume anatomy
4) Motion correction
5) Install segmentation, transform tSeries to Gray, and average time series
6) Run compressive spatial summation (CSS) pRF model (Kay et al, 2013)

### References

Dumoulin, S. O., & Wandell, B. A. (2008). Population receptive field estimates in human visual cortex. Neuroimage, 39(2), 647-660.

Finzi, D., Gomez, J., Nordt, M., Rezai, A. A., Poltoratski, S., & Grill-Spector, K. (2021). Differential spatial computations in ventral and lateral face-selective regions are scaffolded by structural connections. Nature communications, 12(1), 1-14.

Kay, K. N., Winawer, J., Mezer, A., & Wandell, B. A. (2013). Compressive spatial summation in human visual cortex. Journal of neurophysiology, 110(2), 481-494.
