% =========================================================
% ЛР13 — ядро кооперативной игры
% =========================================================

clear;
clc;

%% =========================================================
% Значения коалиций
% =========================================================

vA  = 40;
vB  = 120;
vC  = 60;

vAB = 130;
vAC = 80;
vBC = 140;

vABC = 150;

%% =========================================================
% Проверка существования ядра
% =========================================================

sum_individual = vA + vB + vC;

if sum_individual <= vABC

    core_exists = true;

else

    core_exists = false;

end

%% =========================================================
% Вывод
% =========================================================

fprintf('Сумма индивидуальных выигрышей: %.2f\n', sum_individual);
fprintf('Общий выигрыш коалиции: %.2f\n', vABC);

if core_exists
    fprintf('Ядро существует\n');
else
    fprintf('Ядро пусто\n');
end

%% =========================================================
% График
% =========================================================

figure('Visible','off');

bar([vA vB vC vABC]);

set(gca,'XTickLabel',{'A','B','C','ABC'});

title('Сравнение выигрышей');
ylabel('Выигрыш');

grid on;

exportgraphics(gcf,'lab13_core.png','Resolution',300);
close(gcf);

%% =========================================================
% Сохранение результатов
% =========================================================

fileID = fopen('lab13_core_result.txt','w');

fprintf(fileID,'ЛР13 — кооперативная игра\n\n');

fprintf(fileID,'v(A)=%.2f\n',vA);
fprintf(fileID,'v(B)=%.2f\n',vB);
fprintf(fileID,'v(C)=%.2f\n',vC);

fprintf(fileID,'v(AB)=%.2f\n',vAB);
fprintf(fileID,'v(AC)=%.2f\n',vAC);
fprintf(fileID,'v(BC)=%.2f\n',vBC);

fprintf(fileID,'v(ABC)=%.2f\n\n',vABC);

if core_exists
    fprintf(fileID,'Ядро существует\n');
else
    fprintf(fileID,'Ядро пусто\n');
end

fclose(fileID);

disp('Готово: lab13_core.png и lab13_core_result.txt');
