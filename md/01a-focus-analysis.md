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
- The set of all boundary points of $D$ is called the *boundary* of $D$, denoted $\partial D$
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

## Partial Differentiation

### Gradient

The Gradient of a function gives the direction of the steepest ascent of the function. It requires that $f$ represents a scalar field.

When applying the limit definition of the derivative to a function in higher dimesions it is not clear from which direction the derivative should be taken.

Using

$$
\frac{\partial f}{\partial v}(a) = \lim_{h \to 0} \frac{f(a + h v) - f(a)}{h}
$$

we can define the directional derivative of a function $f: \mathbb{R}^n \rightarrow \mathbb{R}$ along a vector $v \in \mathbb{R}^n$ at a point $a \in \mathbb{R}^n$.

If we use the coordinate vectors $e_i$ as basis vectors for $\mathbb{R}^n$ we can define the *Gradient* of $f$ at $a$ as

$$
\nabla f(a) = \text{grad} f(a)= \begin{pmatrix} \frac{\partial f}{\partial x_1}(a) \\ \vdots \\ \frac{\partial f}{\partial x_n}(a) \end{pmatrix}
$$

For continuous functions the directional derivative at the point $a$ along a vector $v$ can be computed as

$$
\frac{\partial f}{\partial v}(a) = \langle \nabla f(a), v \rangle
$$

Example:
$$
f(x, y) = x^2 + y^2 \rightarrow \nabla f(a) = \begin{pmatrix} 2x \\ 2y \end{pmatrix}
$$

### Hessian Matrix

The Hessian matrix of a function $f: \mathbb{R}^n \rightarrow \mathbb{R}$ at a point $a \in \mathbb{R}^n$ is the matrix of all second partial derivatives of $f$ at $a$.

$$
H_f(a) = \begin{pmatrix} \frac{\partial^2 f}{\partial x_1^2}(a) & \frac{\partial^2 f}{\partial x_1 \partial x_2}(a) & \ldots & \frac{\partial^2 f}{\partial x_1 \partial x_n}(a) \\ \frac{\partial^2 f}{\partial x_2 \partial x_1}(a) & \frac{\partial^2 f}{\partial x_2^2}(a) & \ldots & \frac{\partial^2 f}{\partial x_2 \partial x_n}(a) \\ \vdots & \vdots & \ddots & \vdots \\ \frac{\partial^2 f}{\partial x_n \partial x_1}(a) & \frac{\partial^2 f}{\partial x_n \partial x_2}(a) & \ldots & \frac{\partial^2 f}{\partial x_n^2}(a) \end{pmatrix}
$$

Example:
$$
f(x, y) = x^2 + y^2 \rightarrow H_f(a) = \begin{pmatrix} 2 & 0 \\ 0 & 2 \end{pmatrix}
$$

### Jacobian Matrix

The Jacobian matrix of a function $f: \mathbb{R}^n \rightarrow \mathbb{R}^m$ at a point $a \in \mathbb{R}^n$ is the matrix of all partial derivatives of $f$ at $a$.

In contrast to the Gradient the Jacobian matrix works for vector fields. It gives an analogue to the gradient for vector fields.

$$
D f(a)=J_f(a) = \begin{pmatrix} \frac{\partial f_1}{\partial x_1}(a) & \frac{\partial f_1}{\partial x_2}(a) & \ldots & \frac{\partial f_1}{\partial x_n}(a) \\ \frac{\partial f_2}{\partial x_1}(a) & \frac{\partial f_2}{\partial x_2}(a) & \ldots & \frac{\partial f_2}{\partial x_n}(a) \\ \vdots & \vdots & \ddots & \vdots \\ \frac{\partial f_m}{\partial x_1}(a) & \frac{\partial f_m}{\partial x_2}(a) & \ldots & \frac{\partial f_m}{\partial x_n}(a) \end{pmatrix}
= \begin{pmatrix}\nabla f_1(a)^T \\ \nabla f_2(a)^T \\ \ldots \\ \nabla f_m(a)^T \end{pmatrix}
$$

Example:
$$
f(x, y) = \begin{pmatrix} x^2 + y\\ x^2 + y^2 \end{pmatrix} \rightarrow J_f(a) = \begin{pmatrix} 2x & 1 \\ 2x & 2y \end{pmatrix}
$$

#### Calculation rules for the Jacobian

- Addition rule: $J(f + g) = J_f + J_g$
- Homogeneous rule: $J(cf) = cJ_f$
- Product rule: $J(f^T \cdot g) = f(x)^T J_g(x) + g(x)^T J_f(x)$

### Laplace Operator

The Laplace operator is a second order partial derivative operator. It is defined on Scalar fields and is used to compute the rate of change of a scalar field.

$$
\Delta f = \nabla^2 f = \sum_{i=1}^n \frac{\partial^2 f}{\partial x_i^2}
$$

Example:
$$
f(x, y) = x^2 + y^2 \rightarrow \Delta f(a) = 2 + 2 = 4
$$

### Divergence

The Divergence of a vector field is the rate of shrinkage or expansion around a point. It is defined as the sum of the partial derivatives of the components of the vector field.

$$
\text{div} f = \sum_{i=1}^n \frac{\partial f_i}{\partial x_i} = \nabla \cdot f
$$

Example:
$$
f(x, y) = \begin{pmatrix} x^2 \\ y^2 \end{pmatrix} \rightarrow \text{div} f(a) = \frac{\partial f_1}{\partial x} + \frac{\partial f_2}{\partial y} = 2x + 2y
$$

### Curl / Rotation

The Curl of a vector field is the rate of rotation around a point. It is defined as the cross product of the partial derivatives of the components of the vector field.

$$
\text{rot} f = \nabla \times f = \begin{pmatrix} \frac{\partial f_3}{\partial x_2} - \frac{\partial f_2}{\partial x_3} \\ \frac{\partial f_1}{\partial x_3} - \frac{\partial f_3}{\partial x_1} \\ \frac{\partial f_2}{\partial x_1} - \frac{\partial f_1}{\partial x_2} \end{pmatrix}
$$

Example:
$$
f(x, y, z) = \begin{pmatrix} x^2 y \\ y^2 x \\ yz \end{pmatrix} \rightarrow \text{rot} f(a) = \begin{pmatrix}z \\ 0 \\ y^2-x^2 \end{pmatrix}
$$

## Taylor Expansion

It is also possible to approximate functions of multiple variables by Taylor expansions, by using the analog for higher order derivatives for functions of multiple variables.

## Coordinate Transformations

A bijection between two coordinate systems is called a coordinate transformation. It is a function $\phi: \mathbb{R}^n \rightarrow \mathbb{R}^m$ that maps points in one coordinate system to points in another coordinate system and vice versa.

### Jacobian Matrix of a Coordinate Transformation

The Jacobian matrix of this transformation is called *coordinate transformation matrix* and is defined as the matrix of all partial derivatives of the coordinate transformation.

Its determinant is called the *Jacobian determinant*.

Example:

We define the Transformation $\phi$ from polar coordinates to cartesian coordinates as follows:

$$
\begin{aligned}
&\qquad \phi(r,\phi) = \begin{pmatrix} r \cos \phi \\ r \sin \phi \end{pmatrix} := \begin{pmatrix} x\\ y \end{pmatrix}\\
&\implies J_\phi(r,\phi) = \begin{pmatrix} \cos \phi & -r \sin \phi \\ \sin \phi & r \cos \phi \end{pmatrix}\\
&\implies \text{det} J_\phi(r,\phi) = r
\end{aligned}
$$

## Roots and Optima

### Newton's Method

Newtons method in higher dimensions works similar to the one dimensional case. The only difference is that we have to compute the gradient and the Hessian matrix instead of the derivative.

#### 1D Newton's Method

$$
x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}
$$

#### Higher Dimensional Newton's Method

$$
\bf{x}_{n+1} = \bf{x}_n - \left( J_f(\bf{x}_n) \right)^{-1} \cdot f(\bf{x}_n)
$$

It konverges quadratically to a root in the neighborhood of the initial guess.

### Optima

If $f$ is a scalar field and $\bf{x_0}$ is a point in the domain of $f$:

- $\bf{x_0}$ is a global maximum if $f(\bf{x_0}) \geq f(\bf{x})$ for all $\bf{x} \in D$.
- $\bf{x_0}$ is a global minimum if $f(\bf{x_0}) \leq f(\bf{x})$ for all $\bf{x} \in D$.
- $\bf{x_0}$ is a local maximum if $f(\bf{x_0}) \geq f(\bf{x})$ for all $\bf{x} \in B_\epsilon(\bf{x_0})$.
- $\bf{x_0}$ is a local minimum if $f(\bf{x_0}) \leq f(\bf{x})$ for all $\bf{x} \in B_\epsilon(\bf{x_0})$.

All local extrema can be found from critical-points ($\nabla f(\bf{x})=0$) or at the boundary points.

But analog to the one-dimensional case, its also possible that a critical-point is neither a minum or a maximum point, because it is a "Saddle-Point"

### Criteria

A critical Point $\bf{x_0}\in D$ is:

- A local maximum if $H_f(\bf{x_0})$ is negative definite
- A local minum if $H_f(\bf{x_0})$ is positive definite
- A saddle point if $H_f(\bf{x_0})$ is indefiite

## Curves and Surfaces

## Curve

A curve is a mapping $\gamma : I\subseteq \mathbb{R} \to \mathbb{R}^n$. In other words it maps a line into higher dimensional space.

Example:

$$
\gamma(t)=\begin{pmatrix} \cos(2t)\\ \sin(t) \end{pmatrix}
$$

## Surface

A surface is a mapping $\gamma : I\subseteq \mathbb{R}^2 \to \mathbb{R}^n$. In other words it maps a 2d-surface into higher dimensional space.

## Quadrature

### Integral over rectangular domains

If $f: [a,b] \times [c,d] \to \mathbb{R}$ is a scalar field, the "sum" of scalar values along the area of the Domain can be computed as:

$$
\int\int_D f(x,y) dx dy = \int_a^d \int_c^d f(x,y) dx dy
$$

### Integration over simple domains

A 2d-standard Domain is defined as $D= \{ (x,y) | x\in [a,b] , l(x) \leq y \leq u(x) \}$. This means such a domain has one-varing paramater, which determines the lower- and upper bound of the surface at that point.

We can integrate over such domains using:

$$
\int\int_D f(x,y) dx dy = \int_{x=a}^b \int_{l(x)}^{u(x)} f(x,y) dx dy
$$

### Integration under coordinate transformations

If $B,D \subseteq \mathbb{R}^n$ are Domains and $\phi: B\to D$ is a transformation between these domains. The Domain-Integral can be rewritten as:

$$
\int_D f(x_1,\dots, x_n) dx_1 \cdots dx_2 = \int_B f(\phi(t_1,\dots t_n)) \cdot |\det(J_\phi(t_1,\dots t_n))|\ dt_1 \cdots dt_2
$$

## Partial differential equations

A PDE is a differential equation with multiple changing, variables.

Examples

- First order:
  - Traffic flow: $u_t + v u_x = f(x,t)$, where $v$ is velocity, $t$ is time and $x$ is a point along the road. The resulting $u(t,x)$ describes the cars at point $x$ and time $t$

- Second order:
  - Heat equation: $u_tt-c^2 \Delta u=0$
  - Laplace equaiton: $-\Delta u=0$
