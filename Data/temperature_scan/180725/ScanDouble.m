%% - zeeman split data

files=dir ('*.csv');        %load files
nfiles=numel(files);

two_gaussian = fittype('p1*x.^3+p2*x.^2+p3*x+p4-a*exp(-((x-b)^2)/(2*c^2))-a2*exp(-((x-b2)^2)/(2*c2^2))');      %define gaussian fit

%coefficients=ones(nfiles, 4);               %storage for fit coefficients
%coefficients_resid=ones(nfiles, 4);

for i=1:nfiles

    figure(1)
    data=Imp_cell30(files(i).name);     %import data
    plot (data(:, 1), data(:, 2))       %plot all raw data
    hold on

    ftwo_gauss=fit(data(:, 1), data(:, 2), two_gaussian, 'StartPoint', [0.05 0.05 89.5 100 2 2 0 0 -0.01 3.3]);

    figure
    plot (ftwo_gauss, data(:, 1), data(:, 2))

end

figure (1)
title('raw')
xlabel('voltage [V]')
ylabel('value [V]')
legend ('30', '35', '40', '45', '50', '55', '60', '65', '70', '75')