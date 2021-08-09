---
layout: post
title: Topological Data Analysis of fMRI data
link: /papers/saggar-tda-mapper-cme
image: /images/blog/saggar-tda-mapper-cme.png
author: Manish Saggar
---

{% include base.html %}

### Quick Summary

We just had our paper accepted in [Nature Communications](https://www.nature.com/articles/s41467-018-03664-4), which presents a new method to examine the brain dynamics at a single participant level. Here, we used [Topological Data Analysis (TDA)](https://en.wikipedia.org/wiki/Topological_data_analysis) based [Mapper](https://www.ias.edu/ideas/2013/lesnick-topological-data-analysis) to reveal the overall organization of brain dynamics without arbitrarily collapsing data in time and space early in the analysis. The generated [shape graphs]({{base}}{{/images/blog/saggar-tda-mapper-cme.png}}) provide interpretable visualizations of how the brain traverses its dynamical landscape—namely data-driven abstractions that attempt to capture the stream of thought originally proposed by William James (Chapter IX) — and permit quantification of these dynamic trajectories in behaviorally and clinically relevant ways that allow comparisons across conditions, participants, and populations.


### Brief Background
How our brain dynamically adapts to perform different tasks is vital to understanding the neural basis of cognition. Understanding the brain’s dynamical organization is crucial for finding causes, cures and effective treatments for neurobiological disorders. The brain’s inability to dynamically adjust to environmental demands and aberrant brain dynamics have been previously associated with disorders such as schizophrenia, depression, attention deficiency and anxiety disorders. However, the high spatiotemporal dimensionality and complexity of neuroimaging data make the study of whole-brain dynamics a challenging endeavor.

Researchers and clinicians alike demand novel methods that are aimed at distilling complex high dimensional data into simple—yet vibrant and behaviorally relevant—representations that can be interactively explored to discover new aspects of the data. Ideally, such representations could also be quantified to allow for statistical inferences and to provide the basis of biomarkers and treatment response factors at the single-subject level.

With these goals in sight, we used TDA-based Mapper tool to:

1. distill high dimensional neuroimaging data into behaviorally relevant representations

2. circumvent arbitrary averaging of data in space (over regions/nodes) or time (over 30 s windows or scan sessions)

3. make statistical inferences at the level of single participants.

### Key Findings
Without arbitrarily collapsing data in space or time, our TDA-based approach generates graphical representations of how the brain navigates through different functional configurations during a scanning session—i.e., a data-driven representation of the stream of mind [(see movie)](#movie) that unfolds as participants lie in the scanner

<div class="col-md-4">
    <img src="../images/blog/saggar-tda-mapper-cme-cs.png" class="img-responsive pull-left">
</div>


These representations, when computed on a continuous multitask dataset, revealed the temporal arrangement of whole-brain activation maps as a hybrid of two mesoscale structures, i.e., community and core−periphery organization.


Remarkably, the community structure was found to be essential for the overall task performance, while the core−periphery arrangement revealed that brain activity patterns during evoked tasks were aggregated as a core while patterns during resting state were located in the periphery.

Neurophysiologically, the core represented taskspecific (task-positive) brain activations, while the periphery represented task-unrelated (task-negative) activations. This neurophysiological insight indicates higher similarity of whole-brain activation patterns when participants are actively engaged in cognitively demanding tasks compared to when allowed to freely mind-wander during rest periods, which is a well-established hallmark of brain dynamics.


Lastly, by projecting shape graphs into the time domain, we were able to pinpoint between- as well as within-task transitions at the temporal resolution of a few time frames.

<div class="col-md-12">
    <img src="../images/blog/saggar-tda-mapper-cme-ts.png">
</div>

### Next steps
Application of the developed methods to study aberrant brain dynamics in patients with mental health disorders.


### Movie

<div class="embed-responsive embed-responsive-16by9" id="movie">
  <iframe src="https://player.vimeo.com/video/225062058" width="1024" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>
<br>


### Collaborators
* [Olaf Sporns](http://psych.indiana.edu/faculty/osporns.php)
* [Gunnar Carlsson](https://profiles.stanford.edu/gunnar-carlsson)
* [Javier Gonzalez-Castillo](https://fim.nimh.nih.gov/profiles/javier-gonzalez-castillo)
* [Peter Bandettini](https://fim.nimh.nih.gov/profiles/peter-bandettini-phd)
* [Gary Glover](https://profiles.stanford.edu/gary-glover)
* [Allan Reiss](https://profiles.stanford.edu/allan-reiss)

### Funding
* NIMH (K99/R00 award to M.S.) and Brain & Behavior Foundation (NARSAD Young Investigator Award to M.S.)
