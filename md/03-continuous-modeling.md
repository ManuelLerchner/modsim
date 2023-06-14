# Continuos Modeling

## Population Dynamics

### Model of Malthus

+ There exists only one species $P$
+ constant birth rate $\gamma$
+ constant death rate $\delta$
  + constant growth rate $\lambda=\gamma - \delta$

This leads to the following equation:

$$
p(t+\Delta t)=p(t)+\lambda p(t)\Delta t
$$

in the limit $\Delta t \rightarrow 0$:

$$
\dot{p}(t)=\lambda p(t)
$$

This has the solution:

$$
p(t)=p_0 e^{\lambda t}
$$

### Verhulst Model

+ The model of Malthus is not realistic, since the population cannot grow indefinitely
+ At some point the population will be saturated
+ Ideas:
  + The population growth rate is proportional to the population size
  + linear birth rate $\gamma(t)=\gamma_0-\gamma_1 p(t)$
    + Larger population size leads to smaller birth rate
  + linear death rate $\delta(t)=\delta_0+\delta_1 p(t)$
    + Larger population size leads to larger death rate
  
This leads to the following equation:

$$
\dot{p}(t)=\gamma(t)-\delta(t)=\gamma_0-\gamma_1 p(t)-\delta_0-\delta_1 p(t)=-m \cdot (p(t)-p_\infty)
$$

where $m=\gamma_1+\delta_1$ and $p_\infty=\frac{\gamma_0+\delta_0}{m}$

This has the solution:

$$
p(t)=p_\infty+(p_0-p_\infty)e^{-mt}
$$

This models starts to saturate right at the beginning, meaning that the growth rate shrinks right from the start. This is not realistic, since the population needs some time to run into resource limitations.

### Logistic Model

+ The model of Verhulst is not realistic, since the growth rate shrinks right from the start
+ When using a quadratic term, it allows for an inflection point

$$
\dot{p}(t)=(a-bp(t))p(t)=ap(t)-bp^2(t)
$$

This has the solution:

$$
p(t)=\frac{ap_0}{bp_0+(a-bp_0)e^{-at}}
$$

If $p_0<\frac{a}{b}$, then the population will grow exponentially until it reaches the inflection point.Then it will start to saturate.

If $a>>b$, then the the quadratic term will kick in very late, meaning that the population will grow exponentially for a long time.

### Oscillations

+ The logistic model does not allow for oscillations

$$
\ddot{p}(t)+\mu \dot{p}(t)+\omega^2 (p(t)-p_\infty)=0
$$

where $\mu$ is the damping factor and $\omega_0$ is the natural frequency.

This has the solution:

$$
p(t)=(p_0-p_\infty)e^{-\frac{\mu}{2}t}\cos(\sqrt{\omega^2-\frac{\mu^2}{4}}t)+p_\infty
  $$

### Lotka-Volterra Model

+ Model of two species $P$ and $Q$
+ $P$ is the prey and $Q$ is the predator

$$
\begin{aligned}
\dot{p}(t)&=f(p(t),q(t))\cdot p(t)\\
\dot{q}(t)&=g(p(t),q(t))\cdot p(t)
\end{aligned}
$$

If both $\dot{p}(t)$ and $\dot{q}(t)$ are zero, then the system is in equilibrium. This means that the population sizes are constant  from that point on.

$$
\begin{bmatrix}
\dot{p}(t)\\
\dot{q}(t)
\end{bmatrix}
=
\begin{bmatrix}
0\\
0
\end{bmatrix}
$$

The values at this point are called fixed points.

## Attractive Equilibrium Points

+ The fixed point is called attractive, if the system will converge to this point, if it starts close to it

$$
F(p,q)=\begin{bmatrix}
f(p,q) \cdot p\\
g(p,q) \cdot q
\end{bmatrix}
$$

The Jacobian matrix is defined as:

$$
J_F=\begin{bmatrix}
\frac{\partial f}{\partial p} & \frac{\partial f}{\partial q}\\
\frac{\partial g}{\partial p} & \frac{\partial g}{\partial q}
\end{bmatrix}
$$

If we look at the eigenvalues of the Jacobi Matrix at the fixed point $[\bar{p},\bar{q}]^T$ and their real parts are both negative, then the fixed point is attractive.

## Numerical ODE Solvers

There exist two problem categories:

+ Initial value problem
  + The initial value is given
  + The goal is to find the solution at a later time $p(0)=p_0$
+ Boundary value problem
  + Both the initial and the final value are given
  + The goal is to find the solution in between $p(0)=p_0$ and $p(T)=p_T$

### Definitions

+ Local error
  + Maximum error between the exact solution and the numerical solution after one step
  + $e_{loc}=\max_{n\in[ 0,N-1 ]}|\frac{f(t_{n+1})-f(t_n)}{\Delta t}-\dot{y}(t_n,y(t_n))|$

+ Global error
  + Maximum error accumulated over all steps
  + $e_{glob}=\max_{n=0,\dots,N}|y_n-f(t_n)|$

+ Consistency
  + The method is consistent, if the local error goes to zero, if the step size goes to zero
  + $\lim_{\Delta t \rightarrow 0}e_{loc}=0$

+ Convergence
  + The method is convergent, if the global error goes to zero, if the step size goes to zero
    + $\lim_{\Delta t \rightarrow 0}e_{glob}=0$

  + Convergence is stronger than consistency
  + Convergence = Consistency + Stability

+ Condition
  + Property of the problem
  + Measure for sensitifity of the solution to small changes in the initial value
  + Does not depend on the algorithm

$$
\kappa_{rel}=\frac{|x \cdot \dot{y}(t,x)|}{|y(t,x)|}
$$

+ Stability
  + Property of the algorithm
  + Measure for the sensitivity of the solution to small changes in the initial value
  + Depends on the algorithm ($\epsilon$-stability)
  + Sometimes implcit methods are more stable than explicit methods

+ Stiffness
  + A problem is stiff, when the solution of a Differential Equation only converges, if the step size is very small
  + Even if the method is consistent and stable, the solution will not converge, if the step size is too large
  + Solution: Implicit methods

### Euler Method

$$
y_{n+1}=y_n+\Delta t \cdot f(t_n,y_n)
$$

+ Consistency
  + $e_{loc}(\Delta t)=\mathcal{O}(\Delta t)$

+ Convergence
  + $e_{glob}(\Delta t)=\mathcal{O}(\Delta t)$

### Heun's Method (Runge-Kutta 2)

$$
y_{n+1}=y_n+\frac{\Delta t}{2} \cdot (f(t_n,y_n)+f(t_{n+1},y_n+\Delta t \cdot f(t_n,y_n)))
$$

+ Consistency
  + $e_{loc}(\Delta t)=\mathcal{O}(\Delta t^2)$

+ Convergence
  + $e_{glob}(\Delta t)=\mathcal{O}(\Delta t^2)$

### Multi-Step Methods

+ Since Runge-Kutta methods are costly to compute, we can use multi-step methods, those method use previous steps to compute the next step

#### Adams-Bashforth Method

$$
y_{n+1}=y_n+\frac{\Delta t}{2} \cdot (3f(t_n,y_n)-f(t_{n-1},y_{n-1}))
$$

+ Since this method needs two previous steps, we need to use a different method for the first step
  + Calculate the first step with the Euler method with a small step size

### Implicit Methods

+ Implicit methods are more stable than explicit methods

#### Implicit Euler Method

$$
y_{n+1}=y_n+\Delta t \cdot f(t_{n+1},y_{n+1})
$$

You need to solve this equation for $y_{n+1}$ and find a solution for $y_{n+1}$.

#### Predictor-Corrector Methods

+ Predictor
  + Use an explicit method to predict the next step

+ Corrector
  + Use an implicit method to correct the prediction

$$
\begin{aligned}
y_{n+1}^{pred}&=y_n+\Delta t \cdot f(t_n,y_n)\\
y_{n+1}&=y_n+\frac{\Delta t}{2} \cdot (f(t_n,y_n)+f(t_{n+1},y_{n+1}^{pred}))
\end{aligned}
$$

## Higher Order ODEs

+ Higher order Derivatives can be transformed into a system of first order ODEs

+ Introduce new Variables $y_1=y, y_2=\dot{y}, y_3=\ddot{y}, \dots$

+ Transform the ODE $y^{(n)}=f(t,y,y',y'',\dots,y^{(n-1)})$ into a system of first order ODEs

$$
\begin{aligned}
y_1'&=y_2\\
y_2'&=y_3\\
&\vdots\\
y_{n-1}'&=y_n\\
y_n'&=f(t,y_1,y_2,\dots,y_n)
\end{aligned}
$$

## Boundary Value Problems

+ Initial value problems are easy to solve, but boundary value problems are hard to solve

$$
\ddot{y}=b \cdot y +c
$$

### Finite Difference Method

+ Calculate the finite difference approximation of the ODE
    $$
    \ddot{y}(t_n)=\frac{y_{n+1}-2y_n+y_{n-1}}{\Delta t^2}
    $$

+ Solve the system of equations via Gauss-Seidel or Jacobi

$$
\frac{y_{i+1}-2y_i+y_{i-1}}{\Delta t^2}-b_i \cdot y_i=c_i
$$
$$
\begin{pmatrix}
2+b_1 \cdot \Delta t^2 & -1 & 0 & \dots & 0\\
-1 & 2+b_2 \cdot \Delta t^2 & -1 & \dots & 0\\
0 & -1 & 2+b_3 \cdot \Delta t^2 & \dots & 0\\
\vdots & \vdots & \vdots & \ddots & \vdots\\
0 & 0 & 0 & \dots & 2+b_{N-1} \cdot \Delta t^2
\end{pmatrix}
\begin{pmatrix}
y_1\\
y_2\\
y_3\\
\vdots\\
y_{N-1}
\end{pmatrix}
=
\begin{pmatrix}
-\Delta t^2 \cdot c_1 + y_0\\
-\Delta t^2 \cdot c_2\\
-\Delta t^2 \cdot c_3\\
\vdots\\
-\Delta t^2 \cdot c_{N-1} + y_N
\end{pmatrix}
$$

+ Solve the system of equations via Gauss-Seidel or Jacobi

### Shooting Method

+ Transform the boundary value problem into an initial value problem

+ Solve the initial value problem with an ODE solver

+ Adjust the initial value, until the boundary conditions are met

+ Very expensive, since the ODE solver needs to be called multiple times

$$
\ddot{y}=f(t,y,\dot{y}),\qquad y(t_0)=y_0, y(t_1)=y_1
$$

## Fuzzy Logic

Fuzzy logic is used to model feedback system. The goal is to reduce the error between the desired value and the actual value.

![Feedback System](md/images/feedback.png)

### P Controller

A P controller is the simplest controller. It uses the error to calculate the output.

$$
u(t)=K_p \cdot e(t)
$$

It just sees the error and does not care about the change of the error or the integral of the error.

### PID Controller

A PID controller is a controller, which uses the error, the change of the error and the integral of the error to calculate the output.

$$
u(t)=K_p \cdot e(t) + K_i \cdot \int_0^t e(\tau) d\tau + K_d \cdot \frac{de(t)}{dt}
$$

+ The proportional part directly counters the error
+ The integral part counters the error in the long run
+ The differential part reduces the overshoot and oscillation

#### Example Linear Feedback System

The State changes as follows:

$$
\dot{x}(t)=A \cdot x(t)
$$

The output with a P controller is:

$$
\begin{aligned}
\dot{x}(t)&=A \cdot x(t) + B (-K_p \cdot x(t))\\
&=(A-B \cdot K_p) \cdot x(t)
\end{aligned}
$$

This system can be solved using the Ansatz $x(t)=v e^{\lambda t}$

Categories of the solution:

+ All the real parts of the eigenvalues of $(A-B \cdot K_p)$ are negative, the system is stable
+ At least one eigenvalue has a positive real part, the system is unstable, because it has an exponential term
+ All real parts of the eigenvalues are zero, the system is oscillating
+ All real parts of the eigenvalues are negative, and all imaginary parts are zero, the system is stable, and does not oscillate

## Fuzzy Set

A fuzzy set is a set, where the membership is not binary, but a value between 0 and 1.

Example: The set of tall people

+ A person with a height of 1.90m is a member of the set with a membership of 1
+ A person with a height of 1.80m is a member of the set with a membership of 0.8
+ A person with a height of 1.20m is a member of the set with a membership of 0.1

## Set Operations

![Fuzzy Logic Operations](md/images/fuzzy_logic_operations.png)

## Structure of a Fuzzy Logic System

1. Fuzzification
    + Transform the input into fuzzy sets
    + All Quantitities are transformed into linguistic variables with their membership functions

2. Create Rule Base
    + The rules are in the form of "IF ... THEN ..."
    + Example: If the temperature is high, then the fan should be fast

3. Inference
   + The fuzziness of the input is propagated through the rules
   + A fuzzy set of actions is created

4. Defuzzification
   + The fuzzy set of actions is transformed into a crisp value
   + The crisp value is the output of the fuzzy logic system

## Differential Equations

A partial differential equation is an equation, which contains derivatives of multiple variables.

### Example: Heat Equation

$$
\frac{\partial u}{\partial t} = \alpha \cdot \left(\frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} + \frac{\partial^2 u}{\partial z^2}\right)
$$

### Types Boundary Conditions

+ Dirichlet Boundary Conditions
  + The value of the function is given at the boundary
  + Example: $y(0)=0, y(1)=1$

+ Neumann Boundary Conditions
  + The derivative of the function is given at the boundary
  + Example: $y'(0)=0, y'(1)=1$

### Finite Difference Method

In a finite difference method, the derivatives are approximated by finite differences.

The Domain consists of a grid of points. The points are indexed by $i$ and $j$.

The first derivative can be approximated by the central difference:

$$
\frac{\partial u}{\partial x} \approx \frac{u_{i+1,j}-u_{i-1,j}}{2 \Delta x}
$$

The second derivative can be approximated by the central difference:

$$
\frac{\partial^2 u}{\partial x^2} \approx \frac{u_{i+1,j}-2u_{i,j}+u_{i-1,j}}{\Delta x^2}
$$

For each grid point, we can formulate the difference equation, points at the boundary are treated differently. (Dirichlet Boundary Conditions...)

## Finite Element Method

In the finite element method, there is no approximation of the derivatives. Instead, the PDE is transformed into a weak formulation.

### Weak Formulation

The weak formulation is obtained by multiplying the PDE with a test function and integrating over the domain.

$$
\int_\Omega v \cdot \frac{\partial u}{\partial t} d\Omega = \alpha \int_\Omega v \cdot \left(\frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} + \frac{\partial^2 u}{\partial z^2}\right) d\Omega
$$
