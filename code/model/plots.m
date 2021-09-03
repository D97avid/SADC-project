%% Uncontrolled
figure()
subplot(2,1,1)
plot(uncontrolled.t,uncontrolled.om_N_real(:,1),'LineWidth',2);
hold on
plot(uncontrolled.t,uncontrolled.om_N_real(:,2),'LineWidth',2);
hold on
plot(uncontrolled.t,uncontrolled.om_N_real(:,3),'LineWidth',2);
grid on
legend('\omega_{x}','\omega_{y}','\omega_{z}')
title('Angular velocity')
xlim([0 uncontrolled.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [rad/s]')
subplot(2,1,2)
plot(uncontrolled.t,uncontrolled.om_N_real(:,1),'LineWidth',2);
hold on
plot(uncontrolled.t,uncontrolled.om_N_real(:,2),'LineWidth',2);
hold on
plot(uncontrolled.t,uncontrolled.om_N_real(:,3),'LineWidth',2);
grid on
legend('\omega_{x}','\omega_{y}','\omega_{z}')
title('Angular velocity')
xlim([0 1000])
xlabel('Time [s]')
ylabel('Magnitude [rad/s]')

figure()
plot(uncontrolled.t,rad2deg(uncontrolled.EA(:,1)),'LineWidth',1);
hold on
plot(uncontrolled.t,rad2deg(uncontrolled.EA(:,2)),'LineWidth',1);
hold on
plot(uncontrolled.t,rad2deg(uncontrolled.EA(:,3)),'LineWidth',1);
grid on
legend('\phi','\theta','\psi')
title('Euler angles')
xlim([0 uncontrolled.t(end)])
ylim([-180 180])
xlabel('Time [s]')
ylabel('Magnitude [deg]')

figure()
plot(uncontrolled.t,uncontrolled.MD_components(:,1),'LineWidth',2);
hold on
plot(uncontrolled.t,uncontrolled.MD_components(:,2),'LineWidth',2);
hold on
plot(uncontrolled.t,uncontrolled.MD_components(:,3),'LineWidth',2);
grid on
legend('M_{GG}','M_{SRP}','M_{MAG}')
title('Disturbing Torques')
xlim([0 uncontrolled.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [N \cdot m]')

figure()
plot(uncontrolled.t,uncontrolled.error_angle,'LineWidth',4);
grid on
title('Pointing error')
xlim([uncontrolled.t(1) uncontrolled.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [deg]')

%% Detumbling
figure()
plot(detumbling.t,detumbling.om_N_real(:,1),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.om_N_real(:,2),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.om_N_real(:,3),'LineWidth',2);
grid on
legend('\omega_{x}','\omega_{y}','\omega_{z}')
title('Angular velocity')
xlim([0 detumbling.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [rad/s]')

figure()
plot(detumbling.t,rad2deg(detumbling.EA(:,1)),'LineWidth',2);
hold on
plot(detumbling.t,rad2deg(detumbling.EA(:,2)),'LineWidth',2);
hold on
plot(detumbling.t,rad2deg(detumbling.EA(:,3)),'LineWidth',2);
grid on
legend('\phi','\theta','\psi')
title('Euler angles')
xlim([0 detumbling.t(end)])
ylim([-185 185])
xlabel('Time [s]')
ylabel('Magnitude [deg]')

figure()
plot(detumbling.t,detumbling.thrust(:,1),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,2),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,3),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,4),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,5),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,6),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,7),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,8),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,9),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,10),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,11),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.thrust(:,12),'LineWidth',2);
grid on
title('Thrust level')
xlim([detumbling.t(1) detumbling.t(end)])
ylim([0 100])
xlabel('Time [s]')
ylabel('Thrust [%]')

figure()
plot(detumbling.t,detumbling.MC_real(:,1),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.MC_real(:,2),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.MC_real(:,3),'LineWidth',2);
grid on
legend('{Mc}_{x}','{Mc}_{y}','{Mc}_{z}')
title('Control torque')
xlim([0 detumbling.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [N m]')

figure()
plot(detumbling.t,squeeze(detumbling.error_angle),'LineWidth',4);
grid on
title('Pointing error')
xlim([detumbling.t(1) detumbling.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [deg]')

figure()
plot(detumbling.t,detumbling.MC_ideal(:,1)-detumbling.MC_real(:,1),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.MC_ideal(:,2)-detumbling.MC_real(:,2),'LineWidth',2);
hold on
plot(detumbling.t,detumbling.MC_ideal(:,3)-detumbling.MC_real(:,3),'LineWidth',2);
grid on
legend('{Mc}_{x}','{Mc}_{y}','{Mc}_{z}')
title('Control torque error')
xlim([detumbling.t(1) detumbling.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [N m]')
%% Slew
figure()
plot(slew.t,slew.om_N_real(:,1),'LineWidth',2);
hold on
plot(slew.t,slew.om_N_real(:,2),'LineWidth',2);
hold on
plot(slew.t,slew.om_N_real(:,3),'LineWidth',2);
grid on
legend('\omega_{x}','\omega_{y}','\omega_{z}')
title('Angular velocity')
xlim([slew.t(1) slew.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [rad/s]')

figure()
plot(slew.t,rad2deg(slew.EA(:,1)),'LineWidth',2);
hold on
plot(slew.t,rad2deg(slew.EA(:,2)),'LineWidth',2);
hold on
plot(slew.t,rad2deg(slew.EA(:,3)),'LineWidth',2);
grid on
legend('\phi','\theta','\psi')
title('Euler angles')
xlim([slew.t(1) slew.t(end)])
ylim([-185 185])
xlabel('Time [s]')
ylabel('Magnitude [deg]')

figure()
plot(slew.t,slew.error_angle,'LineWidth',4);
grid on
title('Pointing error')
xlim([slew.t(1) slew.t(end)])
ylim([0 120])
xlabel('Time [s]')
ylabel('Magnitude [deg]')

figure()
plot(slew.t,squeeze(slew.error(1,1,:)),'LineWidth',2);
hold on
plot(slew.t,squeeze(slew.error(1,2,:)),'LineWidth',2);
hold on
plot(slew.t,squeeze(slew.error(1,3,:)),'LineWidth',2);
hold on
plot(slew.t,squeeze(slew.error(2,1,:)),'LineWidth',2);
hold on
plot(slew.t,squeeze(slew.error(2,2,:)),'LineWidth',2);
hold on
plot(slew.t,squeeze(slew.error(2,3,:)),'LineWidth',2);
hold on
plot(slew.t,squeeze(slew.error(3,1,:)),'LineWidth',2);
hold on
plot(slew.t,squeeze(slew.error(3,2,:)),'LineWidth',2);
hold on
plot(slew.t,squeeze(slew.error(3,3,:)),'LineWidth',2);
grid on
title('Attitude matrix error')
xlim([slew.t(1) slew.t(end)])
ylim([-1.5 1.5])
xlabel('Time [s]')
ylabel('Magnitude [-]')

figure()
plot(slew.t,slew.thrust(:,1),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,2),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,3),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,4),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,5),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,6),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,7),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,8),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,9),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,10),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,11),'LineWidth',2);
hold on
plot(slew.t,slew.thrust(:,12),'LineWidth',2);
grid on
title('Thrust level')
xlim([slew.t(1) slew.t(end)])
ylim([0 100])
xlabel('Time [s]')
ylabel('Thrust [%]')

figure()
plot(slew.t,slew.MC_real(:,1),'LineWidth',2);
hold on
plot(slew.t,slew.MC_real(:,2),'LineWidth',2);
hold on
plot(slew.t,slew.MC_real(:,3),'LineWidth',2);
grid on
legend('{Mc}_{x}','{Mc}_{y}','{Mc}_{z}')
title('Control torque')
xlim([slew.t(1) slew.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [N m]')

figure()
plot(slew.t,slew.MC_ideal(:,1)-slew.MC_real(:,1),'LineWidth',2);
hold on
plot(slew.t,slew.MC_ideal(:,2)-slew.MC_real(:,2),'LineWidth',2);
hold on
plot(slew.t,slew.MC_ideal(:,3)-slew.MC_real(:,3),'LineWidth',2);
grid on
legend('{Mc}_{x}','{Mc}_{y}','{Mc}_{z}')
title('Control torque error')
xlim([slew.t(1) slew.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [N m]')
%% Pointing
figure()
plot(pointing.t,pointing.om_N_real(:,1),'LineWidth',2);
hold on
plot(pointing.t,pointing.om_N_real(:,2),'LineWidth',2);
hold on
plot(pointing.t,pointing.om_N_real(:,3),'LineWidth',2);
hold on
plot(pointing.t,orbit.n*ones(1,length(pointing.t)),'LineWidth',2);
grid on
legend('\omega_{x}','\omega_{y}','\omega_{z}','n')
title('Angular velocity')
xlim([pointing.t(1) pointing.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [rad/s]')

figure()
plot(pointing.t,rad2deg(pointing.EA(:,1)),'LineWidth',2);
hold on
plot(pointing.t,rad2deg(pointing.EA(:,2)),'LineWidth',2);
hold on
plot(pointing.t,rad2deg(pointing.EA(:,3)),'LineWidth',2);
grid on
legend('\phi','\theta','\psi')
title('Euler angles')
xlim([pointing.t(1) pointing.t(end)])
ylim([-185 185])
xlabel('Time [s]')
ylabel('Magnitude [deg]')

figure()
plot(pointing.t,pointing.error_angle,'LineWidth',4);
grid on
title('Pointing error')
xlim([pointing.t(1) pointing.t(end)])
ylim([0 1])
xlabel('Time [s]')
ylabel('Magnitude [deg]')

figure()
plot(pointing.t,squeeze(pointing.error(1,1,:)),'LineWidth',2);
hold on
plot(pointing.t,squeeze(pointing.error(1,2,:)),'LineWidth',2);
hold on
plot(pointing.t,squeeze(pointing.error(1,3,:)),'LineWidth',2);
hold on
plot(pointing.t,squeeze(pointing.error(2,1,:)),'LineWidth',2);
hold on
plot(pointing.t,squeeze(pointing.error(2,2,:)),'LineWidth',2);
hold on
plot(pointing.t,squeeze(pointing.error(2,3,:)),'LineWidth',2);
hold on
plot(pointing.t,squeeze(pointing.error(3,1,:)),'LineWidth',2);
hold on
plot(pointing.t,squeeze(pointing.error(3,2,:)),'LineWidth',2);
hold on
plot(pointing.t,squeeze(pointing.error(3,3,:)),'LineWidth',2);
grid on
title('Attitude matrix error')
xlim([pointing.t(1) pointing.t(end)])
ylim([-0.1 1.1])
xlabel('Time [s]')
ylabel('Magnitude [-]')

figure()
plot(pointing.t,pointing.thrust(:,1),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,2),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,3),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,4),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,5),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,6),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,7),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,8),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,9),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,10),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,11),'LineWidth',2);
hold on
plot(pointing.t,pointing.thrust(:,12),'LineWidth',2);
grid on
title('Thrust level')
xlim([pointing.t(1) pointing.t(end)])
ylim([0 100])
xlabel('Time [s]')
ylabel('Thrust [%]')

figure()
plot(pointing.t,pointing.MC_real(:,1),'LineWidth',2);
hold on
plot(pointing.t,pointing.MC_real(:,2),'LineWidth',2);
hold on
plot(pointing.t,pointing.MC_real(:,3),'LineWidth',2);
grid on
legend('{Mc}_{x}','{Mc}_{y}','{Mc}_{z}')
title('Control torque')
xlim([pointing.t(1) pointing.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [N m]')

figure()
plot(pointing.t,pointing.MC_ideal(:,1)-pointing.MC_real(:,1),'LineWidth',2);
hold on
plot(pointing.t,pointing.MC_ideal(:,2)-pointing.MC_real(:,2),'LineWidth',2);
hold on
plot(pointing.t,pointing.MC_ideal(:,3)-pointing.MC_real(:,3),'LineWidth',2);
grid on
legend('{Mc}_{x}','{Mc}_{y}','{Mc}_{z}')
title('Control torque error')
xlim([pointing.t(1) pointing.t(end)])
xlabel('Time [s]')
ylabel('Magnitude [N m]')