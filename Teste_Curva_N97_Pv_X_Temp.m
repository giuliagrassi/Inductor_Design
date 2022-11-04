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
% 
%      
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

load Data003
escalalog = logspace(-1,4,10000)
escalalin = linspace(0.1,100000,10000)
x = interp1(escalalin',escalalog',Data003(:,2))

plot(x)
hold on
grid on
xlabel ('Temperature (°C)');
ylabel ('Volumetric Losses (kW/m^3)');

% load Data002
% escalalog = logspace(log10(min(Data002(:,1))),log10(max(Data002(:,1))),100)
% escalalin = linspace(min(Data002(:,1)),max(Data002(:,1)),100)
% x = interp1(escalalin',escalalog',Data002(:,2))


