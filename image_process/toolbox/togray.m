function img = togray(img)
len = length(img);
for i=1:len
    img{i} = rgb2gray(img{i});
end