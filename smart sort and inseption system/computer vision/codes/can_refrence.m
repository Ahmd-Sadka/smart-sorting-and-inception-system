clc
clear
close all;
%webcam = webcamlist; 
cam = webcam;
cam.Resolution = '1280x720';
preview(cam);
disp('Press any key to capture a reference image...');
pause;
img = snapshot(cam);
imwrite(img, 'refrence100.jpg');
