Feedback
---
##### by Changlin Ke

The research aims to predict three human breast cancer tumour subtypes with four common machine learning models (KNN, SVM, RF, DT) trained on an aCGH dataset and attempts to find the best performing model along with the most important feature. To validate the performance of the models, a double cross-validation scheme that contains  10-fold repeated CV with hyperparameter tuning in inner loops, and feature selection after random train-test split in outer loops is constructed. The paper concludes that the Random Forest classifier, showing high average prediction accuracy, outperforms other models. A genomic region is also identified as the most important feature and its connection to a HER2-coding gene is discussed.

---

#### Context [0-5]: 4

Biological connection to the research question is well defined in the introduction part, where background information about aCGH data, breast cancer subtypes and existing methods are provided. Methodology is described in methods part but there's not enough explanation for feature selection and hyperparameter tuning methods. 

How do filterVarlmp work? Statiscal metrics such as mutual info and chi-squared are mentioned in the discussion but they're not simply R packages, thus cannot be compared to 'filterVarlmp'. Instead of showing a 'magic' R function, readers should be provided how exactly the 'importance' of features are ranked or what this package is based on, the underlyiing idea matters, the name of package is rather irrelavent. 

Also, as an essential part of the model training though, there's very limited information provided about hyperparameter tuning, we only know what hyper paramter is considered for each method and that they'll be tuned, but how did you find the optimal setup for each method and how many candidates you've tried? (if a gridsearch is done, approximately how large the grid is?) 

#### Research question [0-5]: 4

The goal of the research is clear and the research question is fully answered. However, the results provided so far cannot support the  overconfident conclusion in the paper, further exploration is highly recommanded to prove that
 RF has obvious advantages over SVM, especially in fig2B when SVM is better. (maybe calculate stdev and AUC?) And I can't see 'consistent' superiority of RF over other models in fig2. More explanation and reflection is needed.
 
#### Methodology [0-5]: 2

The scheme is clearly illustrated in a flow chart but 80-20 train-test split is not shown in the figure but limitation is addressed.

The feature selection and hyperparameter tuning methods are vaguely explained as stated above, and since changing the FS methods certainly brings changes in feature importance rankings, which means that you would use different features for training at each repetition, then how could this have no effect on 'overall picture of the model accuracies'? You can't say order is irrelevant just because all features are used, different features are used even the number of features are the same for different FS methods.  

Most importantly, a 'double-loop CV', also called 'nested-loop CV', should be 'the k-fold cross-validation procedure for model hyperparameter optimization nested inside the k-fold cross-validation procedure for model selection.' Please be adviced that you are not doing a so called 'double-loop CV' but one 10-fold repeated CV to tune hyperparam and a 100-time repetition outer loop to select features and models at the same time. The aim of nested-loop CV is 'to overcome the problem of overfitting the training dataset' while CV, so your scheme with only one CV do not solve that issue and for the outer loop, neither have you enjoyed the superiority of CV (CV uses all the data while train-test split can not).

#### Contents/Results [0-5]: 3

Results are not compared to previous literature but an insightful discovery of region is found with reference to previous research. The research question is answered but not put into a specific biological context (the sentence '...contribute to understanding...' basically says nothing, it's better find an exact case of application).

#### Tables/Figures [0-5]: 4

The purpose of figures and table are clearly defined and detailed captions are presented.

The violin plot is not well explained, only average accuracy point is indicated in the caption while it carries more info than covered in the paper, it's better to add description of the distributions, box and interquartile range, etc. Why draw a figure with features you don't use?

I'm far from an expert so sorry for any mistakes.

All the best.
