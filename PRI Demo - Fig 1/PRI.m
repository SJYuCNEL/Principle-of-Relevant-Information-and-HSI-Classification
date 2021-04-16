function [Y]=PRI(x,beta,iter,varargin)
%PRI Multiscale Principle of Relevant Information for Hyperspectral Image Classification

%             Input:
%               x       - Data matrix. Each row vector of x is a data point.
%
%               beta    - Hyper-parameter controlling the amount of relevant information that Y can extract from x
%               iter    - The number of the iterations
%             Output:
%               Y       - Each row vector of Y is a new representation of input data point.
% For further details please refer:
% [1] Y Wei, S Yu, LS Giraldo, JC Principe, Multiscale Principle of Relevant Information for Hyperspectral Image Classification, Machine Learning, 2021.
% [2] JC Principe. Information theoretic learning: Renyi's entropy and kernel perspectives. Springer Science & Business Media, 2010

% Written by Yantao Wei, Shujian Yu

N = length(x); % The number of the data points.

den_=zeros(N,1);
den_1=zeros(N,1);
num_=zeros(N,3);
num_1=zeros(N,3);
num_2=zeros(N,3);
x0=x;  % original data
x_1=x; % new representation

temp1=zeros(N,N);
temp2=zeros(N,N);
if beta==0
    if nargin==1
       sig=varargin{1};
    else
       sig=0.5;
    end
   for n=1:iter % The number of the iterations
    for k=1:N     
       for kk=1:N
           den_(kk)=GK(x(k,:)-x(kk,:),sig);
           if den_(kk)<=1.0e-6
              den_(kk)=0;
           end
           num_1(kk,:)=den_(kk)*x(kk,:);           
       end
       x_1(k,:)=sum(num_1)/(sum(den_)+0.0000000001);
    end
    x=x_1;
  end    

else
    
for n=1:iter % The number of the iterations
    if nargin==1
       sig=varargin{1};
    else
       sig=0.2;
    end
  
    if beta==1
        c=0;
    else
    for mm=1:N
        for nn=1:N
        temp1(mm,nn)=GK(x(mm,:)-x0(nn,:),sig);     
        temp2(mm,nn)=GK(x(mm,:)-x(nn,:),sig);        
        end
    end
    c=sum(temp1(:))/sum(temp2(:));
    end
    for k=1:N
       for kk=1:N
           den_(kk)=GK(x(k,:)-x0(kk,:),sig);
           den_1(kk)=GK(x(k,:)-x(kk,:),sig);
           num_1(kk,:)=den_1(kk)*x(kk,:);
           num_(kk,:)=den_(kk)*x0(kk,:);
           num_2(kk,:)=den_1(kk)*x(k,:);                  
       end
       x_1(k,:)=c*(1-beta)/beta* sum(num_1)/sum(den_+0.000000001)+ sum(num_)/sum(den_+0.0000000001)-c*(1-beta)/beta*sum(num_2)/sum(den_+0.0000000001);
       %corresponding to Eq. 12 in the reference [1].
    end
    x=x_1; 
end
end
Y=x;% Output
end


