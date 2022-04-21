%Lab3
%Group 3
clear; clc;
%% allocation
m=5; %mass of cannon ball (kg)
D=-0.02; %drag coefficent
theta=20; %launch angle (deg)
y0=0; %launch height (m)
v0=100; %initial velocity (m/s)

%% link matlab to simulink
s=sim('cannon','StopTime','25','MaxStep','0.01'); %run cannon.slx
r=s.get('simout'); %call the get method from class s
x=r(:,1); %define x pos
y=r(:,2); %define y pos

%% plot results
L=find(y>=0); %is launch height +
figure(1);
plot(x(L),y(L),'DisplayName',[num2str(theta),'deg']);
axis([0 350 0 150]);
title({'Trajectory of cannon ball'});
txt=sprinf('Ball stoped ad x=%0.1f m',x(length(L)));
text(max(x)/3,max(y)/5,txt);

