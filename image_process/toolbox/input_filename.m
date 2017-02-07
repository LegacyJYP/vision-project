function filename = input_filename()
filename= {%'ch02 Rup ch1';
%'ch02 normal ch1';
%'ch02 Lup ch1';
'ch01 Rup ch1';
'ch01 normal ch1';
'ch01 Lup ch1'};

ext = '.png';

len = length(filename);

for i = 1:len
    filename{i} = [filename{i},ext];
end