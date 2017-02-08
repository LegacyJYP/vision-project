function [gw, g1] = registeration_newimage(w, f1)
%% find common
c = normxcorr2(w,f1);

cabs = abs(c);
[ypeak, xpeak] = find(cabs == max(cabs(:)));
delta_y = ypeak - (size(w,1) -1);
delta_x = xpeak - (size(w,2) -1);
delta_y = -delta_y;
delta_x = -delta_x;

%% new image
bottom_xdata = [delta_x delta_x+size(f1,2)-1];
bottom_ydata = [delta_y delta_y+size(f1,1)-1];
bottom_image = f1;

siz_x = [diff(bottom_xdata)+1, bottom_xdata(2)];
siz_y = [diff(bottom_ydata)+1, bottom_ydata(2)];

g1 = zeros(max(siz_y),max(siz_x));
gw = zeros(max(siz_y),max(siz_x));

if bottom_xdata(1)>0
    real_bottom_x = bottom_xdata;
    
    real_gw_x = [1 size(w,2)];
else
    real_bottom_x = [1 diff(bottom_xdata)+1];
    
    real_gw_x = [abs(bottom_xdata(1))+1 ...
        size(w,2)+abs(bottom_xdata(1))+1];
end
    
if bottom_ydata(1)>0
    real_bottom_y = bottom_ydata;
    
    real_gw_y = [1 size(w,1)];
else
    real_bottom_y = [1 diff(bottom_ydata)+1];
    
    real_gw_y = [abs(bottom_ydata(1))+1 ...
        size(w,1)+abs(bottom_ydata(1))+1];
end

g1(real_bottom_y(1):real_bottom_y(2), real_bottom_x(1):real_bottom_x(2)) ...
    = bottom_image(1:end,1:end);
gw(real_gw_y(1):real_gw_y(2), real_gw_x(1):real_gw_x(2)) ...
    = w(:,:);