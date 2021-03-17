% clear all; clc
% 
% %question one
% figure(1)
% [y, Fs] = audioread('GNR.m4a');
% tr_gnr = length(y)/Fs; % record time in seconds
% plot((1:length(y))/Fs,y);
% xlabel('Time [sec]'); ylabel('Amplitude');
% title('Sweet Child O Mine');
% 
% p8 = audioplayer(y,Fs); 
% playblocking(p8);
% figure(2)
% fy = fft(y);
% plot((1:length(fy))/Fs,fy);
% 
% figure(3)
% 
% L = tr_gnr; n = length(y);
% t2 = linspace(0,L,n+1);
% t = t2(1:n);
% k = (1/L)*[0:n/2-1 -n/2:-1];
% ks = fftshift(k);
% S=y;
% a = [5 1 0.2];
% tau = 0:0.01:tr_gnr;
%   for jj = 1:length(a)
%     Sgt_spec = []; 
%    for j = 1:length(tau)
%        g = exp(-a(jj)*(t - tau(j)).^2);
%     Sg = g.*S(j);
%     Sgt = fft(Sg);
%     Sgt_spec(:,j) = fftshift(abs(Sgt));
%    end
%    subplot(2,2,jj)
%    pcolor(tau,ks,log(Sgt_spec)+1)
%    shading interp
%    set(gca,'ylim',[-50 50],'Fontsize',16)
%    colormap(hot)
%    %colorbar
%    xlabel('time (t)'), ylabel('frequency (k)')
%    title(['a = ',num2str(a(jj))],'Fontsize',16)
%   end
   


%question 2
 [y_1, Fs_1] = audioread('Floyd.m4a');
 tr_gnr = length(y_1)/Fs_1; % record time in seconds
 figure(1)
 fy_1 = fft(y_1);
 t = (1:length(fy_1))/Fs_1;
 t = t(1,947950:1677416);
 fy_1 = fy_1(947950:1677416,1);
 plot(t,fy_1);
 xlabel('time (t)'), ylabel('frequency (k)')
 legend("Floyd ")
 title("Floyd Bass")

%question3 
[y_1, Fs_1] = audioread('Floyd.m4a');
tr_gnr = length(y_1)/Fs_1; % record time in seconds

[y_2, Fs_2] = audioread('GNR.m4a');
tr_gnr = length(y_2)/Fs_2; % record time in seconds


figure(1)
fy_1 = fft(y_1);
fy_2 = fft(y_2);
plot((1:length(fy_1))/Fs_1,fy_1);
hold on
plot((1:length(fy_2))/Fs_2,y_2);
xlabel('time (t)'), ylabel('frequency (k)')
legend('Floyd', 'GNR', 'Location', 'SouthEast')
title('Floyd and GNR overlaps')

 figure(2)
fy_1_short = y_1(947950:1677416,1);
fy_1_short = fft(fy_1_short);
fy_2 = fft(y_2);
fy_2_short = fy_2;
plot((1:length(fy_1_short))/Fs_1,fy_1_short);
hold on
plot((1:length(fy_2_short))/Fs_2,fy_2_short);
xlabel('time (t)'), ylabel('frequency (k)')
legend('Floyd', 'GNR', 'Location', 'SouthEast')
title('Floyd and GNR overlaps')

