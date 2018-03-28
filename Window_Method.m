clc, clf, clear, close all ;
% Md Mahmudul Alam
% github.com/MahmudulAlam
% Heart Rate Tracking Plot using calculating heart rate for each window

load('Dataset/signal1') ; 
fs = 125 ;
window = 8 * fs ; % window length is 8 seconds
step = 2 * fs ; % step size is 2 seconds
windowNb = (length(sig)-window)/step + 1 ; % total number of windows(estimates)
% BPMC -> calculated array of heart rate in BPM
% BPM0 -> ground truth value of heart rate in BPM
BPMC = zeros(size(BPM0));

for i = 1 : windowNb
curSegment = (i-1)*step+1 : (i-1)*step+window ; %the samples that should go
x = sig(curSegment) ; %the windowed signal
x = -x ; % Inverting signal
threshold = mean(x) + .245 ; % Threshold is chosen by 
[peaks,N] = findpeaks(x,'MinPeakHeight',threshold) ;
% Calculating BPM
diff_sample = N(end) - N(1) + 1 ;
t = diff_sample / fs ;
BPM = (length(N)-1) / t * 60 ;
BPMC(i) = BPM ;
end
%calculate the error in estimating the heart rates
error = BPM0 - BPMC ;
%A good implementation should have mean error less than 0.2
mean_error = mean(abs(BPMC-BPM0)) ; 
%A good implementation should have max error less than 0.5
max_error = max(abs(BPMC-BPM0)) ;
fprintf('Mean Error : %.4f\n',mean_error) ;
fprintf('Max Error : %.4f\n',max_error) ;

plot(BPMC,'LineWidth',2) , hold on ;
plot(BPM0,'--','color','r','LineWidth',2); 
title('Heart Rate Tracking Using "Window Method"');
xlabel('Window number','LineWidth',4);
ylabel('Heart Rate (BPM)','LineWidth',4); ylim([0, 200]);
legend('Estimated Heart Rate','Ground Truth Heart Rate')