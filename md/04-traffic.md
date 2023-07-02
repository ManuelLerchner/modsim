# Simulation of Traffic

## Introduction

In this section we will discuss models to simulate traffic flow.

## Mathematical Models

+ Random Variable
  + $T$: A random variable with distribution $F_T(t)$
+ Expected Value
  + $E[T] = \int_{-\infty}^{\infty} t f_T(t) dt$
+ Variance
  + $Var[T] = \int_{-\infty}^{\infty} (t - E[T])^2 f_T(t) dt$
+ Rho
  + $\rho = \frac{Var[T]}{E[T]}$ (Coefficient of Variation) Describes how drastically the random variable varies from its mean.
+ Hazard Rate
  + $h(t) = \frac{f_T(t)}{1 - F_T(t)}$ (Failure Rate) Describes the instantaneous rate of failure at time $t$ given that the system has survived up to time $t$.
