% Biegebalken Skript Beispiel 2:
M0 = 1;
L = 1;
EI = 1;

% x
x = 0:0.001:L;

Q = M0/L*ones(1,length(x));
M = M0/L *x;
w1 = M0/(6*EI*L)*(-3*x.^2+L^2);
w = M0/(6*EI*L)*(-x.^3+L^2*x);

figure
subplot(411)
plot(x, Q, 'LineWidth',1.5)
ylabel('$Q / (M_0/L)$', 'Interpreter','latex')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

subplot(412)
plot(x,M, 'LineWidth',1.5)
ylabel('$M / (M_0/L)$', 'Interpreter','latex')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)


subplot(413)
plot(x,w1, 'LineWidth',1.5)
set(gca,'YDir','reverse');
ylabel("$w' / (M_0/(6EI L))$", 'Interpreter','latex')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

subplot(414)
plot(x, w, 'LineWidth',1.5)
set(gca,'YDir','reverse');
xlabel('$x/L$', 'Interpreter','latex')
ylabel('$w / (M_0/(6EI L))$', 'Interpreter','latex')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

saveas(gcf, '/Users/bastian/Documents/Latex/TM2/Vorlesung/Bilder/biegelinie_bsp2_plot.svg')