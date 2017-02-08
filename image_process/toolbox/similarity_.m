%similarity
g1==0;
gw==0;
background = ~((g1==0) & (gw==0)); % 0 == background

norm_g1 = normalize_(g1);
norm_gw = normalize_(gw);

sim = inverse_(abs(norm_g1 - norm_gw)).*background;
figure;
imshow(sim)

