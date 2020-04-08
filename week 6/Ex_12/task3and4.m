close all;
clear all;

% (a) Download the file testdata_fisher.mat
load testdata_fisher.mat

x1a=X1(:,1);
x1b=X1(:,2);
x2a=X2(:,1);
x2b=X2(:,2);

% (a) Plot in the same figure the data points of the matrices


% (b) We will now classify the two classes in (a) by the LDA

mu1=mean(X1); cov1=cov(X1);
mu2=mean(X2); cov2=cov(X2);
meanv=mu1-mu2;
covari=inv(cov1-cov2);

w=covari*meanv';

unit_w = (w./norm(w)).*10;
hold on

figure;
hold on
plot([0,unit_w(1)],[0,unit_w(2)])
plot(x1a,x1b,'or')
plot(x2a,x2b,'+g')
axis equal



%%task 4
m1 = mean(X1)';
m2 = mean(X2)';
c1 = cov(X1);
c2 = cov(X2);

w1 = inv(c1+c2) * (m1 - m2);
firstvalue = dot(w1,m1);
secondvalue = dot(w1,m2);
thirdvalue = (firstvalue+secondvalue)/2;

corclass = 0;
for t = 1:length(X1)
    if dot(w1, X1(t,:)') >= thirdvalue
    corclass = corclass +1;
    end
end


for t = 1:length(X2)
    if dot(w1, X2(t,:)') < thirdvalue
    corclass = corclass +1;
    end
end

percentage = corclass/200 * 100;
disp("Correctly predicted:");
disp(percentage);
