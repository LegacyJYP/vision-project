% 170220 Monday

close all;
clear;
addpath(genpath('.'));
addpath('../png_sample/');

load_images;
%filename len img
%img{2}

f1 = img{1};
w = img{2};
f2 = img{3};

[gw g1] = registeration_newimage(w,f1);
%figure;
%imshow(gw)

%% segmentation
f = g1;

%(1) Edge detection
fig1 = figure;
subplot(3,3,1);imshow(f);
subplot(3,3,2);imhist(f);  
sx = fspecial('sobel');
sy = sx';
gx = imfilter(f,sx,'replicate');
gy = imfilter(f,sy,'replicate');
grad = sqrt(gx.*gx+gy.*gy);
grad = grad/max(grad(:));

%% gradient histo equalization
grad_histoeq = histeq(grad);
grad = grad_histoeq;

subplot(3,3,3);imshow(grad);

% (2) Thresholding the edge image
h = imhist(grad);
subplot(3,3,5);bar(h);
thresholdper=0.7; % cut < 95%

%% gradient histo equalization
fig2 = figure;
subplot(3,2,1);
imshow(grad_histoeq);

subplot(3,2,3);
threshold = 0.8;
imshow(grad_histoeq>threshold);

subplot(3,2,4);
threshold = 0.9;
imshow(grad_histoeq>threshold);

subplot(3,2,5);
threshold = 0.95;
imshow(grad_histoeq>threshold);

subplot(3,2,6);
threshold = 0.99;
imshow(grad_histoeq>threshold);


figure(fig1);
% (3) Create marker image
markerImage = grad>thresholdper;
subplot(3,3,4); imshow(markerImage,[]);

% (4) Compute histogram of the marker image
fp = grad_histoeq.*markerImage;
fp = histeq(fp);
subplot(3,3,7); imshow(fp,[]);
hp = imhist(fp);
hp(1) = 0;
subplot(3,3,8);bar(hp);

% (5) Tresholding the original image
T = otsuthresh(hp);
subplot(3,3,6); imshow(im2bw(fp,T));
subplot(3,3,9); imshow(im2bw(f,T));