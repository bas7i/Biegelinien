% Biegebalken Skript Beispiel 2:
q0 = 1;
L = 1;
a = 0.4;
b = 0.8;
EI = 1;

% x
x = 0:0.001:L;

C1 = q0/2/L *((L-a)^2 - (L-b)^2);
C3 = q0/24/L *((L-b)^4 - (L-a)^4) - q0*L/12 *((L-b)^2 - (L-a)^2);

q = q0 * foeppl(x,a,0) - q0 * foeppl(x,b,0);
Q = -q0 * foeppl(x,a,1) + q0 * foeppl(x,b,1) + C1;
M = -q0/2 * foeppl(x,a,2) + q0/2 * foeppl(x,b,2) + C1*x;
w1 = 1/EI*(q0/6 * foeppl(x,a,3) - q0/6 * foeppl(x,b,3) - C1/2*x.^2 + C3);
w = 1/EI*(q0/24 * foeppl(x,a,4) - q0/24 * foeppl(x,b,4) - C1/6*x.^3 + C3*x);
 % w = q0/(24*EI) *(foeppl(x,a,4) - foeppl(x,b,4) - x/L*((L-b)^4-(L-a)^4)) - 2*x/L .* (L^2-x.^2)*((L-b)^2-(L-a)^2);

figure
subplot(411)
plot(x, Q, 'LineWidth',1.5)
xline(a,'g')
xline(b,'g')
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
xline(b,'g')
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
xline(b,'g')
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
xline(b,'g')
xline(L,'k')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

xlabel('$x$', 'Interpreter','latex')
ylabel('$w$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);



saveas(gcf,'/Users/bastian/Documents/Latex/TM2/Vorlesung/Bilder/biegelinie_bsp3_plot.svg')
