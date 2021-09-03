%% Main script %%

%% Initialization and data loading
clear,clc,close all;
addpath(strcat(pwd,'/model'));
run DATA.m
%%	UNCONTROLLED
uncontrolled

dt = 0.1;
t_start = 0;
t_end = orbit.T;
tspan = linspace(t_start,t_end,round((-t_start+t_end)/dt));

set_param('uncontrolled', 'Solver', 'ode15s', 'AbsTol', '1e-8', 'RelTol', '1e-8','StartTime',num2str(t_start),'StopTime', num2str(t_end))

out_uncontrolled = sim('uncontrolled',tspan);

uncontrolled.t              = get(out_uncontrolled,'time');
uncontrolled.om_N_real      = get(out_uncontrolled,'om_N_real');
uncontrolled.EA             = get(out_uncontrolled,'EA');
uncontrolled.error_angle    = get(out_uncontrolled,'error_angle');
uncontrolled.MD_components  = get(out_uncontrolled,'MD_components');

%%	DETUMBLING
detumbling

dt = 0.1;
t_start = 0;
t_end = 2000;
tspan = linspace(t_start,t_end,round((-t_start+t_end)/dt));

set_param('detumbling', 'Solver', 'ode15s', 'AbsTol', '1e-8', 'RelTol', '1e-8', 'StartTime',num2str(t_start),'StopTime', num2str(t_end))

out_detumbling = sim('detumbling',tspan);

detumbling.t                = get(out_detumbling,'time');
detumbling.theta            = get(out_detumbling,'theta');
detumbling.om_N_real        = get(out_detumbling,'om_N_real');
detumbling.om_N_est         = get(out_detumbling,'om_N_est');
detumbling.EA               = get(out_detumbling,'EA');
detumbling.EA_313           = get(out_detumbling,'EA_313');
detumbling.EA_312           = get(out_detumbling,'EA_312');
detumbling.error            = get(out_detumbling,'error');
detumbling.error_angle      = get(out_detumbling,'error_angle');
detumbling.MD_components    = get(out_detumbling,'MD_components');
detumbling.b_gyro           = get(out_detumbling,'b_gyro');
detumbling.x_gyro           = get(out_detumbling,'x_gyro');
detumbling.A_BN             = get(out_detumbling,'A_BN');
detumbling.thrust           = get(out_detumbling,'thrust_level');
detumbling.MC_real          = get(out_detumbling,'MC_real');
detumbling.MC_ideal         = get(out_detumbling,'MC_ideal');

%%	SLEW
% initial conditions
orbit.theta0 = detumbling.theta(end);
om0 = detumbling.om_N_real(end,:)';
th0_313 = detumbling.EA_313(end,2);
psi0_313 = detumbling.EA_313(end,3);
phi0_313 = detumbling.EA_313(end,1);
th0_312 = detumbling.EA_312(end,2);
psi0_312 = detumbling.EA_312(end,3);
phi0_312 = detumbling.EA_312(end,1);
gyro.b0 = detumbling.b_gyro(end,:)';
gyro.x0 = detumbling.x_gyro(end,:)';
%dcm0 = detumbling.A_BN(:,:,end);

slew

dt = 0.1;
t_start = 2000;
t_end = t_start + 400;
tspan = linspace(t_start,t_end,round((-t_start+t_end)/dt));

set_param('slew', 'Solver', 'ode15s', 'AbsTol', '1e-8', 'RelTol', '1e-8', 'StartTime',num2str(t_start),'StopTime', num2str(t_end))

out_slew = sim('slew',tspan);

slew.t                      = get(out_slew,'time');
slew.theta                  = get(out_slew,'theta');
slew.om_N_real              = get(out_slew,'om_N_real');
slew.om_N_est               = get(out_slew,'om_N_est');
slew.EA                     = get(out_slew,'EA');
slew.EA_313                 = get(out_slew,'EA_313');
slew.EA_312                 = get(out_slew,'EA_312');
slew.error                  = get(out_slew,'error');
slew.error_angle            = get(out_slew,'error_angle');
slew.MD_components          = get(out_slew,'MD_components');
slew.b_gyro                 = get(out_slew,'b_gyro');
slew.x_gyro                 = get(out_slew,'x_gyro');
slew.A_BN                   = get(out_slew,'A_BN');
slew.thrust                 = get(out_slew,'thrust_level');
slew.MC_real                = get(out_slew,'MC_real');
slew.MC_ideal               = get(out_slew,'MC_ideal');

%%	pointing
% initial conditions
orbit.theta0 = slew.theta(end);
om0 = slew.om_N_real(end,:)';
th0_313 = slew.EA_313(end,2);
psi0_313 = slew.EA_313(end,3);
phi0_313 = slew.EA_313(end,1);
th0_312 = slew.EA_312(end,2);
psi0_312 = slew.EA_312(end,3);
phi0_312 = slew.EA_312(end,1);
gyro.b0 = slew.b_gyro(end,:)';
gyro.x0 = slew.x_gyro(end,:)';
%dcm0 = slew.A_BN(:,:,end);
thrust.k1 = 1;
thrust.k2 = 0.02;

pointing

dt = 0.1;
t_start = 2400;
t_end = t_start + 2*orbit.T;
tspan = linspace(t_start,t_end,round((-t_start+t_end)/dt));

set_param('pointing', 'Solver', 'ode15s', 'AbsTol', '1e-8', 'RelTol', '1e-8', 'StartTime',num2str(t_start),'StopTime', num2str(t_end))

out_pointing = sim('pointing',tspan);

pointing.t                  = get(out_pointing,'time');
pointing.theta              = get(out_pointing,'theta');
pointing.om_N_real          = get(out_pointing,'om_N_real');
pointing.om_N_est           = get(out_pointing,'om_N_est');
pointing.EA                 = get(out_pointing,'EA');
pointing.EA_313             = get(out_pointing,'EA_313');
pointing.EA_312             = get(out_pointing,'EA_312');
pointing.error              = get(out_pointing,'error');
pointing.error_angle        = get(out_pointing,'error_angle');
pointing.MD_components      = get(out_pointing,'MD_components');
pointing.b_gyro             = get(out_pointing,'b_gyro');
pointing.x_gyro             = get(out_pointing,'x_gyro');
pointing.A_BN               = get(out_pointing,'A_BN');
pointing.thrust             = get(out_pointing,'thrust_level');
pointing.MC_real            = get(out_pointing,'MC_real');
pointing.MC_ideal           = get(out_pointing,'MC_ideal');

%% Results plots
run plots.m