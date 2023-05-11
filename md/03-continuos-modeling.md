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
