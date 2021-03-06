%% - two-stage fit

files=dir ('*cell*.csv');        %load files
nfiles=numel(files);

gaussian = fittype('o+a*exp(-((x-b)^2)/(2*c^2))');      %define gaussian fit

coefficients=ones(nfiles, 4);               %storage for fit coefficients
coefficients_resid=ones(nfiles, 4);

for i=1:nfiles

    figure(1)
    data=Imp_cell30(files(i).name);     %import data
    plot (data(:, 1), data(:, 2))       %plot all raw data
    hold on

    test=data([1:300,700:1000],:);                  %define region for poly3 fit - cut out absorption line
    flin=fit(test(:, 1), test(:, 2), 'poly3');      %3rd order fit
    coeffs_lin=coeffvalues(flin);                   %save coefficients of ploy3 fit
    x=data(:,1);
    normf_lin=coeffs_lin(1)*x.^3+coeffs_lin(2)*x.^2+coeffs_lin(3)*x+coeffs_lin(4);      
    normval=data(:,2)-normf_lin;                    %correct data to extract absorption line

    figure(2)
    plot (data(:, 1), normval)                      %plot corrected data
    hold on

    figure
    fgauss=fit(data(:, 1), normval, gaussian, 'StartPoint', [-0.3 100 5 0]); %fit gaussian to corrected data      
    subplot(2, 1, 1)
    plot (fgauss, data(:, 1), normval)      %plot gaussian fit to corrected data
    %axis([85 115 -0.3 0.05])
    title('fit')
    xlabel('voltage [V]')
    ylabel('value [V]')

    coeff_gauss=coeffvalues(fgauss);        %save coefficients of gaussian fit to corrected data
    coefficients(i, 1)=coefficients(i, 1)*coeff_gauss(1);
    coefficients(i, 2)=coefficients(i, 2)*coeff_gauss(2);
    coefficients(i, 3)=coefficients(i, 3)*abs(coeff_gauss(3));
    coefficients(i, 4)=coefficients(i, 4)*coeff_gauss(4);

    normf_gauss=coeff_gauss(4)+coeff_gauss(1)*exp(-((x-coeff_gauss(2)).^2)/(2*coeff_gauss(3).^2));
    residual=normval-normf_gauss;           %calculate residuals to extract pimple
    fgauss_resid=fit(data(:, 1), residual, gaussian, 'StartPoint', [-0.05 100 0.5 0]);  %fit gaussian to residuals
    subplot(2, 1, 2)
    plot (fgauss_resid, data(:, 1), residual)   %plot gaussian fit to residuals
    %axis([85 115 -0.02 0.04])
    title('residual')
    xlabel('voltage [V]')
    ylabel('value [V]')

    coeff_gauss_resid=coeffvalues(fgauss_resid);        %save coefficients of gaussian fit to residuals
    coefficients_resid(i, 1)=coefficients_resid(i, 1)*coeff_gauss_resid(1);
    coefficients_resid(i, 2)=coefficients_resid(i, 2)*coeff_gauss_resid(2);
    coefficients_resid(i, 3)=coefficients_resid(i, 3)*abs(coeff_gauss_resid(3));
    coefficients_resid(i, 4)=coefficients_resid(i, 4)*coeff_gauss_resid(4);

end

figure (1)
title('raw')
xlabel('voltage [V]')
ylabel('value [V]')
legend ('30', '32', '35', '40', '45', '50', '55', '60', '65', '70')

figure (2)
title('overlapped')
xlabel('voltage [V]')
ylabel('value [V]')
legend ('30', '32', '35', '40', '45', '50', '55', '60', '65', '70')


%% - combined fit

files=dir ('*cell*.csv');        %load files
nfiles=numel(files);

gaussian3 = fittype('p1*x.^3+p2*x.^2+p3*x+p4-a*exp(-((x-b)^2)/(2*c^2))');      %define gaussian fit

coefficients_comb=ones(nfiles, 7);               %storage for fit coefficients
coefficients_comb_resid=ones(nfiles, 4);

for i=1:nfiles
    
    data=Imp_cell30(files(i).name);     %import data

    figure
    fgauss3=fit(data(:, 1), data(:, 2), gaussian3, 'StartPoint', [0.3 100 2 0 0 -0.005 3.3]);
    subplot(2, 1, 1)
    plot (fgauss3, data(:, 1), data(:, 2))      %plot gaussian fit to corrected data
    axis([85 115 2.4 2.9])
    title('combined fit')
    xlabel('voltage [V]')
    ylabel('value [V]')

    coeff_gauss3=coeffvalues(fgauss3);        %save coefficients of gaussian fit to corrected data
    coefficients_comb(i, 1)=coefficients_comb(i, 1)*coeff_gauss3(1);
    coefficients_comb(i, 2)=coefficients_comb(i, 2)*coeff_gauss3(2);
    coefficients_comb(i, 3)=coefficients_comb(i, 3)*coeff_gauss3(3);
    coefficients_comb(i, 4)=coefficients_comb(i, 4)*coeff_gauss3(4);
    coefficients_comb(i, 5)=coefficients_comb(i, 5)*coeff_gauss3(5);
    coefficients_comb(i, 6)=coefficients_comb(i, 6)*coeff_gauss3(6);
    coefficients_comb(i, 7)=coefficients_comb(i, 7)*coeff_gauss3(7);

    x=data(:, 1);
    normf_gauss3=coeff_gauss3(4)*x.^3+coeff_gauss3(5)*x.^2+coeff_gauss3(6)*x+coeff_gauss3(7)-coeff_gauss3(1)*exp(-((x-coeff_gauss3(2)).^2)/(2*coeff_gauss3(3)^2));
    residual_gauss3=data(:, 2)-normf_gauss3;
    fgauss3_resid=fit(data(:, 1), residual_gauss3, gaussian, 'StartPoint', [-0.05 100 0.5 0]);  %fit gaussian to residuals
    subplot(2, 1, 2)
    plot (fgauss3_resid, data(:, 1), residual_gauss3)   %plot gaussian fit to residuals
    axis([85 115 -0.04 0.02])
    title('residual')
    xlabel('voltage [V]')
    ylabel('value [V]')

    coeff_gauss3_resid=coeffvalues(fgauss3_resid);        %save coefficients of gaussian fit to residuals
    coefficients_comb_resid(i, 1)=coefficients_comb_resid(i, 1)*coeff_gauss3_resid(1);
    coefficients_comb_resid(i, 2)=coefficients_comb_resid(i, 2)*coeff_gauss3_resid(2);
    coefficients_comb_resid(i, 3)=coefficients_comb_resid(i, 3)*abs(coeff_gauss3_resid(3));
    coefficients_comb_resid(i, 4)=coefficients_comb_resid(i, 4)*coeff_gauss3_resid(4);

end

%% - plot fit coefficients

temps=[30 32 35 40 45 50 55 60 65 70];      %temperatures

figure                          %plot coefficients of gaussian fit to corrected data
subplot(2, 2, 1)
plot(temps, coefficients(:, 1))
title ('main - height')
xlabel('temperature [dC]')
ylabel('value [V]')
subplot(2, 2, 2)
plot(temps, coefficients(:, 2))
title ('main - x-position')
xlabel('temperature [dC]')
ylabel('voltage [V]')
subplot(2, 2, 3)
plot(temps, coefficients(:, 3))
title ('main - width')
xlabel('temperature [dC]')
ylabel('voltage [V]')
subplot(2, 2, 4)
plot(temps, coefficients(:, 4))
title ('main - y-offset')
xlabel('temperature [dC]')
ylabel('value [V]')

figure                          %plot coefficients of gaussian fit to residuals
subplot(2, 2, 1)
plot(temps, coefficients_resid(:, 1))
title ('resid - height')
xlabel('temperature [dC]')
ylabel('value [V]')
subplot(2, 2, 2)
plot(temps, coefficients_resid(:, 2))
title ('resid - x-position')
xlabel('temperature [dC]')
ylabel('voltage [V]')
subplot(2, 2, 3)
plot(temps, coefficients_resid(:, 3))
title ('resid - width')
xlabel('temperature [dC]')
ylabel('voltage [V]')
subplot(2, 2, 4)
plot(temps, coefficients_resid(:, 4))
title ('resid - y-offset')
xlabel('temperature [dC]')
ylabel('value [V]')

figure                          %plot coefficients of gaussian fit to corrected data
subplot(2, 2, 1)
plot(temps, -coefficients_comb(:, 1))
title ('main - height')
xlabel('temperature [dC]')
ylabel('value [V]')
subplot(2, 2, 2)
plot(temps, coefficients_comb(:, 2))
title ('main - x-position')
xlabel('temperature [dC]')
ylabel('voltage [V]')
subplot(2, 2, 3)
plot(temps, coefficients_comb(:, 3))
title ('main - width')
xlabel('temperature [dC]')
ylabel('voltage [V]')
subplot(2, 2, 4)
plot(temps, coefficients_comb(:, 7))
title ('main - y-offset')
xlabel('temperature [dC]')
ylabel('value [V]')

figure                          %plot coefficients of gaussian fit to residuals
subplot(2, 2, 1)

plot(temps, coefficients_comb_resid(:, 1))
title ('resid - height')
xlabel('temperature [dC]')
ylabel('value [V]')
subplot(2, 2, 2)
plot(temps, coefficients_comb_resid(:, 2))
title ('resid - x-position')
xlabel('temperature [dC]')
ylabel('voltage [V]')
subplot(2, 2, 3)
plot(temps, coefficients_comb_resid(:, 3))
title ('resid - width')
xlabel('temperature [dC]')
ylabel('voltage [V]')
subplot(2, 2, 4)
plot(temps, coefficients_comb_resid(:, 4))
title ('resid - y-offset')
xlabel('temperature [dC]')
ylabel('value [V]')


%% - zeeman split data

files_T=dir ('*zeeman*.csv');        %load files
files_exc=dir ('*zeeman_*.csv');

nfiles=numel(files_T)-numel(files_exc);

two_gaussian = fittype('p1*x.^3+p2*x.^2+p3*x+p4-a*exp(-((x-b)^2)/(2*c^2))-a2*exp(-((x-b2)^2)/(2*c2^2))');      %define gaussian fit

%coefficients=ones(nfiles, 4);               %storage for fit coefficients
%coefficients_resid=ones(nfiles, 4);

for i=1:nfiles

    figure(1)
    data=Imp_cell30(files(i).name);     %import data
    plot (data(:, 1), data(:, 2))       %plot all raw data
    hold on

    ftwo_gauss=fit(data(:, 1), data(:, 2), two_gaussian, 'StartPoint', [0.1 0.1 93 103 3 3 0 0 -0.005 3.3]);

    figure
    plot (ftwo_gauss, data(:, 1), data(:, 2))

end

figure (1)
title('raw')
xlabel('voltage [V]')
ylabel('value [V]')
legend ('30', '32', '35', '40', '45', '50', '55', '60', '65', '70')


%% - separated zeeman split data

files=dir ('*zeeman_-*.csv');        %load files
nfiles=numel(files);

gaussian3 = fittype('p1*x.^3+p2*x.^2+p3*x+p4-a*exp(-((x-b)^2)/(2*c^2))');      %define gaussian fit

%coefficients=ones(nfiles, 4);               %storage for fit coefficients
%coefficients_resid=ones(nfiles, 4);

for i=1:nfiles

    figure(1)
    data=Imp_cell30(files(i).name);     %import data
    plot (data(:, 1), data(:, 2))       %plot all raw data
    hold on

    fgauss3=fit(data(:, 1), data(:, 2), gaussian3, 'StartPoint', [0.05 94.5 3 0 0 -0.005 3.3]);

    figure
    plot (fgauss3, data(1:830, 1), data(1:830, 2))

end

figure (1)
title('raw')
xlabel('voltage [V]')
ylabel('value [V]')
%legend ('32', '35', '40', '45', '50', '55', '60', '65', '70', '75')

files=dir ('*zeeman_+*.csv');        %load files
nfiles=numel(files);

gaussian3 = fittype('p1*x.^3+p2*x.^2+p3*x+p4-a*exp(-((x-b)^2)/(2*c^2))');      %define gaussian fit

%coefficients=ones(nfiles, 4);               %storage for fit coefficients
%coefficients_resid=ones(nfiles, 4);

for i=1:nfiles

    figure(12)
    data=Imp_cell30(files(i).name);     %import data
    plot (data(:, 1), data(:, 2))       %plot all raw data
    hold on

    fgauss3=fit(data(1:830, 1), data(1:830, 2), gaussian3, 'StartPoint', [0.05 104.5 2 0 0 -0.015 3.3]);

    figure
    plot (fgauss3, data(:, 1), data(:, 2))

end

figure (12)
title('raw')
xlabel('voltage [V]')
ylabel('value [V]')
%legend ('32', '35', '40', '45', '50', '55', '60', '65', '70', '75')

%%
temp = [60 65 70 75];

depth_lo = [0.03265 0.05229 0.06709 0.07705];
width_lo = [1.823 1.519 1.489 1.775 ];

depth_hi = [0.02586 0.04578 0.06542 0.07382];
width_hi = [1.417 1.504 1.607 1.543];

figure
subplot (2, 1, 1)
plot(temp, depth_lo)
title ('depth lo')
subplot (2, 1, 2)
plot(temp, depth_hi)
title ('depth hi')

figure
subplot (2, 1, 1)
plot(temp, width_lo)
title ('width lo')
subplot (2, 1, 2)
plot(temp, width_hi)
title ('width  hi')

%%
figure
plot (coolingcurves.OvenTemp, coolingcurves.CellTemp)

fcool=fit(coolingcurves.OvenTemp, coolingcurves.CellTemp, 'poly2');

figure
subplot(2, 1, 1)
plot (fcool, coolingcurves.OvenTemp, coolingcurves.CellTemp)

x=coolingcurves.OvenTemp;
coeff_cool=coeffvalues(fcool);
resid_cool=coolingcurves.CellTemp-(coeff_cool(1)*x.^2+coeff_cool(2)*x+coeff_cool(3));

subplot(2, 1, 2)
plot(coolingcurves.OvenTemp, resid_cool);


figure
plot (heatingcurves.OvenTemp, heatingcurves.CellTemp)

fheat=fit(heatingcurves.OvenTemp, heatingcurves.CellTemp, 'poly2');

figure
subplot(2, 1, 1)
plot (fheat, heatingcurves.OvenTemp, heatingcurves.CellTemp)

x=heatingcurves.OvenTemp;
coeff_heat=coeffvalues(fheat);
resid_heat=heatingcurves.CellTemp-(coeff_heat(1)*x.^2+coeff_heat(2)*x+coeff_heat(3));

subplot(2, 1, 2)
plot(heatingcurves.OvenTemp, resid_heat);
