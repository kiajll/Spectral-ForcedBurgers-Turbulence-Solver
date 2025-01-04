function du_dt=RHS_FFT_rk3(nu,Lx,kx_m,u)
%##########################################################################
%##                                                                      ##
%##                  ***Solving PDE in Fourier space***                  ##
%##                                                                      ##
%##                      written by Kiarash Jalali                       ##
%##                       kiarashjalali@gmail.com                        ##
%##        École de Technologie Supérieure, Montréal, Québec, CANADA     ##
%##                         Dept. Génie Mécanique                        ##
%##                               Fall 2021                              ##
%##                                                                      ##
%##########################################################################
u_hat = fft(u);

%% Diffusion term
ddu_hat_ddx = -(kx_m.^2).*u_hat;
ddu_ddx = ifft(ddu_hat_ddx);

%% Advection term
nonlinear_term_hat = AntiAlias_ZeroPadding(u_hat,Lx);
nonlinear_term = ifft(nonlinear_term_hat);

%% Total RHS term 
du_dt = nonlinear_term + nu.*ddu_ddx ;        % in physical space

%%
end
