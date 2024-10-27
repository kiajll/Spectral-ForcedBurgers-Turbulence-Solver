function [Ek, TKE, Dk, epsilon]  = Energy_spectrum(nu,kx_m,uhat)
%##########################################################################
%##                                                                      ##
%##                ***Energy spectrum in Fourier space***                ##
%##                                                                      ##
%##                      written by Kiarash Jalali                       ##
%##                       kiarashjalali@gmail.com                        ##
%##        École de Technologie Supérieure, Montréal, Québec, CANADA     ##
%##                         Dept. Génie Mécanique                        ##
%##                              Fall 2021                               ##
%##                                                                      ##
%##########################################################################
%
%% 01.Compute half-Energy spectrum in Fourier space
nn = length(uhat);
Ek (1,1) = (abs(uhat(1))^2)./nn;
Ek (1,2: nn)= 2*((abs(uhat(2: nn)).^2)./ nn);        %abs(complex num) = sqrt(uhat.*conj(uhat))

%% 02.Compute Total kinetic energy in Fourier space
TKE = 1/2*sum(Ek(1,1:nn));  

%% 03.Compute energy dissipation in Fourier space 
Dk = 2*nu*(kx_m.^2).*Ek(1:nn);                       % The rate at which energy is dissipated by wavenumber k (girimaji1995)
epsilon = sum(Dk); 

end
