function aa=psnr_mse(image1,image2)
[m,n]=size(image1);
max=255;
mse=sum(sum((image1-image2).^2))/(m*m);
aa=20*log10(max/sqrt(mse));