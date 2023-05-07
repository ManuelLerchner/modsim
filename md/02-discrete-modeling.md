# Discrete Modeling and Simulation

## Decision Model

Decisions can be made based of:

- **certanty**: all the information is known
- **risk**: the probability of each outcome is known
- **uncertainty**: the probability of each outcome is not known

## Model

This way of making decision can be modeled using a Payoff Matrix.

$$
\begin{array}{c|c|c|c|c}
\text{} & \text{State 1} & \text{State 2} & \cdots & \text{State n} \\
\hline
\text{Action 1} & a_{11} & a_{12} & \cdots & a_{1n} \\
\hline
\text{Action 2} & a_{21} & a_{22} & \cdots & a_{2n} \\
\hline
\vdots & \vdots & \vdots & \ddots & \vdots \\
\hline
\text{Action m} & a_{m1} & a_{m2} & \cdots & a_{mn} \\
\end{array}
$$

The **payoff** is the value of the Action based on the State.

### Example Payoff Matrix - Prisoner's Dilemma

If both players cooperate, they will both get a sentence of 5 years in prison. If one of them cooperates and the other doesn't, the one that cooperates will be free and the other will get a sentence of 10 years in prison. If both of them don't cooperate, they will both get a sentence of 1 year in prison.

$$
\begin{array}{c|c|c|c|c}
\tiny{\text{(Reward A, Reward B)}} & \text{Player A cooperates} & \text{Player A doesn't cooperate} \\
\hline
\text{Player B cooperates} & -5, -5 & -10, 0 \\
\hline
\text{Player B doesn't cooperate} & 0, -10 & -1, -1 \\
\end{array}
$$

## Startegies

- **Certainity**: if you are certain about the initial state, your action will simply be the one that gives you the highest payoff.
  1. **Maximum**
     - Find Action $i$ as $\argmax_{i}N_{ij}$. In other words, find the action that gives you the highest payoff.
       - In the example above, if you would somehow know that Player A will cooperate, it is of your best interest to also cooperate. Since this will reduce your sentence from 10 years to 5 years.
- **Risk**: There are multiple Strategies you can take:
  1. **Caution - (max-min payoff)**
     - Find Action $i$ as $\argmax_{i} \min_{j} N_{ij}$. In other words, find the action that gives you the highest minimum payoff.
       - In the example above, Player B would choose to cooperate, since chosing this way, will guarantee him a sentence of maximum 5 years.

  2. **Full Risk - (max-max payoff)**
       - Find Action $i$ as $\argmax_{i} \max_{j} N_{ij}$. In other words, find the action that gives you the highest maximum payoff.
          - In the example above, Player B would choose to cooperate, since the best case scenario for him is to get a sentence of 0 years in prison, if Player A doesn't cooperate.

  3. **Alternative Caution** - (min-max payoff)
       - Find Action $i$ as $\argmin_{i} \max_{j} R_{ij}$. Where $R_{ij}=\max_i N_{ij} - N_{ij}$.

  4. **Pessimism-Optimism**
       - Let $m_i=\min_j N_{ij}$ and $M_i=\max_j N_{ij}$, and $\alpha \in [0,1]$.
       - Find Action $i$ as $\argmax_{i} (\alpha m_i + (1-\alpha) M_i)$.
       - This allows you to choose how much risk you want to take. If $\alpha=0$, you will choose the action that gives you the highest maximum payoff. If $\alpha=1$, you will choose the action that gives you the highest minimum payoff.

## Two-Player Zero-Sum Games

Idea: Both players choose their actions simultaneously.

Assumptions:

- Both players know the payoff matrix.
- Both players act with caution. If they alternate turns:
  - S1 tries to maximize the minimum payoff.
  - S2 tries to minimize the maximum loss.

### Equilibrium

If you find a state where both players are happy with their payoff, you have found an equilibrium. No player will want to change their action.

$$
\max_{i} \min_{j} N_{ij} =a_{\hat{i}\hat{j}}= \min_{j} \max_{i} N_{ij}
