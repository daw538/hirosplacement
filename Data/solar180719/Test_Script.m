files=dir('*.txt');
nfiles=numel(files);

for i=1:nfiles
data=ImportData(files(i).name);
figure
plot (data.wav, data.val)
title(files(i).name, 'Interpreter','none')
axis([580 600 -0.2 0.2])
end

