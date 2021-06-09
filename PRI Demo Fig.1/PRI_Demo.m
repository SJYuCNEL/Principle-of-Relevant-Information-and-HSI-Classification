clear, close all
load Intersect.mat %load data
x=X;
scatter3(x(:,1),x(:,2),x(:,3),100,[1 0 0]) %Plot the original data
axis([-1.5 1.5 -1 1 -1 6])
view(-36,66)
title('Original Data');

beta=1;    
iter=1000; % The number of the iterations

Y=PRI(x,beta,iter,0.2); %  PRI

figure
scatter3(Y(:,1),Y(:,2),Y(:,3),100) %Plot the results
axis([-1.5 1.5 -1 1 -1 6])
view(-36,66)
title(['\beta =',num2str(beta)]);

beta=3;    
iter=1000; % The number of the iterations

Y=PRI(x,beta,iter,0.2); %  PRI

figure
scatter3(Y(:,1),Y(:,2),Y(:,3),100) %Plot the results
axis([-1.5 1.5 -1 1 -1 6])
view(-36,66)
title(['\beta =',num2str(beta)]);

