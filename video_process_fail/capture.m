filename = 'ch02 Rup ch1.mpg';
video = loadvideo(filename, 20);

i=15;

[video,i] = nxt(video,i);
%[video,i] = prv(video,i);

%113 127