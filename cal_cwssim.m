function s=cal_cwssim(oim,oim1)
% 计算小波系数，并求出相似度。
%oim,oim1是读入的两张灰度图。


tic; 
% corrDn(oim,[1 1; 1 1]/4,'reflect1',[2 2]); 
% time=toc;
 %imSubSample = min(max(floor(log2(time)/2+3),0),2);
im = blurDn(oim,0,'qmf9');%0是 imSubSample
clear oim;
[pyr,pind] = buildSpyr(im,'auto','sp3Filters');
tic; 
% corrDn(oim1,[1 1; 1 1]/4,'reflect1',[2 2]); 
% time1=toc;
% imSubSample1 = min(max(floor(log2(time1)/2+3),0),2);
im1 = blurDn(oim1, 0,'qmf9');
clear oim1;
[pyr1,pind1] = buildSpyr(im1,'auto','sp3Filters');  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%计算CW-SSIM值%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sum1=0;
sum2=0;
sum3=0;
nn=size(pyr,1);
for i=1:nn
    a=conj(pyr1(i,1));
    tem1=pyr(i,1)*a;%计算 C(x) X  C*(y)的和
    sum1=sum1+tem1;  
    tem2=abs(pyr(i,1))*abs(pyr(i,1));%计算 C(x)的平方的和
    sum2=sum2+tem2;
    tem3=abs(pyr1(i,1))*abs(pyr1(i,1));%计算 C(y)的平方的和
    sum3=sum3+tem3;
end

s=(2*sum1)/(sum2+sum3);
