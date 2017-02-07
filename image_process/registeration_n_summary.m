close all;
clear;
load_images;
%filename len img
%img{2}

f1 = img{1};
w = img{2};
f2 = img{3};

g1 = normxcorr2(w,f1);
g2 = normxcorr2(w,f2);

gabs = abs(g1);
[ypeak, xpeak] = find(gabs == max(gabs(:)));
delta_y = ypeak - (size(w,1) -1);
delta_x = xpeak - (size(w,2) -1);
delta_y = -delta_y
delta_x = -delta_x
tform = maketform('affine', [1 0 0; 0 1 0; ...
    delta_x delta_y 1]);
figure;visreg(w,f1,tform);