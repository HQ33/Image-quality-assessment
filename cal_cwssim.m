function s=cal_cwssim(oim,oim1)
% ����С��ϵ������������ƶȡ�
%oim,oim1�Ƕ�������ŻҶ�ͼ��


tic; 
% corrDn(oim,[1 1; 1 1]/4,'reflect1',[2 2]); 
% time=toc;
 %imSubSample = min(max(floor(log2(time)/2+3),0),2);
im = blurDn(oim,0,'qmf9');%0�� imSubSample
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
%%%%%%%%%%%%%%%%%%%%%%����CW-SSIMֵ%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sum1=0;
sum2=0;
sum3=0;
nn=size(pyr,1);
for i=1:nn
    a=conj(pyr1(i,1));
    tem1=pyr(i,1)*a;%���� C(x) X  C*(y)�ĺ�
    sum1=sum1+tem1;  
    tem2=abs(pyr(i,1))*abs(pyr(i,1));%���� C(x)��ƽ���ĺ�
    sum2=sum2+tem2;
    tem3=abs(pyr1(i,1))*abs(pyr1(i,1));%���� C(y)��ƽ���ĺ�
    sum3=sum3+tem3;
end

s=(2*sum1)/(sum2+sum3);
