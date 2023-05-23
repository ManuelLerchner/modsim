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
