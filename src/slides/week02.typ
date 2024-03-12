#import "setup.typ": *
#show: this-template


#let pathemph(a, b) = [
  #text(fill: white.darken(60%))[#a]#b
]

#titleslide("02")

#pagebreak()

#githubref

= Big picture of NumPDE

The name of this course is a little big of a misnomer.
Numerical Methods for Partial Differential Equations.
A more appropriate name would be 
Numerical Methods for Continuum Models with Local Interactions

- We are not directly interested in PDEs, they just happen to be 
  a good way of formulating our problems.
- But there is a more important formulation for us: Weak formulations.

We want to mathmatically model real world problems.
In particular we are studying continuum models (with local interactions).
This means our 


#pagebreak()

- Configuration space (uncountably) infinite dimensional.
  (Infinitly many variables)
- Function space


$
  hat(V)_S
  :=
  { u: [a,b] -> RR "continuous" | u(a) = u_a, u(b) = u_b }
  =
  { u in C^0([a, b], RR) | u(a) = u_a, u(b) = u_b }
$

$
  hat(V)_M = { u in C^0(clos(Omega), RR) | restr(u)_(diff Omega) = g }
$

These spaces are not vector spaces but affine spaces, so shifted vector spaces.
They don't have a zero vector.
$
  hat(V) = V_0 + v_0
$

#pagebreak()

Equilibrium problem can be converted into energy minimization problem
$
  u = arg min_(v in hat(V)) J(v)
$

$
  J_S(u) := integral_a^b 1/2 sigma(x) abs((diff u)/(diff x) (x))^2 - f(x) u(x) dif x
  \
  J_M(u) := integral_Omega 1/2 sigma(xv) norm(grad u (xv))^2 - f(xv) u(xv) dif xv
$

For compatibility with energy functionals, we need a further restriction of function spaces.

$
  hat(V)_S
  :=
  { u C^1_"pw" ([a,b]) | u(a) = u_a, u(b) = u_b }
$

$
  hat(V)_M = { u in C^1_"pw" (clos(Omega)) | restr(u)_(diff Omega) = g }
$

#pagebreak()

All the functionals we've seen so far have a common form.
They are all quadratic functionals.
Their canonical form is
$
  J(v) = 1/2 a(v,v) - l(v) + c
$
Where $a: V times V -> RR$ is a symmetric bilinear form (linear in both arguments)
$l: V -> RR$ is a linear form and $c in RR$ is a constant.

When the functional is quadratic, we are solving a quadratic minimization problem.

#pagebreak()

Existance and Uniqueness of Minimizers

Positive semi-definite bilinear form
$a(v, v) >= 0 forall v in V_0$

The positive semi-definitness is a necessary condition for the existance of a minimizer.
Image of positive-semi definite.

Positive definite bilinear form
$
  a(v, v) > 0
  quad forall v in V_0 \\ {0}
$

If the bilinear form is positive definite then any solution (might not exist)
is unique.

#pagebreak()

Energy norm
$
  norm(dot)_a : V -> RR, quad
  norm(v)_a := a(v, v)^(1/2)
$

Continuity of bilinear and linear form
$
  exists C > 0:
  quad
  abs(l(v)) <= C norm(v)
  quad
  forall v in V_0
  \  
  exists C > 0:
  quad
  abs(a(u, v)) <= C norm(u) norm(v)
  quad
  forall u,v in V_0
$

The continuity of $l$ with respect to the energy norm induced by the bilinear form $a$,
is necessary for the existance of a minimizer.
In other words the linear form $l$ needs to somehow match the bilinear form $a$. It must
be wellbehaved.

#myblock[Linear form $linf(l)$][
*Given*: \
$V$: vector space over $RR$ \

*Definition*:
$
  linf(l): V -> RR
  \
  forall u, v in V
  quad
  forall alpha, beta in RR
  quad
  linf(l) (alpha u + beta v) = alpha linf(l) (u) + beta linf(l) (v)
$
]


In finite dimensions actually every linear form is continuous.
And furthermore the symettric positive definite property of the bilinear form
is not only necessary but also sufficent for the existance of a unique minimizer.

In infinite dimensions this however doesn't hold and we have to deal with some weird phenomens.

#pagebreak()

Sobolov spaces.

$
  x = arg min_(y in QQ) abs(y^2 - 2)
$
No minimizer $x in QQ$ exists.
For any potential candidate minimizer $x'$ we can find another $x''$ that
makes the expression even smaller.
$QQ$ is not complete. The solution actually lives in $RR$. $QQ$ is the wrong space
to minimize in.

Cauchy Sequence
$
  forall epsilon > 0 quad
  exists n in NN: quad
  norm(v_i - v_j) <= epsilon quad
  forall i,j >= n
$

On a real Hilbert space $V_0$ the quadratic minimzation problem with a energy norm has a unique solution.

$
  norm(v)_0 = norm(v)_(L^2 (Omega)) := (integral_Omega abs(v(xv))^2 dif xv)^(1/2)
$

$
  C^0_"pw" (Omega) subset L^2 (Omega)
$

$
  H^1 (Omega)
$

$H^1$-seminorm!
$
  abs(v)_(H^1 (Omega)) := integral_Omega abs(grad v(xv))^2 dif xv
$

The space H^1 is defined using it's seminorm.
The energy _norm_ however is the actual H^1 norm. So including the L^2 norm.

L^2 is H^0.

$H^1$ norm
$norm(v)_(H^1 (Omega)) = abs(v)_(H^1 (Omega)) + abs(v)_(L^2 (Omega))$

$
  C^1_"pw" subset H^1 (Omega)
$


#pagebreak()

We will be solving our problems on Sobolov spaces.
But we just need to work with the norms of the sobolov space.

In order to check the continuity of bilinear or linear forms on the spaces,
we will make a lot of use of the Cauchy-Schwarz inequality.
$
  abs(inner(u, v)) <= sqrt(inner(u, u)) sqrt(inner(v, v)) = norm(u) norm(v)
$

For L^2
$
  abs(integral_Omega u(xv) v(xv) dif xv) <= (integral_Omega abs(u(xv))^2 dif xv)^(1/2) (integral_Omega abs(v(xv))^2 dif xv)^(1/2)
$

First Poincaré-Friedrichs inequality
$
  norm(u)_0 <= "diam"(Omega) abs(u)_1
$

#pagebreak()

Linear Variational Problems

$
  phi_v: RR -> RR \
  phi_v (t) = J(u + t v) \
  = 1/2 a(u + t v, u + t v) - l(u + t v) + c \
  = 1/2 a(u, u) + t a(u, v) + 1/2 t^2 u(v, v) - l(u) - t l(v) + c
  \
  (dif phi_v)/(dif t)(t)
  = a(u, v) + t u(v, v) - l(v)
  \
  (dif phi_v)/(dif t)(0) = a(u, v) - l(v) = 0
  \
  a(u, v) = l(v)
$

$
  u in hat(V): quad
  a(u, v) = l(v)
  quad forall in V_0
$

The quadratic minimization prbolem and the lineare variational problem are equivalent.

#pagebreak()

Green's first formula (integration by parts in higher dimensions)

For any $avec(j) in (C^1_"pw" (clos(Omega)))^d$ and $v in C^1_"pw" (clos(Omega))$
$
  integral_Omega avec(j) dot grad v dif xv
  =
  -integral_Omega "div"(avec(j)) v dif xv
  +
  integral_(diff Omega) avec(j) dot nvec(n) v dif xv
$

Fundamental lemma of calculus of variations in higher dimensions

If $f in L^2 (Omega)$ satisfies
$
  integral_Omega f(xv) v(xv) dif xv = 0
  quad forall v in C_0^oo (Omega)
$
then $f eq.triple 0$.
