clc
clear
close all;
%  can refrence image -------
refrence = imread("bright1.jpeg");
refrence= rgb2gray(refrence);
%refrencegreyimage = imadjust(refrencegrey);
figure,imshow(refrence),title('refrence');

% setup camera connection  --------
% webcamlist;    to show list of connected cams 
%camera = webcam;

% connect arduino 1   ---input pin
%arduino1 = arduino('com3','uno');
%arduino1pin = 'd2';
%configurepin(arduino1,arduino1pin,'DigitalInput');

% connect arduino 2  ----output pin
%arduino2 = arduino('com4','uno');
%arduino2pin= 'd3';
%configurepin(arduino2,arduino2pin,'DigitalPin');

%while true

    % check if arduino sends asignal to take the snap
 %     arduin1value = readDigitalPin(arduino1,arduino1pin);
      %if arduino1value ==1
        %tic
  %     img = snapshot(camera);
        img=imread("bright3.jpeg");
        captured = rgb2gray(img);
        %capturedgreyimage = imadjust(distorted);
        figure,imshow(captured);
        title('captured');
    % close camera -- avoid take another image
       % clear('camera');
   
    % image processing techniques ---------
           
    % feature extraction using speeded up roboust function (surf) 
    % detect features
       referencepoints = detectSURFFeatures(refrence);
       capturedpoints  = detectSURFFeatures(captured);
    
    % feature description 
        
     [refrencefeatures , validrefrencepoints] = extractFeatures(refrence,referencepoints);
     [capturedfeatures , validcapturedpoints] = extractFeatures(captured,capturedpoints);

    % features matching by using their descriptors
     
     indexPairs = matchFeatures(refrencefeatures,capturedfeatures);
    
    % retrive locations of corresponding points 
     matchedrefrence = validrefrencepoints(indexPairs(:,1));
     matchedcaptured = validcapturedpoints(indexPairs(:,2));

    % estimate transformation
     [tform, inliercatured, inlierrefrence] = estimateGeometricTransform(matchedcaptured,matchedrefrence,'similarity');

    % appling the transformation
     outputview = imref2d(size(refrence));
     outputimage = imwarp(captured,tform,'OutputView',outputview);

    % diplay refrene and matched captured imgs
     figure,imshowpair(refrence,outputimage,'montage');

   %  resizing
   outputimage =imresize(outputimage,size(refrence));
   original = imcrop(refrence,[200 200 1200 900]);
   recovered = imcrop(outputimage,[200 200 1200 900]);
   original =refrence;
   recovered = outputimage;
   figure,imshowpair(original,recovered,'montage');

   % black and white 
   % thresh = graythresh(original);
   % bwo = im2bw(original,thresh);
   % thresh1 = graythresh(recovered);
   % bwr = im2bw(recovered,thresh1);
   % figure,imshowpair(bwo,bwr,'montage');

    % check if enouph matches were found 
   q = corr2(original,recovered);
   
   if q>=0.50

       d3=1;
      % countvalid=countvalid+1;
      %writedigitalpin(arduino2,d3);
   else
       d3=0;
      % countunvalid=countunvalid+1;
      %writedigitalpin(arduino2,d3);
   end
   
   % end
%end