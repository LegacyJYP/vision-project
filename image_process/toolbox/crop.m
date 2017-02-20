function img = crop(img)
len = length(img);
for i = 1:len
    img{i} = crop_idv(img{i});
end
