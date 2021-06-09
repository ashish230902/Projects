# Gravity elimination

## SUMMARY

Data Retrived from sensors
- Accelerometer <br />
- Magnetometer <br />
 - Gyroscope <br />
<br />
The data from all is fused using a AHRS filter to get a orienation of the entire system, which is then used to get the indication of downward dir'. The accelerometer data is then aligned with the recieved quanterion and the vector [0,0,9.81] is subtracted from it, resulting in the linear acceleration of the devie.  <br />

## Data Collection
<br />
The data was collected using the inbuilt feature in the app in the matlab Application. The Frequency if data was set to 100Hz and was taken for 10 second in various orientation for testing. Rest all the data were copied in the variable  '_Values' and furhter divided into three axes.

## AHRS Filter
ahrs filter is an axis kalman filter. Although this method doesnt actually solve for the orientation, but for the error process of ths sytem. Thus Xk is zero so Fk will also be zero and the kalman equation looks like
<br />
<br />
![Screenshot 2021-06-09 085313](https://user-images.githubusercontent.com/75869438/121324356-4815d100-c92e-11eb-936f-aee719e6cebd.png)
<br />
<br />
The entire system is given by the follwing error correction model. The model works in such a way ,that first an estimation is passed to the system for accelerometer and gyroscope,
for which the system then calculate magnetomete, then according to the correction, further error in accelorometer and gyroscope is calculated and this recursive procedure continues.
Attitude and heading refrence system filter has been used instead of complementary filtery or kalman filter, as it's a form of Extended Kalman filter. EKF can work with non linear 
equations as well with much better accuracy compared to regular Kalman Filter as it doesnt have to convert them to linear equation.
<br />
<br />
![Capture](https://user-images.githubusercontent.com/75869438/121325336-2406bf80-c92f-11eb-9f2a-25f60962fda7.PNG)
<br />
<br />
The way we predict the orientation is somewhat like this. 
We calculate the orientation by intially assuming the down direction along the accelerometer and the angular velcoty helps to finalise the orientaation. We later use the
in magnetometer to find the error in orientation and our model get better and better with each recursion.
The magnetometer vector points towarss north in 2D plane but it also bends down in 3D plane due to magnetic fields. We start
by assuming down to be in the direction of acceleration. and calculate rest of the direction by using cross poduct and dot product between the vector. Like east would be the dot
prodcut of magnetometer and Up.
 
 # Calculating Gravity 
 After knowing the orientation quanterion we align the accelerometer aling the quanterion and subtracting the vector [0,0,9.81] indiacting the accelerating due to gravity which 
 we then subtract to the values of accelerometer and we get the value of linear acceleration.

