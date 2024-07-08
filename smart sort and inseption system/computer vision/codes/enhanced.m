clc
clear
close all;

% Load reference image
reference = imread("bright1.jpeg");
reference_gray = rgb2gray(reference);

% Initialize camera
%camera = webcam;

% Initialize Arduino board
%arduino_1 = arduino('COM3', 'Uno');
%arduino_2 = arduino('COM4', 'Uno');
%input_pin = 'D2';
%output_pin = 'D3';
%configurePin(arduino_1, input_pin, 'DigitalInput');
%configurePin(arduino_2, output_pin, 'DigitalOutput');

% Initialize feature detector and matcher
detector = detectORBFeatures('MaxFeatures', 5000);
matcher = matchFeatures('BruteForce-Hamming');

% Initialize correlation coefficient threshold
correlation_threshold = 0.9;
correlation_history = [];

%while true
    % Wait for signal from Arduino board
 %   while readDigitalPin(arduino, input_pin) == 0
  %      pause(0.01);
   % end
    
    % Capture image from camera
    %captured = snapshot(camera);
    captured = imread("bright2.jpeg");
    captured_gray = rgb2gray(captured);

    % Detect features and compute descriptors
    reference_keypoints = detector.detect(reference_gray);
    captured_keypoints = detector.detect(captured_gray);
    [reference_descriptors, reference_keypoints] = detector.compute(reference_gray, reference_keypoints);
    [captured_descriptors, captured_keypoints] = detector.compute(captured_gray, captured_keypoints);
    
    % Match features and estimate transformation
    matches = matcher.match(reference_descriptors, captured_descriptors);
    matched_reference_keypoints = reference_keypoints([matches.queryIdx]+1);
    matched_captured_keypoints = captured_keypoints([matches.trainIdx]+1);
    [tform, inlier_captured_keypoints, inlier_reference_keypoints] = cv.estimateAffinePartial2D(...
        [matched_captured_keypoints.Location], [matched_reference_keypoints.Location], 'Method', 'RANSAC');
    
    % Apply transformation and resize images
    output_size = size(reference_gray);
    output_captured = cv.warpAffine(captured_gray, tform, 'OutputSize', output_size);
    output_reference = reference_gray;
    
    % Compute correlation coefficient and update history
    correlation_coefficient = corr2(output_reference, output_captured);
    correlation_history = [correlation_history, correlation_coefficient];
    
    % Check if correlation coefficient is above threshold
    if correlation_coefficient >= max(correlation_threshold, mean(correlation_history) + 2*std(correlation_history))
        % Send signal to Arduino board and log result
        %writeDigitalPin(arduino, output_pin, 1);
        d3 =1;
        fprintf('Can detected\n');
    else
        % Send signal to Arduino board and log result
        d3=0;
        %writeDigitalPin(arduino, output_pin, 0);
        fprintf('No can detected\n');
    end
    
    % Display images and update figure title
    figure(1);
    imshowpair(output_reference, output_captured, 'montage');
    title(sprintf('Correlation coefficient: %.2f', correlation_coefficient));
%end