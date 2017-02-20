function visreg(fref, f, tform, layer, alpha)
if nargin<5
    alpha = 0.5;
end

if nargin < 4
    layer = 'top';
end

[g, g_xdata, g_ydata] = imtransform(f,tform);
[M,N] = size(fref);
fref_xdata = [1 N];
fref_ydata = [1 M];

if strcmp(layer, 'top')
    top_image = g;
    top_xdata = g_xdata;
    top_ydata = g_ydata;
    
    top_alpha = imtransform(alpha * ones(size(f)), tform);
    
    bottom_image = fref;
    bottom_xdata = fref_xdata;
    bottom_ydata = fref_ydata;
else
    top_image = fref;
    top_xdata = fref_xdata;
    top_apha = alpha;
    
    bottom_image =g;
    bottom_xdata = g_xdata;
    bottom_ydata = g_ydata;
end

h_bottom = imshow(bottom_image, 'XData', bottom_xdata, ...
    'YData', bottom_ydata);
hold on;

h_top = imshow(top_image, 'Xdata', top_xdata, ...
    'Ydata', top_ydata);
set(h_top, 'AlphaData', top_alpha);

axis auto

if nargout>0
    h = [h_bottom, h_top];
end
    