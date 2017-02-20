clear;
close all;

addpath(genpath('.'));
addpath('../png_sample/');
load_images;

filt_img = cell(len,1);
for i = 1:len
    filt_img{i} = edgedetect_idv(img{i},0.1);
end

filt_img{1} = torgb(filt_img{1},'r');
filt_img{2} = torgb(filt_img{2},'g');
filt_img{3} = torgb(filt_img{3},'b');

show(filt_img);

final_img = filt_img{1}+filt_img{2}+filt_img{3};
figure;
imshow(final_img);