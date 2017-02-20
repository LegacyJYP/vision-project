% % 170220 Monday
% 
 close all;
% clear;
% addpath(genpath('.'));
% addpath('../png_sample/');
% 
% load_images;
% %filename len img
% %img{2}
% 
% f1 = img{1};
% w = img{2};
% f2 = img{3};
% 
% [gw g1] = registeration_newimage(w,f1);
% %figure;
% %imshow(gw)

%% segmentation
f = g1;

%(1) Edge detection
fig1 = figure;
%subplot(3,3,1);imshow(f);
%subplot(3,3,2);imhist(f);  
sx = fspecial('sobel');
sy = sx';
gx = imfilter(f,sx,'replicate');
gy = imfilter(f,sy,'replicate');
grad = sqrt(gx.*gx+gy.*gy);
grad = grad/max(grad(:));

%% gradient histo equalization
grad_histoeq = histeq(grad);
grad = grad_histoeq;

%subplot(3,3,3);imshow(grad);

% (2) Thresholding the edge image
h = imhist(grad);
%subplot(3,3,5);bar(h);
thresholdper=0.7; % cut < 95%

% (3) Create marker image
markerImage = grad>thresholdper;
%subplot(3,3,4); imshow(markerImage,[]);

% (4) Compute histogram of the marker image
fp = grad_histoeq.*markerImage;
%fp = histeq(fp);

%%watershedx
%subplot(2,3,1); imshow(fp,[]);
w = fspecial('average',5);
fp_avg = imfilter(fp,w);
subplot(2,1,1); imshow(fp_avg,[]);

L1 = watershed(fp_avg);
subplot(2,1,2); imshow(L1,[]);


imwrite(fp_avg,'fp_avg.png');


activecontour(

%% quit




