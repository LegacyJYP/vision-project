fname = 'fp_avg.png';
img = imread(fname);

mask = zeros(size(img));
xcoordper = [0.5,0.6];
ycoordper = [0.01,1];

xcoord = ceil(size(mask,2)*xcoordper);
ycoord = ceil(size(mask,1)*ycoordper);
mask(ycoord(1):ycoord(2),xcoord(1):xcoord(2)) = 1;

% param
lambda = .1;
iterations = 200;
rad = 15;

% perform segmentation
[seg] = activecontour(img,mask,iterations);

% display results
subplot(2,2,1)
imagesc(img); axis image; colormap gray;
title('The original image');

subplot(2,2,2)
imagesc(mask); axis image; colormap gray;
title('The initialization');

subplot(2,2,3)
imagesc(seg); axis image; colormap gray;
title('The final segmenatation output');

subplot(2,2,4)
imagesc(img); axis image; colormap gray;
hold on;
contour(seg,'r','linewidth',1);
hold off;
title('The image with the segmentation shown in red');
