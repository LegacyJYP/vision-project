function img = todouble(img)
len = length(img);
for i=1:len
    img{i} = double(img{i})./255;
end