%% - combined fit

%1 for low wavelength line, 0 for high wavelength line
low_wavelength=1;

if low_wavelength==1 %select low wavelength line
    
    files=dir ('*-*.csv');
    fit_start=[0.05 90 2 0 0 -0.01 3.3];
    
else %select high wavelength line
    
    files=dir ('*+*.csv');
    fit_start=[0.05 100 2 0 0 -0.01 3.3];
        
end

nfiles=numel(files);

gaussian = fittype('o+a*exp(-((x-b)^2)/(2*c^2))');      %define gaussian fit
gaussian3 = fittype('p1*x.^3+p2*x.^2+p3*x+p4-a*exp(-((x-b)^2)/(2*c^2))');      %define gaussian fit

coefficients_comb=ones(nfiles, 7);               %storage for fit coefficients
coefficients_comb_resid=ones(nfiles, 4);

for i=1:nfiles
    
    data=Imp_cell30(files(i).name);     %import data
    
    figure(1)
    plot (data(:, 1), data(:, 2))       %plot all raw data
    hold on

    figure
    fgauss3=fit(data(:, 1), data(:, 2), gaussian3, 'StartPoint', fit_start);
    subplot(2, 1, 1)
    plot (fgauss3, data(:, 1), data(:, 2))      %plot gaussian fit to corrected data
    %axis([85 115 2.4 2.9])
    title(files(i).name)
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
    %fgauss3_resid=fit(data(:, 1), residual_gauss3, gaussian, 'StartPoint', [-0.05 100 0.5 0]);  %fit gaussian to residuals
    subplot(2, 1, 2)
    plot (data(:, 1), residual_gauss3)   %plot gaussian fit to residuals
    %axis([85 115 -0.04 0.02])
    title('residual')
    xlabel('voltage [V]')
    ylabel('value [V]')

    %{
    coeff_gauss3_resid=coeffvalues(fgauss3_resid);        %save coefficients of gaussian fit to residuals
    coefficients_comb_resid(i, 1)=coefficients_comb_resid(i, 1)*coeff_gauss3_resid(1);
    coefficients_comb_resid(i, 2)=coefficients_comb_resid(i, 2)*coeff_gauss3_resid(2);
    coefficients_comb_resid(i, 3)=coefficients_comb_resid(i, 3)*abs(coeff_gauss3_resid(3));
    coefficients_comb_resid(i, 4)=coefficients_comb_resid(i, 4)*coeff_gauss3_resid(4);
    %}

end

figure(1)
legend ( '30', '35', '40', '45', '50', '55', '60', '65', '70', '75', '80', '85', '90', '95')
title ('raw')