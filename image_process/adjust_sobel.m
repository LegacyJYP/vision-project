function [one_sobel, two_edge]= adjust_sobel(img, threshold)
adjust_sobel
one_sobel = sobel(img, threshold);
two_edge = edge(gray_img);
end