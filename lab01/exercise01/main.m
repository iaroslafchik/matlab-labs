% =========================================================
% main.m — ДПФ, только сохранение графиков
% =========================================================

clear;
clc;
close all;

%% Параметры

Fs = 1000;
L  = 2048;
dt = 1/Fs;

t = (0:L-1) * dt;

N = 4;
a = 2;

Omega0 = 2*pi*50;
phi0   = pi/6;

H = double(t >= 0);

%% Сигналы

x1 = (1/factorial(N-1)) .* (t.^(N-1)) .* exp(-a*t) .* H;

eps_val = 1e-6;
x2 = (1 ./ (cos(Omega0*t + phi0) + eps_val)) .* H;

noise = 0.3 * randn(size(t));
x3 = H .* cos(Omega0*t) + noise;

%% ДПФ

X1 = fft(x1);
X2 = fft(x2);
X3 = fft(x3);

A1 = abs(X1)/L;
A2 = abs(X2)/L;
A3 = abs(X3)/L;

f = Fs*(0:L/2-1)/L;

%% Создание фигуры (не показывается)

fig = figure('Visible','off','Name','ДПФ','NumberTitle','off');

subplot(3,2,1);
plot(t, x1); grid on;
title('x1(t)');

subplot(3,2,2);
plot(f, A1(1:L/2)); grid on;
title('|X1(f)|');

subplot(3,2,3);
plot(t, x2); grid on;
title('x2(t)');

subplot(3,2,4);
plot(f, A2(1:L/2)); grid on;
title('|X2(f)|');

subplot(3,2,5);
plot(t, x3); grid on;
title('x3(t)');

subplot(3,2,6);
plot(f, A3(1:L/2)); grid on;
title('|X3(f)|');

%% Сохранение

exportgraphics(fig, 'dft_result.png', 'Resolution', 300);

close(fig);

disp('Графики сохранены в dft_result.png');
