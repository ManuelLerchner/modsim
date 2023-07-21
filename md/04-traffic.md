# Simulation of Traffic

## Mathematical Models

+ Random Variable
  + $T$: A random variable with distribution $F_T(t)$ and density $f_T(t)$
+ Expected Value
  + $E[T] = \int_{-\infty}^{\infty} t f_T(t) dt$
+ Variance
  + $Var[T] = \int_{-\infty}^{\infty} (t - E[T])^2 f_T(t) dt$
+ Rho
  + $\rho = \frac{\sigma(T)}{E[T]} = \frac{\sqrt{Var[T]}}{E[T]}$
+ Hazard Rate / Failure Rate
  + $h(t) = \frac{f_T(t)}{1 - F_T(t)}$ Describes the instantaneous rate of failure at time $t$ given that the system has survived up to time $t$.

### Example Uniform Distribution

+ $T \sim U(0, 1)$
+ $f_T(t) = 1$ for $0 \leq t \leq 1$ and $0$ otherwise
+ $F_T(t) = t$ for $0 \leq t \leq 1$, $1$ for $t > 1$, and $0$ otherwise

This means:

+ $E[T] = \int_{-\infty}^{\infty} t f_T(t) dt = \int_{0}^{1} t dt = \frac{1}{2}$
+ $Var[T] = \int_{-\infty}^{\infty} (t - E[T])^2 f_T(t) dt = \int_{0}^{1} (t - \frac{1}{2})^2 dt = \frac{1}{12}$
+ $\rho = \frac{\sqrt{Var[T]}}{E[T]} = \frac{\frac{1}{\sqrt{12}}}{\frac{1}{2}} = \frac{1}{\sqrt{3}}$
+ $h(t) = \frac{f_T(t)}{1 - F_T(t)} = \frac{1}{1 - t}$ for $0 \leq t \leq 1$ and $0$ otherwise

## Hitchhiker's Paradox

In the example of a bus stop, given that the bus arrives at a random time $T$ with a uniform distribution $U(0, 1)$, what is the expected time $E[T]$ that a passenger has to wait?

This is calle the $FRT$ or Forward Recurrence Time. The $BRT$ or Backward Recurrence Time is the time that has passed since the last bus has left.

$$
E[FRT] = E[BRT] \approx \frac{1}{2} \frac{E[T^2]}{ E[T]} = \frac{E[T]}{2} (1+\rho^2(T))
$$

This means that the expected time that a passenger has to wait in the case of uniform distribution is $\frac{1}{3}$.

If the coefficient of variation $\rho$ is larger than $1$, the expected time that a passenger has to wait is longer than $E[T]$. This means that even if the bus arrives, for example, on average every $10$ minutes, the expected time that a passenger has to wait is longer than $10$ minutes, because it is more likely to arrive in a longer section, where currently no bus is present.

## Queueing Theory

### Definitions

+ $FU$ Functional Unit:
  + $SU$ The Service Unit provides the service, does not include transport
  + $C$ The channel moves customers from the queue to the service unit
+ A job occupies a service unit
+ Dwelling Time $y$ measures the total time a job spends in the system
  + $y = w + b$ where $w$ is the waiting time and $b$ is the service time
+ Capacity $k$ is the number of parallel jobs a Service Unit can handle
+ Filling $f$ is the number of jobs in the system
+ Throughput $d$ of a SU is the average number of jobs that leave the system per time unit
+ Maximum Throughput $c$ is the maximum number of jobs that can leave the system per time unit
+ Utilization $d/c$ is the relative throughput of a SU
+ service time $b$ of a job is the net-dwellin time in the SU without waiting

### Little's Law

Little's Law states that the average number of jobs in the system is equal to the average throughput times the average dwelling time.

$$
\begin{aligned}
E[F] &= E[D]\cdot E[Y]\\
      (&= E[D]\cdot E[B]= \frac{E[D]}{c} = E[R] \qquad \text{if k = 1})
\end{aligned}
$$

Example: The throughput of a MCDonalds is $E[D] = 50$ customer per hour (This means 50 customers leave the restaurant per hour). If the average customer spends $E[Y] = 30$ minutes in the restaurant, the average number of customers in the restaurant is $E[F] = E[D]\cdot E[Y] = 50\left[\frac{customers}{hour}\right] \cdot 30\left[ minutes\right] \cdot \frac{1}{60}\left[\frac{hours}{minute}\right] = 25 \left[customers\right]$.

### Kendall Notation

The Kendall Notation is a notation for queueing systems. It is of the form |Arrival Process|Service Process|Number of Service Units | Capacity of Queue| Maximum Clients | Queueing Discipline|.

Table of Possible Values:

| Arrival Process / Service Process | Description |
| --- | --- |
| D | Deterministic|
| M | Markovian (Poisson) parameter $\lambda$ or $\mu$ |
| G | General (arbitrary) |

| Queueing Discipline | Description |
| --- | --- |
| FCFS | First Come First Serve |
| LCFS | Last Come First Serve |
| PRIORITY | Priority Queue |
| ROUND ROBIN | Round Robin |

### Markov Chains

For markovian processes the state can be modeled with a markov chain. The state is the number of jobs in the system. The transition probabilities are the probabilities of arriving or leaving the system.

+ irreducible: every state can be reached from every other state
+ absorbing: once a state is reached, it is never left again
+ closed subset: a subset of states that is irreducible and absorbing
+ recurrence probability: probability that a state is reached again after leaving it
+ transient: a state is transient if its recurrence probability is less than $1$
+ recurrence time: expected time until a state is reached again after leaving it
+ periodic: a state is periodic if the expected time to reach it again is a multiple of the expected time to reach it again from the next state

A stable configuration is found when every inflow of a state is equal to the outflow of the state.

$$
\begin{aligned}
 \left ( \sum_{i\neq j} \lambda_{ij} \right ) \cdot p_i &= \sum_{i\neq j} p_j\cdot \lambda_{ji} \\
1 &= \sum_{i=1}^n p_i
\end{aligned}
$$

This can be used to calculate the probability of a state $p_i$.

Note that $\frac{\lambda}{\mu} = \frac{E[D]}{E[B]} = \frac{E[D]}{c}=r$

### M/M/1 Queue

This stands for Markovian Arrival Process (arrival rate $\lambda$) / Markovian Service Process (service rate $\mu$) / 1 Service Unit.

Using the equations from above, the following can be derived:

$$
\begin{aligned}
p_i &= \left ( \frac{\lambda}{\mu} \right )^i \cdot p_0\\
p_0 &= 1- \frac{\lambda}{\mu} = 1 - r\\
\end{aligned}
$$

The average filling can be calculated as:

$$
E[F] = \sum_{i=0}^{\infty} i\cdot p_i = \frac{r}{1-r}
$$

With little's law, the average dwell time can be calculated as:

$$
E[Y] = \frac{E[F]}{E[D]} = \frac{r/(1-r)}{\lambda} = \frac{E[B]}{1-r}
$$

## Random Numbers

### Uniform Distribution

PCs can only generate pseudo random numbers. (For example using the LCPRNG algorithm).

Using transformations, a uniform distribution can be transformed into any other distribution.

### Exponential Distribution

The exponential distribution is used to model the time between events in a Poisson process. It is the continuous counterpart to the geometric distribution.

$$
f(x) = \lambda e^{-\lambda x}
$$

it can be simulated using the inverse transform method:

$$
\begin{aligned}
U &\sim U(0, 1) \\
X &\sim ?\\
F_X(x) &= \Pr(X \leq x) = \Pr(f(U) \leq x) = \Pr(U \leq f^{-1}(x)) = f^{-1}(x)\\
&\Rightarrow f(u) = F_X^{-1}(u) = -\frac{1}{\lambda} \ln(1-u)\\
\end{aligned}
$$
In our case:

$$
X \sim Exp(\lambda) \Rightarrow F_X(x) = 1 - e^{-\lambda x}
$$

This means that $F_X^{-1}(u) = -\frac{1}{\lambda} \ln(1-u)$.

### Central Limit Theorem

When $X_1, X_2, \dots, X_n$ are independent and identically distributed random variables with $E[X_i] = \mu$ and $Var[X_i] = \sigma^2$, then the sum of the random variables $S_n = \sum_{i=1}^n X_i$ is approximately normally distributed with $E[S_n] = n\mu$ and $Var[S_n] = n\sigma^2$ for large $n$.

We can transform any distribution into a normal distribution using the central limit theorem.

$$
\begin{aligned}
Z_n &= \frac{\sum_{i=1}^n X_i - n\mu}{\sigma \sqrt{n}} \sim N(0, 1)\\
\end{aligned}
$$

## Traffic Flow
