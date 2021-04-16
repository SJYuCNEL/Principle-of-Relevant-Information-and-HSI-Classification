clear, close all
load Intersect.mat %load data
x=X;
scatter3(x(:,1),x(:,2),x(:,3),100,'MarkerEdgeColor','m') %Plot the original data
view(-35,70);
axis([-1.5 1.5 -1 1 -1 6])

beta=1;    
iter=1000; % The number of the iterations

Y=PRI(x,beta,iter); %  runing PRI

figure,
scatter3(Y(:,1),Y(:,2),Y(:,3),100) %Plot the results
view(-35,70);
axis([-1.5 1.5 -1 1 -1 6])

