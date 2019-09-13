## Heart Rate Tracking
### Heart rate tracking using the window method and template matching
To calculate the heart rate in bit per minute (BPM) two different methods are employed and compared. The first method is the windowing method and the second one is the template matching. There are two datasets of ECG signal in the ```Dataset``` folder ```signal1``` and ```signal2``` of a person who is running in a treadmill. The signal is sampled at 125Hz for approximately 5 minutes. 

### Window Method
In the window method, each window is chosen for 8 seconds and thus contains 1000 samples and step size for each window is 2 seconds. So, the first window is for samples of 0 to 8s, the second window is from 2s to 10s and so on.

The formula to calculate heart rate is in BPM:
![formula](https://user-images.githubusercontent.com/37298971/38023268-a56c4098-32a3-11e8-972a-0453ea25062a.png)

```
First 8s of ECG signal:
```

![signal](https://user-images.githubusercontent.com/37298971/38024449-dc621cd2-32a6-11e8-9023-d71b1f17fd6e.jpg)

In the identification of peaks, threshold plays an important role. Comparing with the threshold value peaks can be selected. If the ECG signal surpassed threshold value we will count that as a peak. As there are small length peaks along with large peaks in the upper portion and only large peaks in the lower portion of ECG signal so, it will be preferable to select the peaks in the lower portion of the figures. After inverting all the signals, we can use Matlab built-in function findpeaks() using a ```threshold value = mean of the signal in a window + constant```. The constant is empirically chosen as 0.245. 

Here is the estimated heart rate in BPM along with ground truth for signal1 in ```Window Method```:
![window method](https://user-images.githubusercontent.com/37298971/38024509-0d8cdd10-32a7-11e8-911a-3255df6ff631.png)

### Template Matching
Template matching is popular for image processing which is two dimensional but we can use template matching for one dimensional ECG signal. In the calculation of heart rate, we want to find out the R peak in the QRS complex. Using cross-correlation between a template which is close to QRS complex and ECG signal we can find out the R peaks in better accuracy. For template matching following template is chosen:

![template](https://user-images.githubusercontent.com/37298971/38024602-621f45ca-32a7-11e8-97af-4572cf3d10f3.png)

Here is the estimated heart rate in BPM along with ground truth for signal1 in ```Template Matching``` method:
![template matching](https://user-images.githubusercontent.com/37298971/38024773-bdf4d496-32a7-11e8-83f3-824771effe9c.png)

Template matching is much more accurate than the Window Method. The accuracy of the template matching method accuracy is ```99%```.
