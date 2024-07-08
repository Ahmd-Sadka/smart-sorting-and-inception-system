<<<<<<< HEAD
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
=======
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
>>>>>>> f4319c94dc98cdc53b162f63f125dc763aff72a9
