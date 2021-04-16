function [r]=GK(x,sigma)
r=1/sqrt(2*pi)/sigma*exp(-norm(x)^2/2/sigma^2);
% if r<1.0e-6
%     r=0;
% end
end
