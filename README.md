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
### Results and Visualization
The solver outputs the velocity field over time, which can be visualized to observe shock formations, energy cascades, and other turbulent structures. Example visualization functions are provided in plot_results.m.

References
Jérémie Bec & Konstantin Khanin (2007). Burgers turbulence. Physics Reports, 447(1-4), 1–66.
Pope, S.B. (2000). Turbulent Flows. Cambridge University Press.
License
This project is licensed under the MIT License. See the LICENSE file for details.
