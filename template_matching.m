clc, clf, clear, close all ;
% Heart rate tracking plot using Template matching

data = 'Dataset/signal1' ;
disp(data) ;
load(data) ; 
fs = 125 ; 
window = 8 * fs ; % window length is 8 seconds
step = 2 * fs ; % step size is 2 seconds
windowNb = (length(sig)-window)/step + 1; % total number of windows(estimates)
% BPMC -> calculated array of heart rate in BPM
% BPM0 -> ground truth value of heart rate in BPM
BPMC = zeros(size(BPM0));

% Choosing Template
nf=1:11;
f1 = exp(nf-5).*(nf<=5);
f2 = -exp(7-nf).*(nf>=7);
cf=(f1+f2);
plot(nf,cf,'LineWidth',2) ; 
title('Template for Template Matching method') ; 

figure ;

for i = 1 : windowNb
curSegment = (i-1)*step+1 : (i-1)*step+window; %the samples that should go
x = sig(curSegment); %the windowed signal
y = xcorr(x,cf) ;
[peaks,N] = findpeaks(y,'MinPeakHeight',.65) ;
diff_sample = N(end) - N(1) + 1 ;
t = diff_sample / fs ;
BPM = (length(N)-1) / t * 60 ;
BPMC(i) = BPM ;
end

%calculate the error in estimating the hear rates 
mean_error = mean(abs(BPMC-BPM0)) ; 
max_error = max(abs(BPMC-BPM0)) ;
fprintf('Mean Error : %.4f\n',mean_error) ;
fprintf('Max Error : %.4f\n',max_error) ;

% Plotting heart rate
plot(BPMC,'color','b','LineWidth',2) , hold on ;
plot(BPM0,'--','color','c','LineWidth',2);
title('Heart Rate Tracking Using "Template Matching" Method');
xlabel('Window number','LineWidth',4);
ylabel('Heart Rate (BPM)','LineWidth',4); ylim([0, 200]);
legend('Estimated Heart Rate','Ground Truth Heart Rate') ;
