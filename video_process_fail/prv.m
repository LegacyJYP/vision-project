function [video, i] = prv(video,i)
i=i-1;
imshow(squeeze(video(i,:,:,:)))
end