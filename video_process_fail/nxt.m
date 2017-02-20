function [video, i] = nxt(video,i)
i=i+1;
imshow(squeeze(video(i,:,:,:)))
end