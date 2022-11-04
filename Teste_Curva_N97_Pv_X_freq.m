clear all;
close all;
warning ('off','all');
clc;

%%
% Curva para f = 100kHz
% Curva para B_max = 0,2T
% 
% % Add subfolders to search path
% 
% addpath('Datasources');
% 
% Check if core database was loaded
%     if isempty(Ferrite_N97)
%         Load material data
%         Material_N97_Table = readtable('Ferrite_N97.xlsx', 'Sheet',1);
% 
%         Save values to new variables
%         Material.Temperature = Material_N97_Table.Temperature;    % °C    
%         Material.VLosses = Material_N97_Table.VLosses;    % kW/m^3
%         
%         plot(Material_N97_Table.Temperature,Material_N97_Table.VLosses,'*')
% %      
%     end
% Interpolar a curva   
% Interp = scatteredInterpolant(Material.Temperature,Material.VLosses)
% Interp = fit(Material_N97_Table.Temperature,Material_N97_Table.VLosses,'poly3','Normalize','on');
% plot(Material.Temperature,Material.VLosses,'o')
% hold on
% grid on
% xlabel ('Temperature (°C)');
% ylabel ('Volumetric Losses (kW/m^3)');
% plot(Interp,'b');
% 
% clear data
% clear Material_N97_Table;

%% Perdas Volumétricas x Frequência
% Curva para B_max = 0,2T

load Curve_Pv_X_f

%Eixo x = Frequência
x_escalalog = logspace(1,3,100000)
x_escalalin = linspace(10,1000,100000)
x = interp1(x_escalalin',x_escalalog',Curve_Pv_X_f(:,1))

%Eixo y = Perdas volumétricas
y_escalalog = logspace(-1,4,100000)
y_escalalin = linspace(0.1,10000,100000)
y = interp1(y_escalalin',y_escalalog',Curve_Pv_X_f(:,2))

plot(x,y)
hold on
grid on
xlabel ('Frequency (kHz)');
ylabel ('Volumetric Losses (kW/m^3)');




% x_escalalog = logspace(log10(min(Curve_Pv_X_f(:,1))),log10(max(Curve_Pv_X_f(:,1))),10000)
% x_escalalin = linspace(min(Curve_Pv_X_f(:,1)),max(Curve_Pv_X_f(:,1)),10000)
% x = interp1(x_escalalin',x_escalalog',Curve_Pv_X_f(:,1))
% 
% y_escalalog = logspace(log10(min(Curve_Pv_X_f(:,2))),log10(max(Curve_Pv_X_f(:,2))),10000)
% y_escalalin = linspace(min(Curve_Pv_X_f(:,2)),max(Curve_Pv_X_f(:,2)),10000)
% y = interp1(y_escalalin',y_escalalog',Curve_Pv_X_f(:,2))


