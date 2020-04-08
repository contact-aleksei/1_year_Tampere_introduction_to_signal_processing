%% Task3
clear all
close all
clc

load testdata_fisher.mat

x1a = X1(:,1);
x1b = X1(:,2);
x2a = X2(:,1);
x2b = X2(:,2);


miu0 = mean(X1',1)';
miu1 = mean(X2',1)';
C0 = cov(X1');
C1 = cov(X2');

Cinv = inv(C0 + C1);
w = Cinv * (miu0 - miu1);
unit_w = (w./norm(w)).*100;

figure
hold on
plot([0,unit_w(1)],[0,unit_w(2)])
plot(x1a,x1b,'or')
plot(x2a,x2b,'xg')
axis equal
hold off


%% Task4

clear all
close all
clc

load testdata_fisher.mat

m1 = mean(X1)';
m2 = mean(X2)';

c1 = cov(X1);
c2 = cov(X2);

w1 = inv(c1+c2) * (m1 - m2);

first = dot(w1,m1);
second = dot(w1,m2);

third = (first+second)/2;

correct = 0;
for t = 1:length(X1)
    if dot(w1, X1(t,:)') >= third
        correct = correct +1;
    end
end


for t = 1:length(X2)
    if dot(w1, X2(t,:)') < third
        correct = correct +1;
    end
end

perc_corr = correct/200 * 100;
fprintf('Correct predicted: %f', perc_corr);



%% Task5

imOrig = imread('canoe.jpg');

figure
imshow (imOrig, []);

[x1,y1] = ginput(1);
[x2,y2] = ginput(1);

window1 = imOrig(y1-3:y1+3, x1-3:x1+3,:);
window2 = imOrig(y2-3:y2+3, x2-3:x2+3,:);

X1 = double(reshape(window1, 49, 3))';
X2 = double(reshape(window2, 49, 3))';

miu0 = mean(X1',1)';
miu1 = mean(X2',1)';
C0 = cov(X1');
C1 = cov(X2');

Cinv = inv(C0 + C1);
w = Cinv * (miu0 - miu1);

imGray = w(1)*double(imOrig(:,:,1)) +...
w(2)*double(imOrig(:,:,2)) +...
w(3)*double(imOrig(:,:,3));

figure
imshow(imGray)

%imshow(imGray > threshold, []);

