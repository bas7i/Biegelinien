% Biegebalken Skript Beispiel 7 (Rahmen):
F = 1;
L = 1;
EI = 1;
q0 = F/L;

% x
x = 0:0.001:L;

Az = -q0*L/2;
MA = q0*L^2/3 + F*L;


% horizontaler Bereich
q = q0/L*x;
Q = -Az - q0/2/L * x.^2;
M = -MA - Az*x - q0/6/L * x.^3;
w1 = 1/EI*(MA*x + Az/2*x.^2 + q0/24/L * x.^4);
w = 1/EI*(MA/2*x.^2 + Az/6*x.^3 + q0/120/L * x.^5);

figure
subplot(411)
plot(x, Q, 'LineWidth',1.5)
xline(L,'k')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

ylabel('$Q$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(412)
plot(x,M, 'LineWidth',1.5)
xline(L,'k')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)



ylabel('$M$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);


subplot(413)
plot(x,w1, 'LineWidth',1.5)
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
xline(L,'k')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

xlabel('$x$', 'Interpreter','latex')
ylabel('$w$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);



saveas(gcf,'/Users/bastian/Documents/Latex/TM2/Vorlesung/Bilder/biegelinie_bsp7_plot_h.svg')


%% vertikaler Bereich
C_1 = q0*L^3/8 + F*L^2;

Q = F*ones(1, length(x));
M = -F*(L-x);
w1 = 1/EI*(-F/2 * x.^2 + F*L*x + C_1);
w = 1/EI*(-F/6 * x.^3 + F*L/2 * x.^2 + C_1 * x);

figure
subplot(411)
plot(x, Q, 'LineWidth',1.5)
xline(L,'k')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

ylabel('$Q$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(412)
plot(x,M, 'LineWidth',1.5)
xline(L,'k')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)



ylabel('$M$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);


subplot(413)
plot(x,w1, 'LineWidth',1.5)
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
xline(L,'k')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

xlabel('$x$', 'Interpreter','latex')
ylabel('$w$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);



% saveas(gcf,'/Users/bastian/Documents/Latex/TM2/1Vorlesung/Bilder/biegelinie_bsp7_plot_v.svg')
