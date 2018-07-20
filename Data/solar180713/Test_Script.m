files=dir('*.csv');
nfiles=numel(files);

for i=1:4
data=ImportData(files(i).name);
pick=find(data.val(data.wav==589.5))
figure
plot (data.wav, data.val)
title(files(i).name, 'Interpreter','none')
%axis([580 600 -0.2 0.2])
end

