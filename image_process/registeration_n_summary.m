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

tform = registeration(w,f1);
show_with(w,f1,tform);
show_with(img{4},img{5});

%figure;%visreg(w,f1,tform);