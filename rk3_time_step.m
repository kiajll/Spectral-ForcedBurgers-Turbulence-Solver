function du_dt=RHS_FFT_RK_NON(nu,Lx,kx_m,u)
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

ddu_hat_ddx = -(kx_m.^2).*u_hat;
ddu_ddx = ifft(ddu_hat_ddx);

%% 3/2 rule
nonlinear_term_hat = AntiAlias_ZeroPadding(u_hat,Lx);
nonlinear_term = ifft(nonlinear_term_hat);
du_dt = nonlinear_term + nu.*ddu_ddx ;

%%
end
