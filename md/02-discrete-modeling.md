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
     - Find Action $i$ as $\arg\max_{i}N_{ij}$. In other words, find the action that gives you the highest payoff.
       - In the example above, if you would somehow know that Player A will cooperate, it is of your best interest to also cooperate. Since this will reduce your sentence from 10 years to 5 years.
- **Risk**: There are multiple Strategies you can take:
  1. **Caution - (max-min payoff)**
     - Find Action $i$ as $\arg\max_{i} \min_{j} N_{ij}$. In other words, find the action that gives you the highest minimum payoff.
       - In the example above, Player B would choose to cooperate, since chosing this way, will guarantee him a sentence of maximum 5 years.

  2. **Full Risk - (max-max payoff)**
       - Find Action $i$ as $\arg\max_{i} \max_{j} N_{ij}$. In other words, find the action that gives you the highest maximum payoff.
          - In the example above, Player B would choose to cooperate, since the best case scenario for him is to get a sentence of 0 years in prison, if Player A doesn't cooperate.

  3. **Alternative Caution** - (min-max payoff)
       - Find Action $i$ as $\arg\min_{i} \max_{j} R_{ij}$. Where $R_{ij}=\max_i N_{ij} - N_{ij}$.

  4. **Pessimism-Optimism**
       - Let $m_i=\min_j N_{ij}$ and $M_i=\max_j N_{ij}$, and $\alpha \in [0,1]$.
       - Find Action $i$ as $\arg\max_{i} (\alpha m_i + (1-\alpha) M_i)$.
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
$$

## Group Decision Making

Question: How to combine decisions from multiple people in a **democtratic** way, to find the best collective decision?

- $A$ is the set of all candidates.
- $r: A \rightarrow \mathbb{R}$ is the ranking function.
  - Each voter $i$ orders the candidates to his preference with numbers from 1 to $|A|$, where a lower number means a higher preference. He does this by defining a ranking function $r_i$.
- The set $P_A=\{\rho \subset A\times A| \rho \text{ is a transitive, and asymetric relation}\}$ is the set of all possible rankings.
  - This means in $P_A$ a voter cant have equal preferences, between two candidates.

A colletive choice function $K:P_A^{\otimes n} \rightarrow P_A$ is a function that takes all $n$ rankings from the voters and returns a combined ranking, which is the collective decision.

### Majority Decision (Condorcet Method)

For each voter let $N(x,y)$ be the number of voters that prefer $x$ over $y$.

$$
\begin{array}{c|c|c|c|c}
\tiny{} & r_i(x) & r_i(y) & r_i(z)  \\
\hline
i=1 & 1 & 2 & 3 \\
\hline
i=2 & 3 & 1 & 2 \\
\hline
i=3 & 2 & 3 & 1 \\
\hline
\end{array}
$$

Therefore:

$$
\begin{array}{c|c|c|c|c}
\tiny{N(a,b)} & x & y & z  \\
\hline
x & 0 & 2 & 1 \\
\hline
y & 1 & 0 & 2 \\
\hline
z & 2 & 1 & 0 \\
\hline
\end{array}
$$

Define:

- $a\rho b$ if $N(a,b)>N(b,a)$

It follows:

- $x\rho y$ because $N(x,y)>N(y,x)$
- $y\rho z$ because $N(y,z)>N(z,y)$
- $z\rho x$ because $N(z,x)>N(x,z)$

So: $x>_{\rho} y>_{\rho} z>_{\rho} x$. This is a cycle, and therefore there we cannot find a collective decision.

This is bad, because even tough even tough every voter had a preference, we couldn't find a collective decision.

This violates rule 2 of a democratic decision. Because sometimes we cannot find a collective decision.

### Rank Addition

This method simply adds the rankings of all voters together, and finds the collective decision from that.

Define $x \rho y$ if $\sum_{i=1}^n r_i(x) < \sum_{i=1}^n r_i(y)$.

$$
\begin{array}{c|c|c|c|c}
\tiny{} & r_i(x) & r_i(y) & r_i(z)  \\
\hline
i=1 & 1 & 2 & 3\\
\hline
i=2 & 2 & 1 & 3 \\
\hline
\Sigma r_i & 3 & 3 & 6 \\
\end{array}
$$

So by this method $x$ and $y$ are equally good, and $z$ is the worst.
This means we cannot find a unnique collective decision.

But this method yields another problem:

If we vote again:

$$
\begin{array}{c|c|c|c|c}
\tiny{} & r_i(x) & r_i(y) & r_i(z)  \\
\hline
i=1 & 1 & 2 & 3\\
\hline
i=2 & 3 & 1 & 2 \\
\hline
\Sigma r_i & 4 & 3 & 5 \\
\end{array}
$$

We get a different result. This times $y$ is the clear winner. But every candidate still has the same preference between $x$ and $y$ but this time $y$ is the winner.

This is bad, because the collective decision should not change if the relative order between candidates doesn't change.

This violates rule 4 of a democratic decision.

### Rules of Democraty

1. For every set of Ballots, it must be possible to find a collective decision. ($K$ is defined for all $P_A^n$)
2. The result of the collective decision must be included in $A$. No external candidate can win.
3. If all voters decide unanimously, the collective decision must be the same. (Pareto Principle)
4. Ballots with the same order of candidates for every pair $(x,y)$ must yield the same collective decision. (Independence of Irrelevant Alternatives)
5. No voter can always determine the collective decision. (Non-Dictatorship)$$

### Arrow's Theorem

If $|A| > 2$, and more than 1 voter, then there is no collective choice function $K$ that satisfies all 5 rules of democracy.

## Scheduling

Problem:

- A Process consists of $n$ tasks $A_1, A_2, \dots, A_n$.
- There exist machines $M_1, M_2, \dots, M_m$.
- Each task $A_i$ needs a machine $M_j$ to be executed. With an execution time of $t_i^{(j)}$

The goal is to find a schedule, that minimizes the total execution time.

### Example: Process Scheduling

- Execution times is purely task-dependent.
- Start time $s_i$, completion time $c_i=s_i+t_i$.

- $A_i\rightarrow A_j$ means that $A_i$ must be executed before $A_j$.
  - There might be no cycle in this graph.

#### Algorithm

Idea: Start the tasks as soon as possible.

```python
add_initial_vertex()
#forward
while there are vertices left:
    find a vertex where all predecessors are already scheduled
    schedule this vertex
    set its start time as s=max(c of all predecessors)
    set its completion time as c=s+t
```
