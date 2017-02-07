function show(img)

len = length(img);
n = ceil(len.^0.5);
figure;
for i = 1:len
    subplot(n,n,i);
    imshow(img{i});
end