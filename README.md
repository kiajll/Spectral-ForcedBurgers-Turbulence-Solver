# 1D Fourier Galerkin Solver for Forced Burgers Turbulence
This repository contains a MATLAB implementation of a 1D Fourier Galerkin solver to simulate Burgers turbulence in a periodic domain. The solver uses a spectral approach to represent the solution in Fourier space, combined with a 3rd-order compact Runge-Kutta scheme for time integration.

## Features
* 1D Forced Burgers Equation: Solves the forced Burgers equation to study turbulence phenomena.
* Spectral Fourier Galerkin Method: Utilizes the Fourier Galerkin method for spatial discretization, ensuring spectral accuracy.
* 3rd-Order Runge-Kutta Scheme: A 3rd-order compact Runge-Kutta scheme is implemented for stable, accurate time integration.
* Periodic Domain: Enforces periodic boundary conditions, a common setup in turbulence simulations.
## Contents
* `main_solver.m`: The primary script for setting up and running simulations.
* `RHS_FFT_rk3.m`: A function implementing the right-hand side of the 3rd-order compact Runge-Kutta time integration.
* `AntiAlias_ZeroPadding.m`
* `Energy_spectrum.m`
* `spectral_forcing.m`: A function generating external forcing for the Burgers equation.
* `initial_Velocity_Field.m`: A function defining the initial conditions for the simulation.
## Background
The forced Burgers equation is a fundamental model for studying turbulence, shock formation, and energy transfer in fluid dynamics. In this solver, the Fourier-Galerkin method provides spectral accuracy by projecting the equation onto Fourier modes, while the Runge-Kutta scheme stabilizes the integration over time.

## Equation Formulation
The forced Burgers equation is given by:

$$\frac{\partial u}{\partial t}+ u \frac{\partial u}{\partial x}=\nu \frac{\partial ^2 u}{\partial x ^2}+f(x,t)$$

where:
* $u=u(x,t)$: Velocity field,
* $\nu$: Kinematic viscosity coefficient,
* $f(x,t)$: External forcing term.
## Spectral Method
Using the Fourier-Galerkin method, the equation is transformed into Fourier space, where differentiation is straightforward and avoids spatial discretization errors.

### Time Integration
The Explicit 3rd-order Runge-Kutta scheme advances the solution over time. This method ensures sufficient stability and accuracy for turbulent flow simulations.

Usage
Requirements
MATLAB (version X.Y or higher, specify any dependencies if necessary).
Running the Solver
Clone this repository:

```bash
git clone https://github.com/kiajll/FourierGalerkinSolver-ForcedBurgersTurbulence.git
cd FourierGalerkinSolver-ForcedBurgersTurbulence
```

Open MATLAB and navigate to the repository directory.
```bash
main_solver
```
### Parameters
Modify parameters in `main_solver.m` to change simulation settings:

* `N`: Number of Fourier modes,
* `dt`: Time step,
* `tf`: Total simulation time,
* `nu`: Viscosity coefficient.
## Results and Visualization
The solver outputs the velocity field over time, which can be visualized to observe shock formations, energy spectrum, turbulent kinetic energy, energy dissipation rate, and other statistically turbulent structures. 

## References
* J. M. Burgers, “Mathematical Examples Illustrating Relations Occurring in the Theory of Turbulent Fluid Motion,” in Selected Papers of J. M. Burgers, F. T. M. Nieuwstadt and J. A. Steketee, Eds., Dordrecht: Springer Netherlands, 1939, pp. 281–334.
* D. T. Jeng and W. C. Meecham, “Solution of Forced Burgers Equation,” in The Physics of Fluids, vol. 15, no. 3, pp. 504–506, Mar. 1972.
* Jérémie Bec & Konstantin Khanin (2007). Burgers turbulence. Physics Reports, 447(1-4), 1–66.
* Pope, S.B. (2000). Turbulent Flows. Cambridge University Press.
* Girimaji, S. S., & Zhou, Y. (1995). Spectrum and energy transfer in steady Burgers turbulence. Physics Letters A, 202(4), 279–287.
* Jalali, Kiarash. (2024). Towards the Inviscid Limit: A New Perspective on TKE in Forced Burgers Turbulence. 10.11159/ffhmt24.113. 
### License
This project is licensed under the MIT License.
