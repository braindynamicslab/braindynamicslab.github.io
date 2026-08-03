---
layout: paper
title: Quantifying and capturing transitions in intrinsic brain activity in healthy and patient populations
image: /images/projects/quant-rest.png
ref: 2015-2020
authors: Saggar M, Jahanikia S, Howell A, Stankov A
funding: NIMH (K99/R00)
aims:  Despite the burgeoning literature showing group-based differences in brain activity at rest, its specific association to any particular disorder is still lacking, making it an ineffective biomarker. We also lack applicable translation of group-based results to personalized clinical care. The proposed research will be particularly focused on developing individualized metrics to capture and computationally model the dynamics of brain activity at rest, so that specific biomarkers can be developed for early detection and treatment of mental illness.

done: true

status: Completed
summary: "Developing individualized metrics to capture and computationally model resting-state brain dynamics, toward personalized biomarkers for mental illness."
team: ["Manish Saggar", "Sahar Jahanikia", "Amber Howell", "Atanas D. Stankov"]
collaborators: "Allan Reiss, Gunnar Carlsson, Olaf Sporns"
---

### Aims

Here, we proposed to develop and apply a novel computational framework to better understand the dynamical organization of intrinsic brain activity (IBA) in healthy participants and individuals with fragile x syndrome (FXS). To study the spatiotemporally rich phenomenon of IBA, resting-state functional Magnetic Resonance Imaging (rs-fMRI) data is typically analyzed by estimating statistical interdependence between time-varying signals from distinct brain regions over an entire scan period. By collapsing metrics over time, the resulting characterization only embodies an "average" snapshot across the complex phenomenon of IBA. Accordingly, there is a growing momentum towards quantifying the fluctuations in IBA. Several methods have been proposed, but they invariably average the data in either space (using seed- or network-based approaches) or time (using sliding- windows), thereby avoiding the examination of IBA in its entirety. I believ that comprehensive spatiotemporal analysis of IBA holds the key to finding person- and disorder-centric biomarkers. 

To this end, we first proposed to develop methods that can examine dynamics of rs-fMRI data while preserving space and time information. Our preliminary results are promising, suggesting that using topological data analysis, developed at Stanford, we can mine high-dimensions of rs-fMRI data while addressing the crucial issues of low SNR, statistical confidence, validity, and reliability of the proposed methods. Second, we proposed to use graph theory and state- space modeling to mathematically analyze and quantify the state/network transitions in IBA. Such modeling will not only improve our understanding of the mechanisms underlying dynamical brain organization in healthy and FXS groups, but will also allow us to generate concrete and testable hypotheses for future research. 


### Highlights
- We have developed a Topological Data Analysis (TDA) based approach to study fluctuations in intrinsic and evoked brain activity
- Our approach can distill high dimensional neuroimaging data into behaviorally relevant representations
- Our method circumvents arbitrary averaging of data in space (over regions/nodes) or time (over 30 s windows or scan sessions)
- The statistical inferences made by our method are at the level of single participants.

### Next steps
- Next we are working towards applying our approach to study intrinsic activity dynamics 
- We are also working on better characterizing changes in brain activity dynamics in patients with FXS

### Funding
A career development award (K99/R00) was awarded to M.S.
