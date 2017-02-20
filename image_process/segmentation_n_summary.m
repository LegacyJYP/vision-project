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

%tform_f1 = registeration(w,f1);
[gw g1] = registeration_newimage(w,f1);
figure;
imshow(gw)

%% today
gw_edge = edgedetect_idv(gw,0.1);
figure, imshow(gw_edge),title('raw+sobel')

bw_rw = im2bw(gw_edge, graythresh(I_eq));
figure, imshow(bw_rw),title('graythresh')

se = strel('disk', 2,0);
c2 = imopen(bw_rw,se);
imshow(c2);