Fs=100;
g =9.81;
G=[0,0,9.81];
Avalues = table2array( Acceleration); % Acceleration Values
AvaluesX = (Avalues(:,1)); % Acceleration Values for X
AvaluesY = (Avalues(:,2)); % Acceleration Values for y
AvaluesZ = (Avalues(:,3)); % Acceleration Values for Z
mag_acc = sqrt(AvaluesX.^2 + AvaluesY.^2 + AvaluesZ.^2);
Mvalues= table2array(MagneticField);  % Magnetic Field Values
MvaluesX = (Mvalues(:,1)); % Magnetic Field Values for X
MvaluesY = (Mvalues(:,2)); % Magnetic Field Values for y
MvaluesZ = (Mvalues(:,3)); % Magnetic Field Values for z

Vvalues = table2array(AngularVelocity);
ValuesX = (Vvalues(:,1));
ValuesY = (Vvalues(:,2));
ValuesZ = (Vvalues(:,3));

decim = 2;
fuse = ahrsFilter('SampleRate',Fs,'DecimationFactor',decim);
q = fuse(Avalues,Vvalues,Mvalues);

eul = eulerd(q,'ZXY','frame');
Eul = g*cosd(eul);
a_rotated = rotateframe(q, Avalues);
user_acceleration = a_rotated - G;