---
layout: paper
title: Quantifying and capturing transitions in intrinsic brain activity in healthy and patient populations
image: /images/projects/quant-rest.png
ref: 2015-2020
authors: 
funding: NIMH (K99/R00)
aims:  Despite the burgeoning literature showing group-based differences in brain activity at rest, its specific association to any particular disorder is still lacking, making it an ineffective biomarker. We also lack applicable translation of group-based results to personalized clinical care. The proposed research will be particularly focused on developing individualized metrics to capture and computationally model the dynamics of brain activity at rest, so that specific biomarkers can be developed for early detection and treatment of mental illness.

done: false

---

### Aims

Here, we proposed to develop and apply a novel computational framework to better understand the dynamical organization of intrinsic brain activity (IBA) in healthy participants and individuals with fragile x syndrome (FXS). To study the spatiotemporally rich phenomenon of IBA, resting-state functional Magnetic Resonance Imaging (rs-fMRI) data is typically analyzed by estimating statistical interdependence between time-varying signals from distinct brain regions over an entire scan period. By collapsing metrics over time, the resulting characterization only embodies an "average" snapshot across the complex phenomenon of IBA. Accordingly, there is a growing momentum towards quantifying the fluctuations in IBA. Several methods have been proposed, but they invariably average the data in either space (using seed- or network-based approaches) or time (using sliding- windows), thereby avoiding the examination of IBA in its entirety. I believ that comprehensive spatiotemporal analysis of IBA holds the key to finding person- and disorder-centric biomarkers. 

To this end, we first proposed to develop methods that can examine dynamics of rs-fMRI data while preserving space and time information. Our preliminary results are promising, suggesting that using topological data analysis, developed at Stanford, we can mine high-dimensions of rs-fMRI data while addressing the crucial issues of low SNR, statistical confidence, validity, and reliability of the proposed methods. Second, we proposed to use graph theory and state- space modeling to mathematically analyze and quantify the state/network transitions in IBA. Such modeling will not only improve our understanding of the mechanisms underlying dynamical brain organization in healthy and FXS groups, but will also allow us to generate concrete and testable hypotheses for future research. 


### Highlights
- We have developed a Topological Data Analysis (TDA) based approach to study fluctuations in intrinsic and evoked brain activity
- Our approach can distill high dimensional neuroimaging data into behaviorally relevant representations
- Our method circumvents arbitrary averaging of data in space (over regions/nodes) or time (over 30 s windows or scan sessions)
- The statistical inferences made by our method are at the level of single participants.

### Next step
- Next we are working towards applying our approach to study intrinsic activity dynamics 
- We are also working on better characterizing changes in brain activity dynamics in patients with FXS

### Presentations/Papers
1. Saggar, M., Hosseini, S. M. H., Bruno, J. L., Quintin, E.-M., Raman, M. M., Kesler, S. R., Reiss, A. L. (2015). <a href="http://dx.doi.org/10.1016/j.neuroimage.2015.07.006"> Estimating individual contribution from group-based structural correlation networks </a>. <strong> NeuroImage </strong>, 120, 274–284 
2. Saggar, M., Vrticka, P., Reiss, A.L. (2016) <a href="http://dx.doi.org/10.1016/j.neuropsychologia.2015.10.039"> Understanding the influence of personality on dynamic social gesture processing: an fMRI study </a>. <strong> Neuropsychologia </strong>, 80, 1-8 
3. Bruno, J., Hosseini, S.M.H., Saggar, M., Reiss, A.L. (2017) <a href="http://doi.org/10.1093/cercor/bhw055"> Altered brain network segregation in fragile X syndrome revealed by structural connectomics </a>. <strong> Cerebral Cortex </strong>.  
4. Saggar, M.*, Tsalikian, E.*, Mauras, N., Mazaika, P., White, N. H., Weinzimer, S., et al. (2017). <a href="http://doi.org/10.2337/db16-0414"> Compensatory Hyper-Connectivity in Developing Brains of Young Children with Type 1 Diabetes </a>. <strong> Diabetes </strong>.  
5. Saggar, M., Sporns, O., Gonzalez-Castillo, J., Bandettini, P.A., Carlsson, G., Glover, G., Reiss, A.L. (2018) <a href="http://dx.doi.org/10.1038/s41467-018-03664-4">Towards a new approach to visualize and quantify brain’s dynamical organization using topological data analysis </a>. <strong> Nature Communications </strong>.  
6. Geniesse, C., Sporns, O., Petri, G., Saggar, M. (2019). <a href="http://dx.doi.org/10.1162/netn_a_00093"> Generating dynamical neuroimaging spatiotemporal representations (DyNeuSR) using topological data analysis </a>. <strong> Network Neuroscience </strong>. 
7. Saggar, M. & Uddin, L. (2019). <a href="http://dx.doi.org/10.1523/ENEURO.0384-19.2019"> Pushing the boundaries of psychiatric neuroimaging to ground diagnosis in biology </a>. <strong> eNeuro </strong>. 


### Funding
A career development award (K99/R00) was awarded to M.S.
