Fs=100;
x = [1:388]';
G=[0,0,9.81];
Avalues = table2array( Acceleration); % Acceleration Values
AvaluesX = (Avalues(:,1)); % Acceleration Values for X
AvaluesY = (Avalues(:,2)); % Acceleration Values for y
AvaluesZ = (Avalues(:,3)); % Acceleration Values for Z

Mvalues= table2array(MagneticField);  % Magnetic Field Values
MvaluesX = (Mvalues(:,1)); % Magnetic Field Values for X
MvaluesY = (Mvalues(:,2)); % Magnetic Field Values for y
MvaluesZ = (Mvalues(:,3)); % Magnetic Field Values for z

Vvalues = table2array(AngularVelocity);
ValuesX = (Vvalues(:,1));
ValuesY = (Vvalues(:,2));
ValuesZ = (Vvalues(:,3));

fuse = ahrsfilter('SampleRate',Fs,'DecimationFactor', 2);
q = fuse(Avalues,Vvalues,Mvalues);
n=2 ;
q=repmat(q,1,n)';
q=q(:)'


a_rotated = rotateframe(q, Avalues);
user_acceleration = a_rotated - G;

figure

plot(x,AvaluesX,x,user_acceleration(:,1))
title(' X-Axis')
legend({'y = Accelerometer','y = Linear acceleration'})

figure

plot(x,AvaluesY,x,user_acceleration(:,2))
title('Y-Axis')
legend({'y = Accelerometer','y = Linear acceleration'})

figure

plot(x,AvaluesZ,x,user_acceleration(:,3))
title('Z-Axis')
legend({'y = Accelerometer','y = Linear acceleration'})
