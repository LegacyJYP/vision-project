%close all;
clear;
addpath(genpath('.'));
addpath('../png_sample/');

load_images;
%filename len img
%img{2}

f1 = img{1};
w = img{2};
f2 = img{3};

figure;
seg = imread('segmented.png');
fname = 'fp_avg.png';
raw_img = imread(fname);
raw_img = double(raw_img)/255;
raw_seg = seg.*raw_img;
imshow(raw_seg,[])

tform = registeration(w,f1);
tforminv = maketform('affine',tform.tdata.Tinv);

show_with_color(w,raw_seg,tforminv);