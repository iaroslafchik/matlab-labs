% =========================================================
% ЛР4 — Задание 5
% H(s) и импульсная характеристика h(t)
% =========================================================

clear;
clc;
close all;

%% Частотная область (s)

s = linspace(0.1, 20, 600);

H = 1 ./ (2*s.^3 + s.^2 + s + 1);

%% =========================================================
% Импульсная характеристика (численно через обратный Лаплас)
% =========================================================

t = linspace(0, 10, 3000);
dt = t(2) - t(1);

h = zeros(size(t));

for k = 1:length(t)
    integrand = H .* exp(s*t(k));
    h(k) = (1/(2*pi)) * sum(integrand) * (s(2)-s(1));
end

h = real(h);

%% =========================================================
% Графики
% =========================================================

figure('Visible','off','Name','Система','NumberTitle','off');

subplot(2,1,1);
plot(s, abs(H), 'LineWidth', 1.5);
grid on;
title('Передаточная функция H(s)');
xlabel('s');
ylabel('|H(s)|');

subplot(2,1,2);
plot(t, h, 'LineWidth', 1.5);
grid on;
title('Импульсная характеристика h(t)');
xlabel('t');
ylabel('Амплитуда');

%% =========================================================
% Сохранение
% =========================================================

exportgraphics(gcf, 'lab4_system.png', 'Resolution', 300);
close(gcf);

fileID = fopen('lab4_system.txt','w');

fprintf(fileID, 'ЛР4 - Задание 5\n\n');
fprintf(fileID, 'H(s) = 1 / (2s^3 + s^2 + s + 1)\n\n');

fprintf(fileID, 's\tH(s)\n');

for k = 1:length(s)
    fprintf(fileID, '%.4f\t%.6f\n', s(k), H(k));
end

fclose(fileID);

disp('Готово: lab4_system.png и lab4_system.txt');

drawnow;
exit;
