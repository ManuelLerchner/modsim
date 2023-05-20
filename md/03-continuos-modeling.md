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
