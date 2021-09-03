%% Satellite parameters
% Inertia
I_x = 91.6*1e-2;
I_y = 25.1*1e-2;
I_z = 100.9*1e-2;
I = [I_x;I_y;I_z];
I_matrix = diag(I);
I_inv = inv(I_matrix);

% CG position
r_CG = [1.8; 0; 0]*1e-2;

%% Initial conditions
om0 = deg2rad([10, -15, 5]');
om0_dot = [0, 0, 0]';

% Starting euler angles (313)
th0_313 = deg2rad(19);
psi0_313 = deg2rad(6);
phi0_313 = deg2rad(9.7);

A_313_0 = [cos(psi0_313)*cos(phi0_313)-sin(psi0_313)*sin(phi0_313)*cos(th0_313)    cos(psi0_313)*sin(phi0_313)+sin(psi0_313)*cos(phi0_313)*cos(th0_313)    sin(psi0_313)*sin(th0_313); ...
        -sin(psi0_313)*cos(phi0_313)-cos(psi0_313)*sin(phi0_313)*cos(th0_313)   -sin(psi0_313)*sin(phi0_313)+cos(psi0_313)*cos(phi0_313)*cos(th0_313)   cos(psi0_313)*sin(th0_313); ...
        sin(phi0_313)*sin(th0_313)                                              -cos(phi0_313)*sin(th0_313)                                             cos(th0_313)];             
    
% Starting euler angles (312)
th0_312 = asin(A_313_0(2,3));
psi0_312 = -atan(A_313_0(1,3)/A_313_0(3,3));
phi0_312 = -atan(A_313_0(2,1)/A_313_0(2,2));

%% Orbit parameters
% Constants
mu_E = 398600;
mu_S = 132712440017.987;
w_E = 2*pi/24/3600;
R_E = 6.3710e3;
R_S = 149597870.691; 
n_sun  = 2*pi/365/24/3600;

% Parameters
orbit.Alt = 800;                      % altitude [km]
orbit.a = R_E + orbit.Alt;            % semi-major axis [km]
orbit.e = 0.1;                        % eccentricity
orbit.i = deg2rad(98.62);             % inclination [rad]
orbit.theta0 = 0;                     % true anomaly [rad]
orbit.n = sqrt(mu_E/orbit.a^3);       % orbit mean motion
orbit.T = 2*pi*sqrt(orbit.a^3/mu_E);  % orbit period [s]

%D_r = [0.05 0.05 0.05]';
mag_ind =  [0.1 0.5 0.1]';


%% SRP perturbation
SRP.F_dsr = 1358;                                       % Direct solar radiation
SRP.F_er = interp1([500 1000],[150 117],orbit.Alt);     % Earth radiation
SRP.F_err = interp1([500 1000],[600 500],orbit.Alt);    % Earth reflected radiation
SRP.F_e = SRP.F_dsr + SRP.F_err + SRP.F_er;

%% Sensors parameters
% Sun sensor (nanoSSOC-D60)
SS.accuracy = 0.5;  %[deg]

% Earth Horizon sensor (MAI-SES)
EH.accuracy = 0.25; %[deg]

% Gyroscope (STIM300)
gyro.t_samp = 1/262;
gyro.sigma_ARW = deg2rad(0.15)/sqrt(3600);      
gyro.sigma_n = gyro.sigma_ARW/sqrt(gyro.t_samp); 
gyro.sigma_RRW = deg2rad(0.0003)/sqrt(3600);   
gyro.sigma_b = gyro.sigma_RRW/sqrt(gyro.t_samp);
gyro.b0 = deg2rad(0.3)/sqrt(3600) * ones(3,1);
gyro.x0 = [0 0 0 0 0 0]';

% Gyroscope  parameters 
gyro.I_r = 1e-7; 
gyro.J_z = 2e-7;
gyro.k = 10;
gyro.c = 0.0028;
gyro.om_r = 100*pi/180;
gyro.alpha = 0.5; %must be <1
%% Thrusters parameters
rA = [0.10 0.10 -0.15]' + r_CG;
rB = [-0.10 0.10 -0.15]' + r_CG;
rC = [-0.10 -0.10 -0.15]' + r_CG;
rD = [0.10 -0.10 -0.15]' + r_CG;

fA1 = [1 0 0]';
fA2 = [0 1 0]';
fA3 = [0 0 -1]';

fB2 = [0 1 0]';
fB1 = [-1 0 0]';
fB3 = [0 0 -1]';

fC1 = [-1 0 0]';
fC2 = [0 -1 0]';
fC3 = [0 0 -1]';

fD2 = [0 -1 0]';
fD1 = [1 0 0]';
fD3 = [0 0 -1]';

thrust.R = [cross(rA,fA1),cross(rA,fA2),cross(rA,fA3),cross(rB,fB1),cross(rB,fB2),cross(rB,fB3),cross(rC,fC1),cross(rC,fC2),cross(rC,fC3),cross(rD,fD1),cross(rD,fD2),cross(rD,fD3)];
thrust.R_pinv = pinv(thrust.R);
thrust.T_min = 10*1e-6;
thrust.T_max = 500*1e-6;
thrust.w = sum(null(thrust.R,'r'),2);
thrust.k1 = 1;
thrust.k2 = 0.0085;
