%%

clear all;
clc;
close all;

%% Importação dos dados das curvas do datasheet

load Data_25mT.mat
load Data_50mT.mat
load Data_100mT.mat
load Data_200mT.mat
load Data_300mT.mat

%% Ajuste dos pontos 

% Eixo x = Frequência
x_escalalog = logspace(1,3,100000);
x_escalalin = linspace(10,1000,100000);

% Eixo y = Perdas volumétricas
y_escalalog = logspace(-1,4,100000);
y_escalalin = linspace(0.1,10000,100000);

% Interpolação dos pontos - *1000 para obter em Hz e W/m3
x25 = interp1(x_escalalin',x_escalalog',Data_25mT(:,1))*1000;
y25 = interp1(y_escalalin',y_escalalog',Data_25mT(:,2))*1000;

x50 = interp1(x_escalalin',x_escalalog',Data_50mT(:,1))*1000;
y50 = interp1(y_escalalin',y_escalalog',Data_50mT(:,2))*1000;

x100 = interp1(x_escalalin',x_escalalog',Data_100mT(:,1))*1000;
y100 = interp1(y_escalalin',y_escalalog',Data_100mT(:,2))*1000;

x200 = interp1(x_escalalin',x_escalalog',Data_200mT(:,1))*1000;
y200 = interp1(y_escalalin',y_escalalog',Data_200mT(:,2))*1000;

x300 = interp1(x_escalalin',x_escalalog',Data_300mT(:,1))*1000;
y300 = interp1(y_escalalin',y_escalalog',Data_300mT(:,2))*1000;

clear x_escalalog x_escalalin y_escalalog y_escalalin;

%%

figure;
hold on;
grid on;
plot (x25,y25);
plot (x50,y50);
plot (x100,y100);
plot (x200,y200);
plot (x300,y300);
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
%xlim([10^1 10^3]);
%ylim([10^-1 10^4]); 
xlabel ('Frequency (Hz)');
ylabel ('Relative Core Losses (W/m^3)');
title ('Relative Core Losses X Frequency - N97');
legend ({'25mT', '50mT', '100mT', '200mT', '300mT'});

%% Fit: '25mT'.

% Set up fittype and options.
ft = fittype( 'k*x^a*0.025^b', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';

% Fit model to data.
[fitresult, ~] = fit( x25, y25, ft, opts );

% % Plot fit with data.
% figure( 'Name', '25mT' );
% h = plot( fitresult, x25, y25 );
% legend( h, 'y25 vs. x25', '25mT', 'Location', 'SouthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'x25', 'Interpreter', 'none' );
% ylabel( 'y25', 'Interpreter', 'none' );
% % set(gca, 'XScale', 'log');
% % set(gca, 'YScale', 'log');
% grid on

% Coeficientes de Steinmetz extraídos com Fit Curve Tool
r1 = coeffvalues(fitresult);
a1 = r1(1);
b1 = r1(2)
k1 = r1(3);

clear ft;
clc
%% Fit: '50mT'.

% Set up fittype and options.
ft = fittype( 'k*x^a*0.05^b', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';

% Fit model to data.
[fitresult, ~] = fit( x50, y50, ft, opts );

% % Plot fit with data.
% figure( 'Name', '50mT' );
% h = plot( fitresult, x50, y50 );
% legend( h, 'y50 vs. x50', '50mT', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'x50', 'Interpreter', 'none' );
% ylabel( 'y50', 'Interpreter', 'none' );
% set(gca, 'XScale', 'log');
% set(gca, 'YScale', 'log');
% grid on

% Coeficientes de Steinmetz extraídos com Fit Curve Tool
r2 = coeffvalues(fitresult);
a2 = r2(1);
b2 = r2(2)
k2 = r2(3);

clear ft;
clc
%% Fit: '100mT'.

% Set up fittype and options.
ft = fittype( 'k*x^a*0.1^b', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';

% Fit model to data.
[fitresult, gof] = fit( x100, y100, ft, opts );

% % Plot fit with data.
% figure( 'Name', '100mT' );
% h = plot( fitresult, x100, y100 );
% legend( h, 'y100 vs. x100', '100mT', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'x100', 'Interpreter', 'none' );
% ylabel( 'y100', 'Interpreter', 'none' );
% set(gca, 'XScale', 'log');
% set(gca, 'YScale', 'log');
% grid on

% Coeficientes de Steinmetz extraídos com Fit Curve Tool
r3 = coeffvalues(fitresult);
a3 = r3(1);
b3 = r3(2)
k3 = r3(3);

clear ft;
clc
%% Fit: '200mT'.

% Set up fittype and options.
ft = fittype( 'k*x^a*0.2^b', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';

% Fit model to data.
[fitresult, gof] = fit( x200, y200, ft, opts );

% % Plot fit with data.
% figure( 'Name', '200mT' );
% h = plot( fitresult, x200, y200 );
% legend( h, 'y200 vs. x200', '200mT', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'x200', 'Interpreter', 'none' );
% ylabel( 'y200', 'Interpreter', 'none' );
% set(gca, 'XScale', 'log');
% set(gca, 'YScale', 'log');
% grid on

% Coeficientes de Steinmetz extraídos com Fit Curve Tool
r4 = coeffvalues(fitresult);
a4 = r4(1);
b4 = r4(2)
k4 = r4(3);

clear ft;
clc
%% Fit: '300mT'.

% Set up fittype and options.
ft = fittype( 'k*x^a*0.3^b', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';

% Fit model to data.
[fitresult, gof] = fit( x300, y300, ft, opts );

% % Plot fit with data.
% figure( 'Name', '300mT' );
% h = plot( fitresult, x300, y300 );
% legend( h, 'y300 vs. x300', '300mT', 'Location', 'NorthEast', 'Interpreter', 'none' );
% % Label axes
% xlabel( 'x300', 'Interpreter', 'none' );
% ylabel( 'y300', 'Interpreter', 'none' );
% set(gca, 'XScale', 'log');
% set(gca, 'YScale', 'log');
% grid on

% Coeficientes de Steinmetz extraídos com Fit Curve Tool
r5 = coeffvalues(fitresult);
a5 = r5(1);
b5 = r5(2)
k5 = r5(3);

clear ft;
clc

%% Fit Curve 
% Superfície com dimensões x,y,z = frequência, fluxo magnético, perdas
% volumétricas, a partir dos coeficientes de Steinmetz de cada curva
% extraídos anteriormente

% % Coeficientes K 
% k_25 = fitresult1.k;
% k_50 = fitresult2.k;
% k_100 = fitresult3.k;
% k_200 = fitresult4.k;
% k_300 = fitresult5.k;
% 
% % Coeficientes Alpha
% a_25 = fitresult1.a;
% a_50 = fitresult2.a;
% a_100 = fitresult3.a;
% a_200 = fitresult4.a;
% a_300 = fitresult5.a;
% 
% % Coeficientes Beta
% b_25 = fitresult1.b;
% b_50 = fitresult2.b;
% b_100 = fitresult3.b;
% b_200 = fitresult4.b;
% b_300 = fitresult5.b;

% Vetor de frequências
f_range = 20e3:1:300e3;
% Vetor dos fluxo magnético de cada curva
B_range = [0.025 0.05 0.1 0.2 0.3];

% Matriz de cada coeficiente
k = [k1 k2 k3 k4 k5];
a = [a1 a2 a3 a4 a5];
b = [b1 b2 b3 b4 b5];

% Cálculo das perdas por Steinmetz Clássico
for B = 1:numel(B_range)
   for f = 1:numel(f_range)
        P(B,f) = k(B)*f_range(f)^a(B)*B_range(B)^b(B);  
   end
end
%P = k*x^a*y^b
% x = frequência
% y = fluxo magnético

%% Fit: 'Superfície'.
[xData, yData, zData] = prepareSurfaceData( f_range, B_range, P );

% Set up fittype and options.
ft = fittype( 'k*x^a*y^b', 'independent', {'x', 'y'}, 'dependent', 'z' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [1 0.5 0.5];

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Surface' );
h = plot( fitresult, [xData, yData], zData );
legend( h, 'Surface', 'Volumetric Losses (W/m^3) X Frequency (Hz) X Magnetic Flux (T)', 'Location', 'NorthEast' );
xlabel( 'Frequency (Hz)' );
ylabel( 'Magnetic Flux (T)' );
zlabel( 'Volumetric Losses (W/m^3)' );
grid on
% set(gca, 'XScale', 'log');
% set(gca, 'YScale', 'log');
% set(gca, 'ZScale', 'log');


