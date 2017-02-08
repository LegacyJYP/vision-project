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