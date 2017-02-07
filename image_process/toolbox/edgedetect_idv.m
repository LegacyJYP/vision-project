function img = edgedetect_idv(img,sobel_filt)
crop_y=50:1000;
crop_x=500:1200;


img = double(img)./255;

%gray
img= rgb2gray(img);
%crop
img = img(crop_y, crop_x);
%filt
img = sobel(img, sobel_filt);