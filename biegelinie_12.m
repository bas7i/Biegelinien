set(0, 'DefaultLineLineWidth', 1.5);


% allgemeine Variablen für elementare Lastfälle
syms xi al F l q0 M0
be = 1 - al;



% Ersatzmoment für Lastfall 1
M_0 = 1/2*q0*l^2;

% Gelenkkraft Bx für Lastfall 3
syms Bx

ln = 1;
q0n = 1;
Fn = q0n*ln;



xi0 = 1;



% Lastfall 1: Moment am Balkenende mit Wert
[w1, ws1] = superpositionstabelle(10);
% Angriff Moment am Balkenende
w1 = subs(w1, al, 1);
ws1 = subs(ws1, al, 1);
% Ersetze Moment durch Wert der Streckenlast
w1 = subs(w1, M0, M_0);
ws1 = subs(ws1, M0, M_0);


% Lastfall 2: zentral angreifende Kraft F (negativ)
[w2, ws2] = superpositionstabelle(6);
w2 = subs(w2, al, 0.5);
ws2 = subs(ws2, al, 0.5);
% Ersetze Kraft durch -F
w2 = subs(w2, F, -F);
ws2 = subs(ws2, F, -F);

% Lastfall 3: -Bx am Ende
[w3, ws3] = superpositionstabelle(6);
w3 = subs(w3, al, 1);
ws3 = subs(ws3, al, 1);
% Ersetze Kraft durch Bx
w3 = subs(w3, F, -Bx);
ws3 = subs(ws3, F, -Bx);


%% Ermittlung von Kraft Bx durch Randbedingung w(xi=1) == 0
RB = w1(1) + w2(1) + w3(1);
B_x = solve(RB == 0, Bx);

display('B_x = ')
pretty(B_x)

% Ersetze Lastfall 3 durch 
w3 = subs(w3, Bx, B_x);
ws3 = subs(ws3, Bx, B_x);


%% Ersetze symbolische Werte durch numerische für Plot
vec = [F, q0, l];
vecn = [Fn, q0n, ln];

w1n = subs(w1, vec, vecn);
ws1n = subs(ws1, vec, vecn);
w2n = subs(w2, vec, vecn);
ws2n = subs(ws2, vec, vecn);
w3n = subs(w3, vec, vecn);
ws3n = subs(ws3, vec, vecn);

% Superposition
w_DC = w1 + w2 + w3;
ws_DC = ws1 + ws2 + ws3;
w_DCn = w1n + w2n + w3n;
ws_DCn = ws1n + ws2n + ws3n;


%% Plot vertikaler Teil
figure
subplot(211)
fplot(ws1n, [0, 1])
hold on
fplot(ws2n, [0, 1])
fplot(ws3n, [0, 1])
fplot(ws_DCn, [0, 1])
plot(xi0, ws1n(xi0), 'o')
plot(xi0, ws2n(xi0), 'o')
plot(xi0, ws3n(xi0), 'o')
plot(xi0, ws_DCn(xi0), 'o')
set(gca,'YDir','reverse');
hold on
title("Neigung w_{DC}'")
legend('1', '2', '3', 'res')

subplot(212)
fplot(w1n, [0, 1])
hold on
fplot(w2n, [0, 1])
fplot(w3n, [0, 1])
fplot(w_DCn, [0, 1])
plot(xi0, w1n(xi0), 'o')
plot(xi0, w2n(xi0), 'o')
plot(xi0, w3n(xi0), 'o')
plot(xi0, w_DCn(xi0), 'o')
set(gca,'YDir','reverse');
hold on
title("Biegelinie w_{DC}")
legend('1', '2', '3', 'res')


%% Bereich BC
% Lastfall 7: konstante Streckenlast q0/2
[w4, ws4] = superpositionstabelle(7);

% Ersetze Streckenlast
w4 = subs(w4, q0, q0/2);
ws4 = subs(ws4, q0, q0/2);

% Lastfall 9: linear abfallende Streckenlast q0/2
[w5, ws5] = superpositionstabelle(9);

% Ersetze Streckenlast
w5 = subs(w5, q0, q0/2);
ws5 = subs(ws5, q0, q0/2);

% Lastfall 6: Gelenkkraft Bz
[w6, ws6] = superpositionstabelle(6);
w6 = subs(w6, al, 1);
ws6 = subs(ws6, al, 1);

% Ersetze Kraft durch  F= -Bz, Bz = -q0*l/6
w6 = subs(w6, F, q0*l/6);
ws6 = subs(ws6, F, q0*l/6);

% Superposition (inkl. Anfangssteigung aus Verdrehung der biegesteifen
% Ecke)
w_CB = w4 + w5 + w6 - ws_DC(1)*xi*l;
ws_CB = ws4 + ws5 + ws6 - ws_DC(1);

%% Ersetze symbolische Werte durch numerische für Plot
vec = [q0, F, l];
vecn = [q0n, Fn, ln];

w4n = subs(w4, vec, vecn);
ws4n = subs(ws4, vec, vecn);
w5n = subs(w5, vec, vecn);
ws5n = subs(ws5, vec, vecn);
w6n = subs(w6, vec, vecn);
ws6n = subs(ws6, vec, vecn);
w_CBn = subs(w_CB, vec, vecn);
ws_CBn = subs(ws_CB, vec, vecn);




%% Plot horizontaler Teil BC
figure
subplot(211)
fplot(ws4n, [0, 1])
hold on
fplot(ws5n, [0, 1])
fplot(ws6n, [0, 1])
fplot(-ws_DCn(1), [0, 1])
fplot(ws_CBn, [0, 1])

set(gca,'YDir','reverse');

set(gca,'XDir','reverse');
hold on
title("Neigung w_{CB}'")
legend('4 - q0/2=const', '5 - q0/2 linear', '6 - Bz', 'Verdrehung Ecke', 'res')

subplot(212)
fplot(w4n, [0, 1])
hold on
fplot(w5n, [0, 1])
fplot(w6n, [0, 1])
fplot(-ws_DCn(1)*xi, [0, 1])
fplot(w_CBn, [0, 1])
% plot(xi0, w1n(xi0), 'o')
% plot(xi0, w2n(xi0), 'o')
% plot(xi0, w3n(xi0), 'o')
% plot(xi0, wn(xi0), 'o')
set(gca,'YDir','reverse');

set(gca,'XDir','reverse');
hold on
title("Biegelinie w_{CB}")
legend('4 - q0/2=const', '5 - q0/2 linear', '6 - Bz', '-wm', 'res')


%% Absenkung B
w_B = simplify(w_CB(1));
display('w_B =')
pretty(w_B)

%% Bereich AB
% Lastfall 4: linear abfallende Streckenlast q0/2
[w7, ws7] = superpositionstabelle(4);

% Ersetze Streckenlast
w7 = subs(w7, q0, q0/2);
ws7 = subs(ws7, q0, q0/2);

% mittlere Steigung:
ws_m = w_B / l; 

ws_AB = ws7 + ws_m;
w_AB = w7 + ws_m * xi* l;


w7n = subs(w7, vec, vecn);
ws7n = subs(ws7, vec, vecn);

ws_mn = subs(ws_m, vec, vecn);
w_ABn = subs(w_AB, vec, vecn);
ws_ABn = subs(ws_AB, vec, vecn);

%% Plot horizontaler Teil AB
figure
subplot(211)
fplot(ws7n, [0, 1])
hold on
fplot(ws_mn, [0, 1])
fplot(ws_ABn, [0, 1])

set(gca,'YDir','reverse');
hold on
title("Neigung w_{AB}'")
legend('4 - q0/2 linear', 'mittel', 'res')

subplot(212)
fplot(w7n, [0, 1])
hold on
fplot(ws_mn*xi/ln, [0, 1])
fplot(w_ABn, [0, 1])

% plot(xi0, w1n(xi0), 'o')
% plot(xi0, w2n(xi0), 'o')
% plot(xi0, w3n(xi0), 'o')
% plot(xi0, wn(xi0), 'o')
set(gca,'YDir','reverse');

hold on
title("Biegelinie w_{AB}")
legend('4 - q0/2 linear',  'mittel', 'res')

%%
w_BC = subs(w_CB, xi, -xi+2);
w_BCn = subs(w_BC, vec, vecn);

w_CD = subs(w_DC, xi, -xi);
w_CDn = subs(w_CD, vec, vecn);

figure
hold on
fplot(w_ABn, [0, 1])
fplot(w_BCn, [1, 2])
set(gca,'YDir','reverse');

hold on
title("Biegelinie w AB")

figure
hold on
fplot(w_CDn, [-1 0])
set(gca,'YDir','reverse');
camroll(-90)
hold on
title("Biegelinie w CD")

%% Berechnung Winkelsprung am Gelenk
delta_phi = simplify(-ws_AB(1) - ws_CB(1));

display('delta_phi = ')
pretty(delta_phi)