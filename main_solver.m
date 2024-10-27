%##########################################################################
%##                                                                      ##
%##           Forced Burgers'turbulence with wiener random data          ##
%##              (as initial velocity field and forcing term)            ##
%##                                                                      ##
%##                      written by Kiarash Jalali                       ##
%##                       kiarashjalali@gmail.com                        ##
%##        École de Technologie Supérieure, Montréal, Québec, CANADA     ##
%##                         Dept. Génie Mécanique                        ##
%##                               Fall 2021                              ##
%##                                                                      ##
%##########################################################################
%
clear all, close all, clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Pre-Processing stage %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 01.Define Domain Length
Lx = 1;                       % Length of Domain Function
% 02.Inject Initial velocity field
u_x0 = readmatrix(Initial_Velocity_Field.txt);
N = Length(u_x0);             % Number of points in the spatial domain
u = u_x0;
u(1,N+1) = u(1,1);            % Periodic Domain condition
% 03.Spatial Discretization
dx = Lx/N; 
x_min = -Lx/2;
x_max = Lx/2;
x = linspace(x_min, x_max, N + 1);
% 04. Inject Forcing field evolved in time
F_xt = readmatrix(Force_field.txt);
[Nt,Nx]=size(F_xt);
% 05.Time Discretization
tf = 1;                       % Final Time
dt = round(tf/Nt-1);          % Time step
t_min = 0;
t_max = 1;                    % No periodicity in time
t = linspace(t_min, t_max, Nt);
% 06.Define Kinematic Viscosity
a = 1;                        % Convective velocity
nu = a/100;                   % Kinematic viscosity (1,10,100,1000,10000)..........................change it
%% 07.Define wave number for the test function 
m = -N/2:(N/2)-1;             % harmonic number for the test function
kx_m = (m*2*pi/Lx);           % wave number for the test function
kx_m = fftshift(kx_m);        % Re-order fft wavenumbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Processing stage %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k = 1:Nt  
    format long
    t = k*dt;
    disp(t)
    ff = F_xt(1:N,k);
 
    u1 = u(1:N);
    R1 = rk3_time_step(nu,Lx,kx_m,u1) + ff;
    
    u2 = u1 + (dt/2)*R1;
    R2 = rk3_time_step(nu,Lx,kx_m,u2) + ff;
    
    u3 = u1 + (3*dt/4)*R2;
    R3 = rk3_time_step(nu,Lx,kx_m,u3) + ff;
    
    u = u1 + (dt/9)*( 2*R1 + 3*R2 + 4*R3 );   
    u (1,N+1) = u(1,1);       % Periodic Domain condition
       
uhat = fft(u(1:N));   
[Ek, TKE, Dk, epsilon] = Energy_spectrum(nu,kx_m(1:N/2),uhat(1:N/2));


end

