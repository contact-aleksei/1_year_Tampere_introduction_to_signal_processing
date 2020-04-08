imOrig = imread('canoe.jpg');
figure
imshow (imOrig, []);
[x1,y1] = ginput(1); [x2,y2] = ginput(1);
window1 = imOrig(y1-3:y1+3, x1-3:x1+3,:);
window2 = imOrig(y2-3:y2+3, x2-3:x2+3,:);
X1 = double(reshape(window1, 49, 3))';
X2 = double(reshape(window2, 49, 3))';

mu0 = mean(X1',1)'; mu1 = mean(X2',1)';
cov0 = cov(X1'); cov1 = cov(X2');

covinv = inv(cov0 + cov1);
w = covinv * (mu0 - mu1);
threshold = (dot(w,(mu0+mu1)))/2

imGray = w(1)*double(imOrig(:,:,1))+...
         w(2)*double(imOrig(:,:,2))+...
         w(3)*double(imOrig(:,:,3));

figure
imshow(imGray)
imshow(imGray > threshold, []);


