function tform = registeration(w, f)

g = normxcorr2(w,f);

gabs = abs(g);
[ypeak, xpeak] = find(gabs == max(gabs(:)));
delta_y = ypeak - (size(w,1) -1);
delta_x = xpeak - (size(w,2) -1);
delta_y = -delta_y;
delta_x = -delta_x;

tform=maketform('affine',[1 0 0; 0 1 0; ...
    delta_x delta_y 1]);