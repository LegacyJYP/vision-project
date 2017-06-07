function show_with_color(top_image, bottom_image, tform)
%% top ? ??
if nargin == 2
    tform = maketform('affine', [1 0 0; 0 1 0; 0 0 1]);
end
[bottom_image, bottom_xdata, bottom_ydata] = imtransform(bottom_image,tform);
[M,N] = size(top_image);
top_xdata = [1 N];
top_ydata = [1 M];

figure;
top_alpha = 0.5;

bottom_image = torgb(bottom_image,'r');

h_bottom = imshow(bottom_image, 'XData', bottom_xdata, ...
    'YData', bottom_ydata);
hold on;

h_top = imshow(top_image, 'Xdata', top_xdata, ...
    'Ydata', top_ydata);
set(h_top, 'AlphaData', top_alpha);
axis auto