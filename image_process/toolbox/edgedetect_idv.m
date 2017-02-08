function img = edgedetect_idv(img,sobel_filt)
%filt
img = sobel(img, sobel_filt);