I = imread('F:\direction\ScSR\Data\Testing\input.bmp');

I3=I(1:100,1:100,3);
I4=I(1:50,1:50,3);


figure
a1 = subplot(1, 3, 1); imshow(I),  
xs = get(a1, 'xlim'); ys = get(a1, 'ylim');
a2 = subplot(1, 3, 2); imshow(I3),
set(a2, 'xlim', xs, 'ylim', ys);
a3 = subplot(1, 3, 3); imshow(I4),
set(a3, 'xlim', xs, 'ylim', ys);


