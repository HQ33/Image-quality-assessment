clear;clc;
imag1=imread('F:\paper\ssim\a57_db\images\src_imgs\harbour.bmp');%original image
imag2=imread('F:\paper\ssim\a57_db\images\dst_imgs\harbour\A\harbour.JPG.bmp');%good quality 
imag3=imread('F:\paper\ssim\a57_db\images\dst_imgs\harbour\B\harbour.JPG.bmp');%mid quality
imag4=imread('F:\paper\ssim\a57_db\images\dst_imgs\harbour\C\harbour.JPG.bmp');%low quality

[mssim12,ssim_map12]=ssim(imag1,imag2,[0 0]);
[mssim13,ssim_map13]=ssim(imag1,imag3);
[mssim14,ssim_map14]=ssim(imag1,imag4);
figure;
subplot(2,2,1);imshow(imag1);title('original image');
subplot(2,2,2);imshow(imag2);title('good quality');
subplot(2,2,3);imshow(imag3);title('mid quality');
subplot(2,2,4);imshow(imag4);title('low quality');
figure;
subplot(1,3,1);imshow(ssim_map12);title('original-good');
subplot(1,3,2);imshow(ssim_map13);title('original-mid');
subplot(1,3,3);imshow(ssim_map14);title('original-low');

%test
ssim_map14=double(ssim_map14);
imag4=double(imag4);
test_imag=imag4(1:246,1:246)+ssim_map14;%取出原图像的一部分加上相似性指数图比较
test_imag=uint8(test_imag);
figure;
imshow(test_imag);title('test_imag');