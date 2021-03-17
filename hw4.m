 clear all; clc
 [images, labels] = mnist_parse('train-images.idx3-ubyte', 'train-labels.idx1-ubyte');
% ImageVector = reshape(permute(images,[3 1 2]),[],1);
 imagetrans = permute(images,[3 1 2]);
ImageVector = zeros(784,60000);
for i = 1:60000
current=imagetrans(i,:,:);
ImageVector(1:784,i) = reshape(current,784,1);
end
X=ImageVector(:,2);
Y=ImageVector(:,3);
Z=ImageVector(:,5);
[U,S,V] = svd(ImageVector,'econ');
sig = diag(S);
plot(sig,'b--o','Linewidth',2);
title('singular value spectrum','Fontsize',20)
V3 = [V(1,:)',V(2,:)',V(3,:)'];
Vimage3 = V3'*ImageVector;
V4 = [V(4,:)',V(5,:)',V(6,:)'];
Vimage4 = V4'*ImageVector;
V5 = [V(7,:)',V(8,:)',V(9,:)'];
Vimage5 = V5'*ImageVector;
 %plot3(Vimage[1],Y,Z,'k.','Markersize',10)
 plot3(Vimage3(1,:),Vimage3(2,:),Vimage3(3,:)','r.','MarkerSize',10)
 hold on
 plot3(Vimage4(1,:),Vimage4(2,:),Vimage4(3,:)','k.','MarkerSize',10)
 plot3(Vimage5(1,:),Vimage5(2,:),Vimage5(3,:)','g.','MarkerSize',10)
 %plot3(Xrank1(:,1),Xrank1(:,2),Xrank1(:,3),'r.','MarkerSize',10)
% axis vis3d
% hold on
% Xrank1 = S(1,1)*U(:,1)*V(:,1)';
% plot3(Xrank1(:,1),Xrank1(:,2),Xrank1(:,3),'r.','MarkerSize',10)
% Xrank2 = U(:,1)*S(1,1)*V(:,1)' + U(:,2)*S(2,2)*V(:,2)';
% plot3(Xrank2(:,1),Xrank2(:,2),Xrank2(:,3),'g.','Markersize',10)
title('project  onto  three  selectedV-modes','Fontsize',20)
 legend('V1','V2','V3','Fontsize',20)

pick two digit
digit5 = reshape(imagetrans(1,:,:),28,28);
imshow(digit5)
digit0 = reshape(imagetrans(2,:,:),28,28);
imshow(digit0)
digit4 = reshape(imagetrans(3,:,:),28,28);
imshow(digit4)
n=0;
digit5_matrix = zeros(784,5421);
for i = 1:60000
    if labels(i) == 5
        n = n+1;
        digit5_matrix(:,n) = ImageVector(:,i);
    end
end

n=0;
digit0_matrix = zeros(784,5923);
for i = 1:60000
    if labels(i) == 0
        n = n+1;
        digit0_matrix(:,n) = ImageVector(:,i);
    end
end

n=0;
digit4_matrix = zeros(784,5923);
for i = 1:60000
    if labels(i) == 0
        n = n+1;
        digit4_matrix(:,n) = ImageVector(:,i);
    end
end

digit5_wave = digit_wavelet(digit5_matrix);
digit0_wave = digit_wavelet(digit0_matrix);
digit4_wave = digit_wavelet(digit4_matrix);
feature=50;
%[U,S,V,threshold,w,sort5,sort0] = dc_trainer(digit5_wave,digit0_wave,feature);


%viw first 6 graph five and zero overlap
[U,S,V] = svd([digit4_wave digit0_wave],'econ');
figure(1)
for k = 1:6  
    subplot(2,3,k)   
    ut1 = reshape(U(:,k),14,14);   
    ut2 = rescale(ut1);   
    imshow(ut2)
end


Plot right singular vectors
figure(2)
subplot(2,1,1)
plot(diag(S),'ko','Linewidth',2)
title('Plot right singular vectors','Fontsize',20)
set(gca,'Fontsize',16,'Xlim',[0 80])
legend('sigular value','Fontsize',13)
subplot(2,1,2)
semilogy(diag(S),'ko','Linewidth',2)
set(gca,'Fontsize',16,'Xlim',[0 80])
legend('log of singular value','Fontsize',13)



figure(3) 
for k = 1:3
    subplot(3,2,2*k-1)   
    plot(1:40,V(1:40,k),'ko-')   
    subplot(3,2,2*k)   
    plot(1:40,V(11807:11846,k),'ko-')
end
    subplot(3,2,1),
    set(gca,'Ylim',[-1 1],'Fontsize',12), title('digit5')
    subplot(3,2,2), set(gca,'Ylim',[-1 1],'Fontsize',12), title('digit0')
    subplot(3,2,3), set(gca,'Ylim',[-1 1],'Fontsize',12)
    subplot(3,2,4), set(gca,'Ylim',[-1 1],'Fontsize',12)
    subplot(3,2,5), set(gca,'Ylim',[-1 1],'Fontsize',12)
    subplot(3,2,6), set(gca,'Ylim',[-1 1],'Fontsize',12)

identified by the threshhold   
figure(5)
subplot(1,2,1)
histogram(sort5,30); 
hold on, 
plot([threshold threshold], [0 10],'r')
set(gca,'Xlim',[-3 4],'Ylim',[0 10],'Fontsize',14)
title('digit5')
subplot(1,2,2)
histogram(sort0,30);
hold on, plot([threshold threshold], [0 10],'r')
set(gca,'Xlim',[-3 4],'Ylim',[0 10],'Fontsize',14)
title('digit0')


%test matrix
[test_images, test_labels] = mnist_parse('t10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte');
%take out 5 and zero matrix
testVector = zeros(784,10000);
 for i = 1:10000
 current=imagetrans(i,:,:);
 testVector(1:784,i) = reshape(current,784,1);
 end

n=0;
test0_matrix = zeros(784,1001);
for i = 1:10000
    if labels(i) == 9
        n = n+1;
        test0_matrix(:,n) = testVector(:,i);
    end
end

n0=0;
n1=0;
n2=0;
n3=0;
n4=0;
n5=0;
n6=0;
n7=0;
n8=0;
n9=0;
test0_matrix = zeros(784,1001);
test1_matrix = zeros(784,1127);
test2_matrix = zeros(784,991);
test3_matrix = zeros(784,1023);
test4_matrix = zeros(784,980);
test5_matrix = zeros(784,863);
test6_matrix = zeros(784,1014);
test7_matrix = zeros(784,1070);
test8_matrix = zeros(784,944);
test9_matrix = zeros(784,978);
for i = 1:10000
    if labels(i) == 0
         n0=n0+1;
        test0_matrix(:,n0) = testVector(:,i);
    elseif labels(i) == 1
          n1=n1+1;
        test1_matrix(:,n1) = testVector(:,i); 
    elseif labels(i) == 2
          n2=n2+1;
        test2_matrix(:,n2) = testVector(:,i); 
    elseif labels(i) == 3
          n3=n3+1;
        test3_matrix(:,n3) = testVector(:,i); 
    elseif labels(i) == 4
          n4=n4+1;
        test4_matrix(:,n4) = testVector(:,i);
    elseif labels(i) == 5
            n5=n5+1;
        test5_matrix(:,n5) = testVector(:,i);
    elseif labels(i) == 6
            n6=n6+1;
        test6_matrix(:,n6) = testVector(:,i);
    elseif labels(i) == 7
            n7=n7+1;
        test7_matrix(:,n7) = testVector(:,i);
    elseif labels(i) == 8
           n8=n8+1;
        test8_matrix(:,n8) = testVector(:,i);
    elseif labels(i) == 9
           n9=n9+1;
        test9_matrix(:,n9) = testVector(:,i);
    end
end


 correction(test4_matrix,test2_matrix)
 correction(test4_matrix,test3_matrix)
 correction(test4_matrix,test4_matrix)
 correction(test4_matrix,test5_matrix)
 correction(test4_matrix,test6_matrix)
  correction(test4_matrix,test7_matrix)
   correction(test4_matrix,test8_matrix)
    correction(test4_matrix,test9_matrix)
 %percentage5_0=correction(test5_matrix,test0_matrix)

% 
% classification tree on fisheriris data
% load fisheriris;tree=fitctree(meas,species,'MaxNumSplits',3,'CrossVal','on');
% view(tree.Trained{1},'Mode','graph');
% classError = kfoldLoss(tree)
% % SVM classifier with training data, labels and test set
% label = 1:9;
% Mdl = fitcsvm(ImageVector,label);
% testlabels = predict(Mdl,test);






