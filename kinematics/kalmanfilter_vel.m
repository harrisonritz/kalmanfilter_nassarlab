function dat=kalmanfilter(t,inp);
% Here's the matlab code - hope it makes sense - we run this on the encoder
% values and I have lost th epape which say why we choose Q this way 
% Best wishes
% Daniel 
% t is the time stamp of the input;
% inp  is the one dimensional input
% Kalman filter settings
w=30;  % sd in acceleration per time interval
v=0.0005; % sd in radian position reading due to observation noise
dt=0.001; %average time interval between samples

% fixed matrices
H=[1 0]; % observation
Q=[(dt^4)/4 (dt^3)/2; (dt^3)/2 (dt^2)]*w^2; % covariance
R=[v^2]; % observation noise

% set start values
x=[inp(1); 0]; % pos and vel
P=Q;
dat(1,:)=[inp(1) x' P(:)'];


for k=1:length(inp)-1
    dt= t(k+1)-t(k); %time change
    z= inp(k+1);   %encoder valuePm
    Q=[(dt^4)/4 (dt^3)/2; (dt^3)/2 (dt^2)]*w^2; % covariance

    A=[1 dt; 0 1];
    xm=A*x;
    Pm=A*P*A'+Q;

    K=Pm*H' * inv(H*Pm*H'+R);
    x=xm+K*(z-H*xm);
    P=(eye(2)-K*H)*Pm;
    dat(k+1,:)=[inp(k+1) x' P(:)'];
end
