load xV.mat;
xV2=xV
notNan=~isnan(xV2)
xV2(~notNan)=0 %κάνω τα Nan 0 γιατί παίρνω error με τα δεδομένα όπως ήταν% 
X=xV2(:,[1:469]);
k =3; 
[IDX,C] = kmeans(X,k)

figure(1)
 plot(IDX,'o') 
figure(2)
plot(X(IDX==1,1),X(IDX==1,2),'r.','MarkerSize',12)
hold on
plot(X(IDX==2,1),X(IDX==2,2),'b.','MarkerSize',12)
hold on
plot(X(IDX==3,1),X(IDX==3,2),'c.','MarkerSize',12)
hold on
plot(C(:,1),C(:,2),'kx',...
 'MarkerSize',12,'LineWidth',2)
plot(C(:,1),C(:,2),'ko',...
 'MarkerSize',12,'LineWidth',2)
legend('C1','C2','C3','Centroids',...
 'Location','NW') 