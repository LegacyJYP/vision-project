filename = input_filename;

len = length(filename);
img = cell(len,1);
for i = 1:len
    img{i} = imread(filename{i});
end


%gray
img = togray(img);

% normalize
if isa(img{1},'uint8')
    img=todouble(img);
end

% visualize
% show(img);