clear all

% Konstanten
syms F L a q0 EI

% zu bestimmende Integrationskonstanten
syms C1 C2 phi

f1 = C1*a - C2 == 0;
f2 = q0/6*a^3 + 2*F*a^2 - 9/2*C1*a^2 + 3*C2*a + EI*phi == 0;
f3 = q0/24*a^4 +4/3*F*a^3 - 9/2*C1*a^3 + 9/2*C2*a^2 + 2*EI*a*phi == 0;

[A, B] = equationsToMatrix([f1, f2, f3], [C1, C2, phi]);

X = linsolve(A, B)

% Ersetze die Variablen durch numerische Werte
C1n = subs(X(1), {F, L, a, q0, EI}, {1, 1, 1, 1,1})
C2n = subs(X(2), {F, L, a, q0, EI}, {1, 1, 1, 1,1})
phin = subs(X(3), {F, L, a, q0, EI}, {1, 1, 1, 1,1})