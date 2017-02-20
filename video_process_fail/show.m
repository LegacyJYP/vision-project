function show(img,n)
figure;
for i=1:n^2
    subplot(n,n,i);
    imshow(img{i});
end

end