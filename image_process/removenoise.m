 % 170221 Tuesday
% 
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


seg = imread('segmented.png');
seg_g1 = seg.*g1;

sob = imread('fp_avg.png');
sob = double(sob)./255;
sob = sob.*seg;


fig1 = figure;
subplot(2,1,1);
imshow(seg_g1);
subplot(2,1,2);
imshow(sob);
imwrite(seg_g1,'segmented_raw.png')
%%
seg_g1 = histeq(seg_g1);
figure;
subplot(2,1,1);
imshow(seg_g1,[]);
subplot(2,1,2);
bar(imhist(seg_g1));

