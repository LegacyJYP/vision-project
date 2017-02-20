function video = loadvideo(filename,frame)

v = VideoReader(filename);

%nframe = floor(v.Duration*v.FrameRate);
nframe= frame;
i=1;

video = zeros(nframe,v.Height,v.Width,3);
for i=1:nframe
    video(i,:,:,:) = readFrame(v);
end

