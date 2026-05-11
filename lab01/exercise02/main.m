% =========================================================
% Задание 2 (без Signal Processing Toolbox)
% =========================================================

clear;
clc;
close all;

%% Параметры

Fs = 5000;
L  = 4096;
t  = (0:L-1)/Fs;

f_sin = 50;
f_sq  = 120;
f_saw = 200;

%% Несущая и модуляция

f_mod = 50;
m_index = 0.7;

%% Сигналы

x_sin = sin(2*pi*f_sin*t);

% --- прямоугольный сигнал (без square) ---
x_sq = sign(sin(2*pi*f_sq*t));
x_sq(x_sq == 0) = 1;

% --- пилообразный сигнал (без sawtooth) ---
x_saw = 2*(t*f_saw - floor(t*f_saw + 0.5));

%% Амплитудная модуляция

mod_signal = 1 + m_index*sin(2*pi*f_mod*t);

am_sin = x_sin .* mod_signal;
am_sq  = x_sq  .* mod_signal;
am_saw = x_saw .* mod_signal;

%% FFT

X_sin = fft(x_sin);
X_sq  = fft(x_sq);
X_saw = fft(x_saw);

Xam_sin = fft(am_sin);
Xam_sq  = fft(am_sq);
Xam_saw = fft(am_saw);

%% Частоты

f = Fs*(0:L/2-1)/L;

%% Спектры

S_sin = abs(X_sin)/L;
S_sq  = abs(X_sq)/L;
S_saw = abs(X_saw)/L;

Sam_sin = abs(Xam_sin)/L;
Sam_sq  = abs(Xam_sq)/L;
Sam_saw = abs(Xam_saw)/L;

%% Графики (не показываются)

fig = figure('Visible','off','Name','Спектры','NumberTitle','off');

subplot(3,2,1);
plot(f, S_sin(1:L/2)); grid on;
title('Синус — спектр');

subplot(3,2,2);
plot(f, Sam_sin(1:L/2)); grid on;
title('Синус АМ — спектр');

subplot(3,2,3);
plot(f, S_sq(1:L/2)); grid on;
title('Прямоугольный — спектр');

subplot(3,2,4);
plot(f, Sam_sq(1:L/2)); grid on;
title('Прямоугольный АМ — спектр');

subplot(3,2,5);
plot(f, S_saw(1:L/2)); grid on;
title('Пила — спектр');

subplot(3,2,6);
plot(f, Sam_saw(1:L/2)); grid on;
title('Пила АМ — спектр');

%% Сохранение

exportgraphics(fig, 'task2.png', 'Resolution', 300);
close(fig);

disp('Готово: task2.png');

drawnow;
exit;
