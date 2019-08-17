I = imread('F:\paper\ssim\a57_db\images\src_imgs\horse.bmp');
se = translate(strel(1),[0 2]);
J = imdilate(I,se);
imshow(I), title('Original');
figure, imshow(J), title('Translated');
s=cal_cwssim(I,J);
