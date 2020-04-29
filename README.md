# Explanatory-Graph-Thesis

This project consists of matlab code to evaluate a trained Explanatory Graph from a dataset of human faces. A mat file consisting of part data is present in the **PartData** folder. You need to load the variable from the folder in order to run the evaluation. The next step is to run the ``plotParts()`` function. The function can give out 4 outputs consisting of Mean Square Error of each part in the following format below. The resulting output can be found in the **GraphOutput** folder.

``[mouthMSE, noseMSE, rightMSE, leftMSE] = plotParts();``
