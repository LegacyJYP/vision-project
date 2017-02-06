filename = input_filename;

len = length(filename);
img = cell(len,1);
for i = 1:len
    img{i} = imread(filename{i});
end

show(img);



