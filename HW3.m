% clear all; clc
% %question one
% load cam1_1.mat;
% load cam2_1.mat;
% load cam3_1.mat;
% load cam1_2.mat;
% load cam2_2.mat;
% load cam3_2.mat;
% load cam1_3.mat;
% load cam2_3.mat;
% load cam3_3.mat;
% load cam1_4.mat;
% load cam2_4.mat;
% load cam3_4.mat;
width = 50;
filter = zeros(480,640);
filter(300-2.6*width:1:300+2.6*width, 350-width:1:350+width) = 1;
matrix1 = zeros(284,6);
matrix1(1:226,1:2)  = location(vidFrames1_1,filter,250);
matrix1(1:284,3:4) = location(vidFrames2_1,filter,250);
matrix1(1:232,5:6) = location(vidFrames3_1,filter,250);
% %question 1   
% [U,S,V] = svd(matrix1','econ');
% sig = diag(S);
% subplot(3,2,1)
% plot(sig,'ko','Linewidth',2)
% ylabel('\sigma')
% subplot(3,2,2)
% semilogy(sig,'ko','Linewidth',2)
% axis([0 10 10^-3 10^5])
% ylabel('\sigma (log scale)')
% set(gca,'Fontsize',8,'Xtick',0:5:25,'Ytick',logspace(-15,5,5))
% subplot(3,1,2)
% x = linspace(0,20,6);
% t = linspace(0,2,6);
% plot(x,U(1,:),'b',x,U(2,:),'--r',x,U(3,:),':k','Linewidth',2)
% set(gca,'Fontsize',16)
% legend('mode 1','mode 2','mode 3','Location','northwest')
% subplot(3,1,3)
% plot(t,V(1,:),'b',t,V(1,:),'--r',t,V(3,:),':k','Linewidth',2)
% legend('v1','v2','v3','Location','northwest')
% xlabel('t')
% set(gca,'Fontsize',16)

% %question 2
% matrix2 = zeros(356,6);
% matrix2(1:314,1:2) = location(vidFrames1_2,1,200);
% matrix2(1:356,3:4) = location(vidFrames2_2,1,200);
% matrix2(1:327,5:6)= location(vidFrames3_2,1,200);
% [U,S,V] = svd(matrix2','econ');
% sig = diag(S);
% subplot(3,2,1)
% plot(sig,'ko','Linewidth',2)
% ylabel('\sigma')
% subplot(3,2,2)
% semilogy(sig,'ko','Linewidth',2)
% %axis([0 10 10^-3 10^5])
% ylabel('\sigma (log scale)')
% subplot(3,1,2)
% x = linspace(0,5,6);
% t = linspace(0,2,356)
% plot(x,U(:,1),'b',x,U(:,2),'--r',x,U(:,3),':k','Linewidth',2)
% set(gca,'Fontsize',16)
% legend('mode 1','mode 2','mode 3','Location','northwest')
% subplot(3,1,3)
% plot(t,V(:,1),'b',t,V(:,2),'--r',t,V(:,3),':k','Linewidth',2)
% legend('v1','v2','v3','Location','northwest')
% xlabel('t')
% set(gca,'Fontsize',16)
% 
% 
% 
% 
% % 
% % %queation3
% matrix3 = zeros(281,6);
% matrix3(1:239,1:2)= location(vidFrames1_3,1,200);
% matrix3(1:281,3:4)= location(vidFrames2_3,1,200);
% matrix3(1:237,5:6) = location(vidFrames3_3,1,200);
% [U,S,V] = svd(matrix3','econ');
% sig = diag(S);
% subplot(3,2,1)
% plot(sig,'ko','Linewidth',2)
% ylabel('\sigma')
% subplot(3,2,2)
% semilogy(sig,'ko','Linewidth',2)
% ylabel('\sigma (log scale)')
% subplot(3,1,2)
% x = linspace(0,5,6);
% t = linspace(0,2,281)
% plot(x,U(:,1),'b',x,U(:,2),'--r',x,U(:,3),':k','Linewidth',2)
% set(gca,'Fontsize',16)
% legend('mode 1','mode 2','mode 3','Location','northwest')
% subplot(3,1,3)
% plot(t,V(:,1),'b',t,V(:,2),'--r',t,V(:,3),':k','Linewidth',2)
% legend('v1','v2','v3','Location','northwest')
% xlabel('t')
% set(gca,'Fontsize',16)
% 
% 
% % %question4
% matrix4 = zeros(405,6);
% matrix4(1:392,1:2) = location(vidFrames1_4,1,200);
% matrix4(1:405,1:2) = location(vidFrames2_4,1,200);
% matrix4(1:394,1:2) = location(vidFrames3_4,1,200);
% [U,S,V] = svd(matrix4','econ');
% sig = diag(S);
% subplot(3,2,1)
% plot(sig,'ko','Linewidth',2)
% ylabel('\sigma')
% subplot(3,2,2)
% semilogy(sig,'ko','Linewidth',2)
% axis([0 10 10^-3 10^5])
% ylabel('\sigma (log scale)')
% subplot(3,1,2)
% x = linspace(0,5,6);
% t = linspace(0,2,405)
% plot(x,U(:,1),'b',x,U(:,2),'--r',x,U(:,3),':k','Linewidth',2)
% set(gca,'Fontsize',16)
% legend('mode 1','mode 2','mode 3','Location','northwest')
% subplot(3,1,3)
% plot(t,V(:,1),'b',t,V(:,2),'--r',t,V(:,3),':k','Linewidth',2)
% legend('v1','v2','v3','Location','northwest')
% xlabel('t')
% set(gca,'Fontsize',16)