%registeration_n_sobel

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

%% sobel
filt_img = cell(len,1);
for i = 1:len
    filt_img{i} = edgedetect_idv(img{i},0.1);
end

% filt_img{1} = torgb(filt_img{1},'r');
% filt_img{2} = torgb(filt_img{2},'g');
% filt_img{3} = torgb(filt_img{3},'b');

%show_with(filt_img{2},filt_img{1},tform);

figure;%visreg(w,f1,tform);