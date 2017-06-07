 % 170221 Tuesday
% 
%close all;
clear;
addpath(genpath('.'));
addpath('../png_sample/');

load_images;
%filename len img
%img{2}

f1 = img{1};
w = img{2};
f2 = img{3};

[gw g1] = registeration_newimage(w,f1);
%figure;
%imshow(gw)


seg = imread('segmented.png');

%fig1 = figure;
%imshow(seg);

%% fft

%img = zeros(1000,1000);
%img(400:600,200:800)=1;
%seg = img;
figure;
imshow(seg);
%seg = imread('chromosome.png');

degsum = [];
for deg = 1:180
    sum = direction_sum(seg,deg);
    
    degsum = [degsum;deg,sum];
    disp([num2str(deg),':',num2str(sum)]);
end

degsum(find(degsum==max(degsum(:,2)))-180)
%degsum(find(degsum==min(degsum(:,2)))-180)


function sum = direction_sum(img,deg)

rad = 2*pi * (deg/360);
a = fft2(img);
a = fftshift(a);
a = abs(a);

xsiz = size(a,2);
ysiz = size(a,1);

xmid = floor((xsiz+1)/2);
ymid = floor((ysiz+1)/2);
ylim = ysiz - ymid;

sum = 0;
for i = 0:(xsiz-xmid)
    if ceil(i*sin(rad)<=ylim)
        y = ceil(i*sin(rad))+ymid;
        x = i+xmid;
        hold on;
        plot(x,(ysiz-y),'r--o');
        
        
        sum = sum + a(y,x);
    else
        break;
    end
end
drawnow;

end