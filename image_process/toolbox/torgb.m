function rgbimg = torgb(img, color)
switch(color)
    case 'r'
        i=1;
    case 'g'
        i=2;
    case 'b'
        i=3;
end
siz = size(img);
rgbimg = zeros(siz(1),siz(2),3);
rgbimg(:,:,i) = img(:,:);