% Biegebalken Skript Beispiel 2:
q0 = 1;
F = 1;
L = 1;
a = 0.333;
EI = 1;

% x
x = 0:0.001:L;

C1 = 7*q0*a/72 + 8*F/9;
C2 = -C1*a;
DeltaPhi = -a^2/EI*(q0*a/48 + 2*F/3);
q = q0 * foeppl(x,2*a,0);
Q = -q0 * foeppl(x,2*a,1) - F * foeppl(x,a,0) + C1;
M = -q0/2 * foeppl(x,2*a,2) - F * foeppl(x,a,1) + C1*x +C2;
w1 = 1/EI*(q0/6 * foeppl(x,2*a,3) + F/2 * foeppl(x,a,2) - C1/2*x.^2 - C2*x) + DeltaPhi*foeppl(x,a,0);
w = 1/EI*(q0/24 * foeppl(x,2*a,4) +F/6 * foeppl(x,a,3) - C1/6*x.^3 - C2/2*x.^2)+ DeltaPhi*foeppl(x,a,1);

figure
subplot(411)
plot(x, Q, 'LineWidth',1.5)
xline(a,'g')
xline(2*a,'g')
xline(L,'k')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

ylabel('$Q$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(412)
plot(x,M, 'LineWidth',1.5)
xline(a,'g')
xline(2*a,'g')
xline(L,'k')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

% mArrow3([0 min(M) 0],[0 max(M) 0])%,'stemWidth',0.005)
% mArrow3([min(x) 0 0],[1.1*max(x) 0 0])%,'stemWidth',0.005)


ylabel('$M$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);


subplot(413)
plot(x,w1, 'LineWidth',1.5)
xline(a,'g')
xline(2*a,'g')
xline(L,'k')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

ylabel("$w'$", 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(414)
plot(x, w, 'LineWidth',1.5)
xline(a,'g')
xline(2*a,'g')
xline(L,'k')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

xlabel('$x$', 'Interpreter','latex')
ylabel('$w$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);



saveas(gcf,'/Users/bastian/Documents/Latex/TM2/Vorlesung/Bilder/biegelinie_bsp4_plot.svg')
