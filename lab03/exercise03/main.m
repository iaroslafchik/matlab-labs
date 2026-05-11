% =========================================================
% ЛР3 — Задание 3
% RLC полосовой фильтр (Band-pass)
% =========================================================

clear;
clc;
close all;

%% Дано

f0 = 1200;      % Гц
df = 500;       % полоса

w0 = 2*pi*f0;
Q = f0 / df;

%% Выбор параметров (задаём C, считаем L)

C = 100e-9;                          % 100 нФ
L = 1 / ((2*pi*f0)^2 * C);           % из резонанса
R = w0 * L / Q;                      % из добротности

fprintf('Параметры полосового фильтра:\n');
fprintf('L = %.6f H\n', L);
fprintf('C = %.10f F\n', C);
fprintf('R = %.4f Ohm\n', R);

%% Частотная ось

f = linspace(200, 3000, 6000);
w = 2*pi*f;

%% Передаточная функция (выход на R)

Z_R = R;
Z_L = 1j*w*L;
Z_C = 1./(1j*w*C);

H = Z_R ./ (Z_R + Z_L + Z_C);

H_mag = abs(H);

%% =========================================================
% АЧХ
% =========================================================

figure('Visible','off','Name','RLC Band-pass','NumberTitle','off');

plot(f, H_mag, 'LineWidth', 1.5);
grid on;

title('АЧХ RLC полосового фильтра');
xlabel('Частота (Гц)');
ylabel('|H(f)|');

hold on;
xline(f0, '--r', 'f_0');

%% Сохранение

exportgraphics(gcf, 'rlc_bandpass.png', 'Resolution', 300);
close(gcf);

disp('Готово: rlc_bandpass.png');

drawnow;
exit;
