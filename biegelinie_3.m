% Biegelinie 3 (Übungsaufgabe):
pfad = '/Users/bastian/Documents/Latex/TM2/Uebungen/Biegelinie_3/Bilder/';

a = 1;
EI = 1;
q0 = 50;

% x
x = 0:0.001:2*a;

% 0-System
Az_0 = -1/2*q0*a;
MA_0 = 5/6*q0*a^2;

q_0 = q0/a * foeppl(x,a,1);
Q_0 = -q0/2/a * foeppl(x,a,2) - Az_0;
M_0 = -q0/6/a * foeppl(x,a,3) - Az_0 * x - MA_0;
w1_0 = 1/EI*(q0/24/a * foeppl(x,a,4) + Az_0/2 * x.^2 + MA_0 * x);
w_0 = 1/EI*(q0/120/a * foeppl(x,a,5) + Az_0/6 * x.^3 + MA_0/2 * x.^2);

figure
subplot(411)
plot(x, Q_0, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

ylabel('$Q$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(412)
plot(x,M_0, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

% mArrow3([0 min(M) 0],[0 max(M) 0])%,'stemWidth',0.005)
% mArrow3([min(x) 0 0],[1.1*max(x) 0 0])%,'stemWidth',0.005)


ylabel('$M$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);


subplot(413)
plot(x,w1_0, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

ylabel("$w'$", 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(414)
plot(x, w_0, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

xlabel('$x$', 'Interpreter','latex')
ylabel('$w$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);



saveas(gcf, strcat(pfad,'biegelinie_3_0_plot.svg'))


%% 1-System
Bz_1 = -q0*a
Az_1 = -Bz_1;
MA_1 = Bz_1*a;

Q_1 = -Az_1 - Bz_1 * foeppl(x,a,0);
M_1 = - Az_1 * x - Bz_1 * foeppl(x,a,1) - MA_1;
w1_1 = 1/EI*(Az_1/2 * x.^2 + Bz_1/2 * foeppl(x,a,2) + MA_1*x);
w_1 = 1/EI*(Az_1/6 * x.^3 + Bz_1/6 * foeppl(x,a,3) + MA_1/2 * x.^2);

figure
subplot(411)
plot(x, Q_1, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

ylabel('$Q$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(412)
plot(x,M_1, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

% mArrow3([0 min(M) 0],[0 max(M) 0])%,'stemWidth',0.005)
% mArrow3([min(x) 0 0],[1.1*max(x) 0 0])%,'stemWidth',0.005)


ylabel('$M$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);


subplot(413)
plot(x,w1_1, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

ylabel("$w'$", 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(414)
plot(x, w_1, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

xlabel('$x$', 'Interpreter','latex')
ylabel('$w$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);



saveas(gcf, strcat(pfad,'biegelinie_3_1_plot.svg'))

%% Superposition
figure
subplot(411)
hold on
plot(x, Q_0,'--', 'LineWidth',1.5)
plot(x, Q_1,':', 'LineWidth',1.5)
plot(x, Q_0+Q_1, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

ylabel('$Q$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(412)
hold on
plot(x,M_0,'--', 'LineWidth',1.5)
plot(x,M_1,':', 'LineWidth',1.5)
plot(x,M_0+M_1, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
ax=gca;
add_xArrow(ax)
add_yArrow(ax,0)

% mArrow3([0 min(M) 0],[0 max(M) 0])%,'stemWidth',0.005)
% mArrow3([min(x) 0 0],[1.1*max(x) 0 0])%,'stemWidth',0.005)


ylabel('$M$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);


subplot(413)
hold on
plot(x,w1_0,'--', 'LineWidth',1.5)
plot(x,w1_1,':', 'LineWidth',1.5)
plot(x,w1_0+w1_1, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

ylabel("$w'$", 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);

subplot(414)
hold on
plot(x, w_0,'--', 'LineWidth',1.5)
plot(x, w_1,':', 'LineWidth',1.5)
plot(x, w_0+w_1, 'LineWidth',1.5)
vline(a,'g')
vline(2*a,'g')
set(gca,'YDir','reverse');
ax=gca;
add_xArrow(ax)
add_yArrow(ax,1)

xlabel('$x$', 'Interpreter','latex')
ylabel('$w$', 'Interpreter','latex')
set(gca, 'xticklabel',[]);
set(gca, 'yticklabel',[]);



saveas(gcf, strcat(pfad,'biegelinie_3_01_plot.svg'))