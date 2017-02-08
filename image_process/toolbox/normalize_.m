function img = normalize_(img)
img = (img-sum(img(:))/numel(img(:)))/std(img(:));