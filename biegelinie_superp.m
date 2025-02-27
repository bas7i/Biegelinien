% Biegebalken Superposition
F = 1;
L = 1;
a = L/3;
b = 2*L/3;
EI = 1;
q0 = F/a;

% x
x = 0:0.001:L;


% 0-System
Az = -q0*a*(L-a/2)/L;% - F*b/L;
C1 = -Az/6*L^2 - q0/24/L*(L^4 - (L-a)^4);

q = q0- q0 * foeppl(x,a,0);
Q = -q0 * x + q0 * foeppl(x,a,1) - Az;
M = -q0/2 * x.^2 + q0/2 * foeppl(x,a,2) - Az * x;
w1 = 1/EI*(q0/6 * x.^3 -q0/6 * foeppl(x,a,3) + Az/2 * x.^2 + C1);
w = 1/EI*(q0/24 * x.^4 - q0/24 * foeppl(x,a,4) + Az/6 * x.^3 + C1 * x);
w0 = w;

figure
subplot(411)
plot(x, Q, 'LineWidth',1.5)
vline(a,'g')
vline(b,'g')
vline(L,'k')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

ylabel('$Q$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(412)
plot(x,M, 'LineWidth',1.5)
vline(a,'g')
vline(b,'g')
vline(L,'k')
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
vline(a,'g')
vline(b,'g')
vline(L,'k')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

ylabel("$w'$", 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(414)
plot(x, w, 'LineWidth',1.5)
vline(a,'g')
vline(b,'g')
vline(L,'k')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

xlabel('$x$', 'Interpreter','latex')
ylabel('$w$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);



saveas(gcf,'/Users/bastian/Documents/Latex/TM2/Vorlesung/Bilder/biegelinie_superp0_plot.svg')


%% 1-System
Az = - F*(L-b)/L;
C1 = -Az/6*L^2 - F/6/L*(L-b)^3;


Q = - Az -F * foeppl(x,b,0);
M = - Az * x -F * foeppl(x,b,1);
w1 = 1/EI*(Az/2 * x.^2 + F/2 * foeppl(x,b,2) + C1);
w = 1/EI*(Az/6 * x.^3 + F/6 * foeppl(x,b,3)+ C1 * x);
w1 = w;

figure
subplot(411)
plot(x, Q, 'LineWidth',1.5)
vline(a,'g')
vline(b,'g')
vline(L,'k')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

ylabel('$Q$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(412)
plot(x,M, 'LineWidth',1.5)
vline(a,'g')
vline(b,'g')
vline(L,'k')
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
vline(a,'g')
vline(b,'g')
vline(L,'k')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

ylabel("$w'$", 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(414)
plot(x, w, 'LineWidth',1.5)
vline(a,'g')
vline(b,'g')
vline(L,'k')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

xlabel('$x$', 'Interpreter','latex')
ylabel('$w$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);



saveas(gcf,'/Users/bastian/Documents/Latex/TM2/Vorlesung/Bilder/biegelinie_superp1_plot.svg')


%% 0+1
w = w0 + w1;

figure
plot(x, w, 'LineWidth',1.5)
hold on
plot(x, w0, 'LineWidth',1.)
plot(x, w1, 'LineWidth',1.)
vline(a,'g')
vline(b,'g')
vline(L,'k')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)
xlabel('$x$', 'Interpreter','latex')
ylabel('$w$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

saveas(gcf,'/Users/bastian/Documents/Latex/TM2/Vorlesung/Bilder/biegelinie_superp01_plot.svg')
