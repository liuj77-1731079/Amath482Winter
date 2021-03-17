% Clean workspace
clear all; close all; clc

load subdata.mat % Imports the data as the 262144x49 (space by time) matrix called subdata
L = 10; % spatial domain
n = 64; % Fourier modes
x2 = linspace(-L,L,n+1); 
x = x2(1:n); 
y =x; 
z = x;
k = (2*pi/(2*L))*[0:(n/2 - 1) -n/2:-1];
ks = fftshift(k);

[X,Y,Z]=meshgrid(x,y,z);
[Kx,Ky,Kz]=meshgrid(ks,ks,ks);
ave = zeros(n,n,n);
 for i = 1:49     
     ave = ave+fftshift(fftn(reshape(subdata(:,i),n,n,n)));
 end  
 ave = abs(fftshift(ave))/49;
 maxave = max(abs(ave),[],'all');
 [x,y,z]=ind2sub(size(ave),find(abs(ave)==maxave));
 x_in = Kx(x,y,z);
 y_in = Ky(x,y,z);
 z_in = Kz(x,y,z);
 X_value = X(x,y,z);
 Y_value = Y(x,y,z);
 Z_value = Z(x,y,z);
 
 
% %for j=1:49
% Un(:,:,:)=reshape(subdata(:,j),n,n,n);
% M = max(abs(Un),[],'all');
% 
% close all, isosurface(X,Y,Z,abs(Un)/M,0.7)
% axis([-20 20 -20 20 -20 20]), grid on, drawnow
% %pause(1)
% end
 
 
   %Filter data
 tau = 0.5;
 k0 = 0;
 filter = exp(-tau*(Kx-x_in).^2+(Ky-y_in).^2+(Kz- z_in).^2);
 %filter = exp(-tau*(Kx-X_value).^2);
 %filter = exp(-tau*(Kx-X_value).^2+(Ky-Y_value).^2);
 u= 0;
 directions= zeros(3,49);
 for i = 1:49     
     u =reshape(subdata(:,i),n,n,n);
     ut = fftn(u); %fft of u
     utshift = fftshift(ut);% shift Fourier transform ut
     unft = filter.* utshift;
     unf = ifftn(unft);
     signal = ifftshift(unft);
     maxu = max(abs(signal),[],'all');
     [x,y,z]=ind2sub(size(signal),find(abs(signal)==maxu));
     x1 = X(x,y,z);
     y1 = Y(x,y,z);
     z1 = Z(x,y,z);
     directions(1,i)= x1;
     directions(2,i)= y1;
     directions(3,i)= z1;
 end 
 plot3(directions(1,:),directions(2,:),directions(3,:),'-*')
 title('Path of submarine')
 
 x_last = directions(1,49);
 y_last = directions(2,49);
 z_last = directions(3,49);
 final = [x_last,y_last, z_last]
 
 
 
 
