load enron100.mat;
d=pdist(en2(1:100,2:3),'Cosine');
Z=linkage(d,"median");
[H,T]=dendrogram(Z,'ColorThreshold','default');