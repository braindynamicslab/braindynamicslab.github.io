---
layout: paper
title: Efficient Deep Learning Models for PredictingIndividualized Task Activation From Resting-State Functional Connectivity
image: /images/papers/rdoc-dl.png
authors: Madsen S.*, Lee Y.*, Quah S.K.L., Uddin L.Q., Mumford J.A., Barch D.M., Fair D.A., Gotlib I.H., Poldrack, R.A., Kuceyeski A., Saggar M. (* co-first)
year: 2026
ref: Madsen S.*, Lee Y.*, Quah S.K.L., Uddin L.Q., Mumford J.A., Barch D.M., Fair D.A., Gotlib I.H., Poldrack, R.A., Kuceyeski A., Saggar M. (2026) Human Brain Mapping
journal: "Human Brain Mapping"
doi: 10.1002/hbm.70557
github: https://github.com/braindynamicslab/dl-task-contrast-prediction
pdf: /pdfs/papers/madsen-lee-dl.pdf
biorxiv: https://www.biorxiv.org/content/10.1101/2024.09.10.612309v4

---

# Abstract
Deep learning models have demonstrated the potential to predict task-evoked brain activation from resting-state functional magnetic resonance imaging, offering a pathway toward individualized brain mapping without requiring task-based data. In this study, we systematically evaluate architectural strategies for improving the efficiency and scalability of such models. Using data from the Human Connectome Project, we replicate the BrainSurfCNN framework and introduce two extensions: BrainSERF, which incorporates channel-wise attention through squeeze-and-excitation modules, and BrainSurfGCN, a graph-based model that leverages cortical mesh topology for efficient message passing. Across multiple evaluation metrics, including spatial correlation, Dice score, Dice AUC, and subject identification accuracy, all models achieve comparable predictive performance. Despite similar accuracy, the proposed models offer distinct advantages. BrainSERF provides modest improvements in capturing individual-specific features, while BrainSurfGCN achieves substantial reductions in model size and training time, highlighting a favorable trade-off between performance and computational efficiency. Beyond architectural comparisons, we investigate factors driving variability in prediction accuracy. We find that behavioral task performance, resting-state data quality, and inter-subject variability in task activation jointly constrain prediction fidelity. In particular, contrasts with lower signal reliability and higher variability exhibit reduced predictability across all models. Together, these findings demonstrate that incorporating topological and functional structural priors can improve the efficiency of deep learning models without sacrificing accuracy, while also emphasizing that prediction performance is fundamentally limited by the reliability of the underlying neural signals.