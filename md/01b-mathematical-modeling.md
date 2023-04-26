# Introduction to Mathematical Modeling

## Terminology

### Model

A model is a simplified image of a partial reality.

- Practical Models
  - Wind tunnel
- Scale model
- Abstract Models
  - Mathematical models

#### Derivation

Questions to ask when modeling:

- What exactly should be modeled?
  - Population growth
  - Rocket trajectory
- Which attributes play a role in the model?
  - Population size, children per family, death rate...
  - Rocket mass, thrust, air resistance...
- What relations exist between the attributes?
  - Population growth is proportional to the population size
  - Rocket thrust is proportional to the fuel consumption
- What mathematical tools are needed to describe the relations?
  - Differential equations, probability theory, statistics, algebraic equations and inequalities, automata theory, graph theory, etc.

#### Simulation Tasks

- What is the goal of the simulation?
  - Find an arbitrary solution
  - Find the only solution
  - Show that a solution exists
  - Solve a constrained optimization problem
  - Find a critical point

#### Analysis of the Model

- What is the behavior of the model?
  - Is the model stable?
  - Does it converge to a steady state?
  - Is the solution point, really an optimum?
  - Is the solution unique or do exist better solutions?

Problems are **well-posed** if the following conditions are met:

- The solution exists
- The solution is unique
- It is stable

##### Aplicability of the Model

- Is enough input data available, to run the model?
- Is the hardware available to run the model?
- Is it fast enough, to be useful?
- Is it sensitive to small changes in the input data?

### Mathematical Modeling

Process of formal derivation and analysis of mathematical models.

1. Informal description of the problem
2. Semi-formal description of the problem, using tools of the specific discipline
3. A strict formal description of the problem, (consistent)

### Simulation

A virtual, computer based experiment with a mathematical model.

The goals of simulation are:

- To understand the behavior of the system
  - Why earthquakes occur
  - Why buildings collapse
- To optimize a system
  - Better flight schedules
  - higher throughput
- To predict the behavior of the system
  - Climate change
  - Characteristics of a new drug

## Simulation Pipeline

1. Modeling the system
2. Numerical methods needed to solve the model
3. Implementation of the numerical methods in an efficient way
4. Visualization of the results
5. Validation of the model
6. Embedding the model in a larger system i.e a wheater forecast
