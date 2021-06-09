Fs=100; %Data Rate
G=[0,0,9.81]; %Defining Acceleration Vector
Avalues = table2array( Acceleration); % Acceleration Values
AvaluesX = (Avalues(:,1)); % Acceleration Values for X
AvaluesY = (Avalues(:,2)); % Acceleration Values for y
AvaluesZ = (Avalues(:,3)); % Acceleration Values for Z
mag_acc = sqrt(AvaluesX.^2 + AvaluesY.^2 + AvaluesZ.^2);
Mvalues= table2array(MagneticField);  % Magnetic Field Values
MvaluesX = (Mvalues(:,1)); % Magnetic Field Values for X
MvaluesY = (Mvalues(:,2)); % Magnetic Field Values for y
MvaluesZ = (Mvalues(:,3)); % Magnetic Field Values for z

Vvalues = table2array(AngularVelocity);  % Angular Velocity Values
ValuesX = (Vvalues(:,1));   % Angular Velocity Values X
ValuesY = (Vvalues(:,2));   % Angular Velocity Values Y
ValuesZ = (Vvalues(:,3));   % Angular Velocity Values Z

decim = 2;
fuse = ahrsFilter('SampleRate',Fs,'DecimationFactor',decim); %Applying AHRS filter to calculate the orientation
q = fuse(Avalues,Vvalues,Mvalues);

a_rotated = rotateframe(q, Avalues);% rotating measured accelration along earth's orientation
user_acceleration = a_rotated - G; % calculated Linear Acceleration
