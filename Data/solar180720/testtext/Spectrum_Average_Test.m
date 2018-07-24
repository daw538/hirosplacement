files=dir('*test*.txt');
nfiles=numel(files);

figure(1)

for i=1:nfiles
    
    data=ImportSpect(files(i).name);
    
    plot(data.wavelength, data.intensity)
    hold on
    
end

figure(1)
axis ([585 595 -1 2])
title ('plot all data')

avg=ones(3648, 2);

avg(:, 1)=table2array(data(:, 1));

for j=2320:2420
    
    element=0;
    
    for k=1:nfiles
        
        data=ImportSpect(files(i).name);
        
        element=element+table2array(data(j, 2));
        
    end
    
    avg(j, 2)=avg(j, 2)*element/nfiles;
    
end

%%

figure
plot(avg(:, 1), avg(:, 2))
axis([585 595 -1 2])