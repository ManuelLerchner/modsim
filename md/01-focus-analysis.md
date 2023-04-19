# Focus Analysis / Calculus

## Foundations

### Functions and their representations

- One-Dimensional
$$
f : D \subseteq \mathbb{R}^n \rightarrow \mathbb{R}^m, x \mapsto f(x)
$$

- Multidimensional
$$
f : D \subseteq \mathbb{R} \rightarrow \mathbb{R}, x = \begin{pmatrix} x_1 \\ \vdots \\ x_n \end{pmatrix} \mapsto f(x) = \begin{pmatrix} f_1(x_1, \ldots, x_n) \\ \vdots \\ f_m(x_1, \ldots, x_n) \end{pmatrix}
$$


### Names for special types of functions

- Curves: $n=1$ and $m \in \mathbb{N}$
  - plane curves (2D): $n=1$ and $m=2$
  - space curves (3D): $n=1$ and $m=3$
- Surfaces: $n=2$ and $m=3$
- Scalar fields: $n \in \mathbb{N}$ and $m=1$
- Vector fields: $n=m$

### Topology concepts in higher dimensions

There is an analogous concept to open and closed intervals in multi-dimensional spaces. \
Given a domain $D \subseteq \mathbb{R}^n$ and its complement $D^c = \mathbb{R}^n \setminus D$
- A point $x$ is called *inner point* if there exists an arbitrarily small ball around this points that fullly lies inside $D$.
- The set of all inner points of $D$ is called the *interior* of $D$ and is denoted as $\mathring{D}$.
- The domain is called open if $D = \mathring{D}$
- A point $x_0 \in \mathbb{R}^n$ is called *boundary point* if any arbitrarily small ball around this point intersects with both $D$ and its complement $D^c$
- The set of all boundary points of $D$ is called the *boundary* of $D, denoted $\partial D$
- The set $\bar{D} = D \cup0 \partial D$ is called the *closure* of $D$

Using these definitions there are multiple attributes assignable to domains. \
A domain $D$ is called:
- *closed* if $\partial D \subseteq D$, i.e. $\bar{D} = D$
- *bounded* if $\exists K \in \mathbb{R} : ||x|| < K, \forall x \in D$
- *compact* if it is closed and bounded
- *convex* if all points on a straight line between to points in $D$ are themselves element of $D$

### Continuity

We define continuity in multi-dimensional spaces using converging vector sequences. \
A sequence $(x^{(k)})$ converges to the limit $x$ if
$$
\lim_{k \to \infty} ||x^{(k)} - x||=0
$$

Converges of a vector sequence is also equivalent to the convergence of all components. \
A vector function is then called continuous at $a \in D$ if for all sequences $(x^{(k)})_{k \in \mathbb{N}_0}$ in $D$ converging to $a$ the corresponding sequence $(f(x^{(k)}))_{k \in \mathbb{N}_0}$ in $\mathbb{R}^m$ converges to $f(a)$ and continuous on $D$ if this holds for all points $a \in D$