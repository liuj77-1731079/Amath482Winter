 clear all; clc 
v = VideoReader('monte_carlo_low.mp4')
numFrames = 0;
current = cell([],1) ;
currentcolumn = zeros(540*960,379);
while hasFrame(v)
    F = readFrame(v);    
    numFrames = numFrames + 1;
    current{numFrames} = F(:,:,3);
    currentcolumn(:,numFrames)=reshape(current{numFrames},540*960,1);
    %imagesc(F)
    %drawnow
end
 usol = currentcolumn; 
L = 40; n = 379;
x2 = linspace(-L/2,L/2,n+1); x = x2(1:n);
k = (2*pi/L)*[0:n/2-1 -n/2:-1]';

Time
slices = 318;
t = linspace(0,6.323,slices+1); dt = t(2) - t(1);

X = usol';
X1 = X(:,1:end-1);
X2 = X(:,2:end);


% [U, Sigma, V] = svd(X1,'econ');
% S = U'*X2*V*diag(1./diag(Sigma));
% [eV, D] = eig(S); % compute eigenvalues + eigenvectors
% mu = diag(D); % extract eigenvalues
% omega = log(mu)/dt;
% Phi = U*eV;
% 
% 
% y0 = Phi\X1(:,1); % pseudoinverse to get initial conditions
% 
% u_modes = zeros(length(y0),length(t));
% for iter = 1:length(t)
%    u_modes(:,iter) = y0.*exp(omega*t(iter)); 
% end
% u_dmd = Phi*u_modes;
% 
% 
% % [U, S, V] = svd(X1,'econ');
% subplot(2,1,1)
% t = linspace(0,6.323,518399);
% % Singularvalues
% delays=100;
% plot(diag(S),'ko','Linewidth',2)
% ylabel('\sigmaj')
% set(gca,'Fontsize',16,'Xlim',[0.9 delays+0.1])
% title(['Delays = ', num2str(delays)])
% subplot(2,1,2) 
% % % Right-singular vectors
% % plot(t(1:end-delays+1),V(:,1),'r','Linewidth',2)
% % hold on
% % plot(t(1:end-delays+1),V(:,2),'b--','Linewidth',2)
% % xlabel('t')
% % ylabel('vj(t)')
% % set(gca,'Fontsize',16)
 


subplot(2,1,1), waterfall(x,t,abs(usol)), colormap([0 0 0])
xlabel('x')
ylabel('t')
zlabel('|u|')
title('PDE Solution')
set(gca,'FontSize',16)