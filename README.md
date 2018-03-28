# Heart-Rate-Tracking
## Heart rate tracking using window method and template matching.
Two diffrent ways are used to calculate heart rate in BPM (bit per minute). The first one is window method and the second one is template matching method. There are two dataset of EEG signal in the Dataset folder signal1 and signal2 of a person who is running in a treadmill. The signal is sampled at 125Hz for approximately 5 minutes. 
## Window Method
In window method, each window is chosen for 8 seconds and thus contains 1000 samples and step size for each window is 2 seconds. So, first window is for samples of 0 to 8s, second window is for 2s to 10s and so on.
The formula to calculate heart rate is:
$$
Heart rate in BPM = /frac{/(N-1)}{tN}
$$
