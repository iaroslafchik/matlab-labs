% =========================================================
% ЛР4 — Задание 3
% Передаточная функция системы H(s)
% h(t) = 3! / t^4
% (численное преобразование Лапласа)
% =========================================================

clear;
clc;

%% Параметры

s = linspace(0.1, 10, 300);

t = linspace(0.01, 5, 5000);   % избегаем t=0 из-за разрыва
dt = t(2) - t(1);

%% Импульсная характеристика

h = factorial(3) ./ (t.^4);

%% Численное преобразование Лапласа

H = zeros(size(s));

for k = 1:length(s)
    integrand = h .* exp(-s(k)*t);
    H(k) = sum(integrand) * dt;
end

%% =========================================================
% График
% =========================================================

figure('Visible','off','Name','Передаточная функция','NumberTitle','off');

plot(s, H, 'LineWidth', 1.5);
grid on;

title('Передаточная функция H(s)');
xlabel('s');
ylabel('H(s)');

%% Сохранение графика

exportgraphics(gcf, 'transfer_function.png', 'Resolution', 300);
close(gcf);

%% Сохранение результатов в файл

fileID = fopen('transfer_function.txt','w');

fprintf(fileID, 'ЛР4 - Задание 3\n');
fprintf(fileID, 'h(t) = 3! / t^4\n\n');
fprintf(fileID, 's\tH(s)\n');

for k = 1:length(s)
    fprintf(fileID, '%.4f\t%.6f\n', s(k), H(k));
end

fclose(fileID);

disp('Готово: transfer_function.png и transfer_function.txt');

drawnow;
exit;
