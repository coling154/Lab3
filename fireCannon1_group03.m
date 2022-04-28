%Lab3
%Group 3
clear; clc;
%% allocation
m=5; %mass of cannon ball (kg)
D=-0.02; %drag coefficent
%theta=20; %launch angle (deg)
y0=0; %launch height (m)
v0=100; %initial velocity (m/s)
thetas=15:5:45;
for i=1:length(thetas)
    %% link matlab to simulink
    theta=thetas(i);
    s=sim('cannon4_group03.slx','StopTime','25','MaxStep','0.01'); %run cannon4.slx
    r=s.get('simout'); %call the get method from class s
    x=r(:,1); %define x pos
    y=r(:,2); %define y pos
    
    %% plot results
    L=find(y>=0); %is launch height +
    figure(1);
    plot(x(L),y(L),'DisplayName',[num2str(theta),'deg']);
    hold on;
    %txt=sprintf('Ball stoped at x=%0.1f m',x(length(L)));
    %text(max(x)/3,max(y)/5,txt);
end
hold off;
legend show;
axis([0 350 0 150]);
title({'Trajectory of cannon ball'});


