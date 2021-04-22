% %Name: Yousef Nour
% %Elec 4700 PA3 MCPA

set(0,'DefaultFigureWindowStyle', 'docked')
set(0,'defaultaxesfontsize', 20)
set(0, 'defaultaxesfontname', 'Times New Roman')
set(0,'DefaultLineLineWidth', 2);

close all
clear all 
clc

v = 0; % velocity
x = 0; % postion 
 
Force = 1 ;
mass  = 1 ;
dT = 1 ; % difference in time 

num_steps = 500; % iterations
np  = 1;
% intialize
v = zeros (np,1); % velocity vector
x = zeros (np,1); % postion vector
time = 0; % time

%re = 0;
for i = 2: num_steps
    time(i) = time(i-1)+dT;
    
    v(:,i) = v(:,i-1) + Force/mass*dT;
    x(:,i) = x(:,i-1) + v(:,i-1)*dT + Force/mass*dT^2/2;
    
    randVal = rand(np,1) < 0.05;
    % v(randVal,i) = re * v(randVal,i);
    v(randVal,i) = 0; %restart the velocity 
    AvgVel (i,:) = mean (v,2);
    
    subplot (3,1,1)
    plot (time, v, 'r-');
    hold on
    subplot (3,1,1)
    plot (time, AvgVel, 'b*');
    hold off 
    xlabel('Time')
    ylabel ('x')
    title (['Average velocity:' num2str(AvgVel(i))])
    
    subplot (3,1,2)
    plot (x(1,:),v(1,:),'r-');
    hold on
    subplot(3,1,2)
    plot (x(1,:),AvgVel,'g*');
    hold off
    xlabel ('x')
    ylabel ('y')
    
    
    subplot (3,1,3)
    plot (time, x, '-');
    xlabel('time')
    ylabel('x')
    
    pause(0.01)
end 

fprintf('Average Vocity is: %4.2f \n', mean(v))