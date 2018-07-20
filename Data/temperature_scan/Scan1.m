files=dir ('*.csv');
nfiles=numel(files);

temps=[30 32 35 40 45 50 55 60 65 70];

figure(1)
for i=1:nfiles
data=Imp_cell30(files(i).name);
plot (data(:, 1), data(:, 2))
hold on
title('raw')
xlabel('voltage [V]')
ylabel('value [V]')
end
legend ('30', '32', '35', '40', '45', '50', '55', '60', '65', '70')

gaussian = fittype('o+a*exp(-((x-b)^2)/(2*c^2))');%, 'independent','x', 'coefficients',{'a','b','c'});

coefficients=ones(nfiles, 4);
coefficients_resid=ones(nfiles, 4);

%figure
for i=1:nfiles
    
data=Imp_cell30(files(i).name);
test=data([1:300,700:1000],:);
flin=fit(test(:, 1), test(:, 2), 'poly3');
coeffs_lin=coeffvalues(flin);
x=data(:,1);
normf_lin=coeffs_lin(1)*x.^3+coeffs_lin(2)*x.^2+coeffs_lin(3)*x+coeffs_lin(4);
normval=data(:,2)-normf_lin;
%plot (f, data(:, 1), data(:,2))

figure(2)
plot (data(:, 1), normval)
hold on
title('overlapped')
xlabel('voltage [V]')
ylabel('value [V]')

figure
fgauss=fit(data(:, 1), normval, gaussian, 'StartPoint', [-0.3 100 5 0]);
subplot(2, 1, 1)
plot (fgauss, data(:, 1), normval)
axis([85 115 -0.3 0.05])
title('fit')
xlabel('voltage [V]')
ylabel('value [V]')

coeff_gauss=coeffvalues(fgauss);
coefficients(i, 1)=coefficients(i, 1)*coeff_gauss(1);
coefficients(i, 2)=coefficients(i, 2)*coeff_gauss(2);
coefficients(i, 3)=coefficients(i, 3)*abs(coeff_gauss(3));
coefficients(i, 4)=coefficients(i, 4)*coeff_gauss(4);
normf_gauss=coeff_gauss(4)+coeff_gauss(1)*exp(-((x-coeff_gauss(2)).^2)/(2*coeff_gauss(3).^2));
residual=normf_gauss-normval;
fgauss_resid=fit(data(:, 1), residual, gaussian, 'StartPoint', [0.05 100 0.5 0]);
subplot(2, 1, 2)
%plot(data(:, 1), residual)
plot (fgauss_resid, data(:, 1), residual)
axis([85 115 -0.02 0.04])
title('residual')
xlabel('voltage [V]')
ylabel('value [V]')

coeff_gauss_resid=coeffvalues(fgauss_resid);
coefficients_resid(i, 1)=coefficients_resid(i, 1)*coeff_gauss_resid(1);
coefficients_resid(i, 2)=coefficients_resid(i, 2)*coeff_gauss_resid(2);
coefficients_resid(i, 3)=coefficients_resid(i, 3)*abs(coeff_gauss_resid(3));
coefficients_resid(i, 4)=coefficients_resid(i, 4)*coeff_gauss_resid(4);


%plot(test(:, 1), test(:, 2), 'red', 'LineWidth', 3, 'LineStyle', 'none', 'Marker', 'o')
%title('normalised')
end

%%
figure
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

figure
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

