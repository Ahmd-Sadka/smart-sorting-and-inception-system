clc
clear
close all;
%  can refrence image -------
refrence = imread("reference_image.jpg");
refrence= rgb2gray(refrence);
%refrencegreyimage = imadjust(refrencegrey);
%figure,imshow(refrence),title('refrence');

% setup camera connection  --------
% webcamlist;    to show list of connected cams 
camera = webcam;

% connect arduino 1   ---input pin
arduino_conv = arduino('com3','uno');
arduino1pin = 'd8';
configurePin(arduino1,arduino1pin,'DigitalInput');

% connect arduino 2  ----output pin
arduino_arm = arduino('com4','uno');
arduino2pin= 'd9';
configurePin(arduino_arm,arduino2pin,'DigitalOutput');

while true

    % check if arduino sends asignal to take the snap
      arduino1value = readDigitalPin(arduino1,arduino1pin);
      if arduino1value == 0
        cam = webcam;
        cam.Resolution = '1280x720';
        %preview(cam);
        %disp('Press any key to capture a reference image...');
        %pause;
        img1 = snapshot(cam);
        imwrite(img1, 'img2.jpg');
        img = imread('img2.jpg');
        %img=imread("reference_image.jpg");
        captured = rgb2gray(img);
        %captured = rgb2gray(img);

        %capturedgreyimage = imadjust(distorted);
        %figure,imshow(captured);
        %title('captured');
    % close camera -- avoid take another image
        clear('camera');
      end
    % ----------- Used algorithms -----------
           
    % feature extraction using speeded up roboust function (surf) and orb 
    % detect features
       referencepoints = detectSURFFeatures(refrence);
       capturedpoints  = detectSURFFeatures(captured);
    %----   
       orbReferencePoints = detectORBFeatures(refrence);
       orbCapturedPoints = detectORBFeatures(captured);
    % feature description 
        
     [refrencefeatures , validrefrencepoints] = extractFeatures(refrence,referencepoints);
     [capturedfeatures , validcapturedpoints] = extractFeatures(captured,capturedpoints);
    %------
     [orbRefFeatures, orbRefPoints] = extractFeatures(refrence, orbReferencePoints);
     [orbCapturedFeatures, orbCapturedPoints] = extractFeatures(captured, orbCapturedPoints);
    % features matching by using their descriptors
     
     indexPairs = matchFeatures(refrencefeatures,capturedfeatures);
     orbIndexPairs = matchFeatures(orbRefFeatures, orbCapturedFeatures);
    
    % retrive locations of corresponding points 
     matchedrefrence = validrefrencepoints(indexPairs(:,1));
     matchedcaptured = validcapturedpoints(indexPairs(:,2));
     %------
     orbMatchedRefPoints = orbRefPoints(orbIndexPairs(:, 1), :);
     orbMatchedCapturedPoints = orbCapturedPoints(orbIndexPairs(:, 2), :);

    % estimate transformation
    [tform, inliercatured, inlierrefrence] = estimateGeometricTransform(matchedcaptured,matchedrefrence,'similarity');
    %-----
    [orbTform, inlierCapturedPoints, inlierRefPoints] =estimateGeometricTransform(orbMatchedCapturedPoints, orbMatchedRefPoints, 'similarity');
    % appling the transformation
     outputview = imref2d(size(refrence));
     outputimage = imwarp(captured,tform,'OutputView',outputview);
    %---
    orboutputview = imref2d(size(refrence));
    orbWarpedCapturedImage = imwarp(captured, orbTform, 'OutputView',orboutputview);
    % diplay refrene and matched captured imgs
 %    figure,imshowpair(refrence,outputimage,'montage');
%     figure,imshowpair(refrence,orbWarpedCapturedImage,'montage');
   % Resize the warped captured images to match the size of the reference image
surfWarpedCapturedImage = imresize(outputimage, size(refrence));
orbWarpedCapturedImage = imresize(orbWarpedCapturedImage, size(refrence));

% Crop both images to the same region of interest
roi = [200 200 1200 900];
refImage = imcrop(refrence, roi);
surfWarpedCapturedImage = imcrop(surfWarpedCapturedImage, roi);
orbWarpedCapturedImage = imcrop(orbWarpedCapturedImage, roi);

% Convert both images to black and white using a threshold value
surfBWRef = im2bw(refImage, graythresh(refImage));
surfBWCaptured = im2bw(surfWarpedCapturedImage, graythresh(surfWarpedCapturedImage));
orbBWRef = im2bw(refImage, graythresh(refImage));
orbBWCaptured = im2bw(orbWarpedCapturedImage, graythresh(orbWarpedCapturedImage));

% Calculate the correlation coefficients for both matches
surfCorrCoeff = corr2(surfBWRef, surfBWCaptured);
orbCorrCoeff = corr2(orbBWRef, orbBWCaptured);
   % Calculate the aspect ratio of the object in the captured image
%stats = regionprops(surfBWCaptured, 'BoundingBox');
%boundingBoxes = cat(1, stats.BoundingBox); % Combine all bounding boxes into a single matrix
%width = boundingBoxes(3);
%height = boundingBoxes(4);
%aspectRatio = width / height;

   % Use a voting system to determine the validity of the object
numMatches = size(indexPairs, 1) + size(orbIndexPairs, 1);
surfMatchQuality = mean(referencepoints.Metric);
orbMatchQuality = mean(orbMatchedRefPoints.Metric);
product_status = (numMatches / 20) + (surfMatchQuality / 100) + (orbMatchQuality / 100);
if product_status >= 73
  
    %if aspectRatio > 1.2 || aspectRatio < 0.8
     %   d3 = 0; % indicates distortion
    
        d3 = 1; % indicates valid object
        writeDigitalPin(arduino_arm,arduino2pin,d3);
else
        d3 = 0; % indicates invalid object
        writeDigitalPin(arduino_arm,arduino2pin,d3);

end
end