%% Aliasing removal by zero padding (3/2-rule)
function nonlinear_term_hat = AntiAlias_ZeroPadding(u_hat,Lx)
%##########################################################################
%##                                                                      ##
%##            ***Aliasing removal by zero padding (3/2-rule)***         ##
%##                                                                      ##
%##                      written by Kiarash Jalali                       ##
%##                       kiarashjalali@gmail.com                        ##
%##        École de Technologie Supérieure, Montréal, Québec, CANADA     ##
%##                         Dept. Génie Mécanique                        ##
%##                               Fall 2021                              ##
%##                                                                      ##
%##########################################################################
N = length(u_hat);
M = 3*N/2;         % 3/2th rule
u_hat_pad = [u_hat(1:N/2) zeros(1, M-N) u_hat(N/2+1:end)];
w_pad = ifft(u_hat_pad);
w_pad_hat = fft(w_pad);

% Transform back to physical space:
u_extended = real(ifft(w_pad_hat));

% Compute wave numbers in extended space
m_extended = -M/2:M/2-1;                        % harmonic number
k_extended = (m_extended*2*pi/Lx);              % wave number
k_extended = fftshift(k_extended);

% Compute the derivative (du/dx) in physical space:
du_dx_extended = real(ifft(1i*k_extended.* w_pad_hat));

% Compute the nonlinear term (-u*du/dx) in physical space:
nonlinear_term_extended = -u_extended .* du_dx_extended;

% Transform the nonlinear term back to the extended spectral space:
nonlinear_term_hat_extended = fft(nonlinear_term_extended);

% Project the extended Fourier coefficients back onto the original grid:
nonlinear_term_hat = 3/2*[nonlinear_term_hat_extended(1:N/2) nonlinear_term_hat_extended(M-N/2+1:M)];   % remove the padding zeros

end % AntiAlias()