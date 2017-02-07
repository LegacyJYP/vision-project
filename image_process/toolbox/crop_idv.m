function img = crop_idv(img)
crop_y=50:1000;
crop_x=500:1200;

img = img(crop_y, crop_x);