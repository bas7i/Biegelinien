syms a l F EI
assume(l,"positive")
assume(F,"positive")

a= l/2;


x = 0:0.1*l:l;


Az = -F/l*a;

Q = -Az - F *foeppl_sym(x,a,0);
M = -Az * x - F * foeppl_sym(x,a,1);

syms C1 C2
w1 = 1/EI* (Az/2 *x.^2 + F/2*foeppl_sym(x,a,2)) + C1;
w =  1/EI* (Az/6 *x.^3 + F/6*foeppl_sym(x,a,3)) + C1 * x + C2;

%% Determination of boundary conditions
C2_RB = solve(w(1), C2);
w = subs(w, C2, C2_RB);

C1_RB = solve(w(end), C1);
w1 = subs(w1, C1, C1_RB);
w = subs(w, C1, C1_RB);
%% Substitution of symbolic variables
vec_sym = [F, l, EI];
vec_num = [1, 2, 1];


%%
figure
subplot(411)
plot(subs(Q, vec_sym, vec_num))

subplot(412)
plot(subs(M, vec_sym, vec_num))

subplot(413)
plot(subs(w1, vec_sym, vec_num))

subplot(414)
plot(subs(w, vec_sym, vec_num))
