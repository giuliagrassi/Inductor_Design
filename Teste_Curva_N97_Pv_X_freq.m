clear all;
close all;
warning ('off','all');
clc;

addpath('Datasources');

%% Perdas Volumétricas x Frequência
% Curva para B_max = 0.2T

load Curve_Pv_X_f

% Eixo x = Frequência
x_escalalog = logspace(1,3,100000);
x_escalalin = linspace(10,1000,100000);
x = interp1(x_escalalin',x_escalalog',Curve_Pv_X_f(:,1));

% Eixo y = Perdas volumétricas
y_escalalog = logspace(-1,4,100000);
y_escalalin = linspace(0.1,10000,100000);
y = interp1(y_escalalin',y_escalalog',Curve_Pv_X_f(:,2));

% Mostrar gráfico
plot(x,y);
hold on;
grid on;
xlabel ('Frequency (kHz)');
ylabel ('Volumetric Losses (kW/m^3)');


%% Variar frequência --> Encontrar Pv

% Definir range de frequências
%Target.f_min = 100e3;	% Min frequency - Hz
%Target.f_max = 300e3;	% Max frequency - Hz

Target.f_min = 100;	% Min frequency - kHz
Target.f_max = 300;	% Max frequency - kHz

% Encontrar perdas volumétricas para o range de frequências
%Range_f = find(Target.f_min <= x <= Target.f_max);  
Range_f = linspace(Target.f_min,Target.f_max,11);  
%Range_f = Target.f_min:100:Target.f_max
%Pv_range = y(Range_f);

for i = Target.f_min:Target.f_max
    Range_Pv = interp1(x,y,Range_f);
    Range_Pv = Range_Pv*1e3;
    i = i+1;
end

%SIMPLES - 1 PONTO
% x1 = 100
% y_curve = interp1(x,y,x1)
    
%% Cálculo de Perdas no Núcleo (Pv x Ve)

% CORE DATABASE %

Core_Table = readtable('Cores_New.xlsx', 'Sheet', 1);

% Save values to new variables
Cores.Name = string(Core_Table.Core');          % String
% Cores.AeAw = Core_Table.AeAw_mm_4_' * 1e-12;    % m^4    
% Cores.Ae = Core_Table.Ae_mm_2_' * 1e-6;         % m^2
% Cores.Aw = Core_Table.Aw_mm_2_' * 1e-6;         % m^2;
% Cores.le = Core_Table.le_mm_' * 1e-3;           % m;
% Cores.lt = Core_Table.lt_mm_' * 1e-3;           % m
Cores.Ve = Core_Table.Ve_mm_3_' * 1e-9;           % m^3

% Clear data
clear Core_Table;

%% Cálculo Perdas Volumétricas para frequência fixa

f_fixa = 100;
Pv = interp1(x,y,f_fixa);

% Criar matriz para armazenar valores
Loss.Values = zeros(1, size(Cores.Ve, 2));

% Perda Volumétrica fixa para uma frequência
% Variando apenas o volume do núcleo de acordo com tabela
Loss.Values = Pv*Cores.Ve;


%% Cálculo Perdas Volumétricas para frequência variando

for i = Target.f_min:Target.f_max
    Range_Pv = interp1(x,y,Range_f);
    Range_Pv = Range_Pv*1e3;
    Core.Loss = Range_Pv'*Cores.Ve
    i = i+1;
end

% Batendo com rotina do MathCAD sem considerar a temperatura



