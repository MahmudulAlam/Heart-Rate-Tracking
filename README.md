# Heart-Rate-Tracking
## Heart rate tracking using window method and template matching.
Two diffrent ways are used to calculate heart rate in BPM (bit per minute). The first one is window method and the second one is template matching method. There are two dataset of EEG signal in the Dataset folder signal1 and signal2 of a person who is running in a treadmill. The signal is sampled at 125Hz for approximately 5 minutes. 

## Window Method
In window method, each window is chosen for 8 seconds and thus contains 1000 samples and step size for each window is 2 seconds. So, first window is for samples of 0 to 8s, second window is for 2s to 10s and so on.

The formula to calculate heart rate is in BPM:
![formula](https://user-images.githubusercontent.com/37298971/38023268-a56c4098-32a3-11e8-972a-0453ea25062a.png)

First 8s of heart rate:
![image](https://user-images.githubusercontent.com/37298971/38023398-062d5b42-32a4-11e8-801d-6dca9549f62c.png)

In identification of peaks, threshold plays an important role. Comparing with the threshold value peaks can be selected. If the ECG signal surpassed threshold value we will count that as a peak. There are small length peaks in the upper portion and large peaks in the lower portion of EEG signal. So, it will be preferable to select the peaks in the lower portion of the figures. After inverting all the signals, we can use matlab built-in function findpeaks() using threshold value: mean of signal + .245 ; 
