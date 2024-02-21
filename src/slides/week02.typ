#import "setup.typ": *
#show: this-template


- Problem 1-1: Quadratic Functionals (100 min)

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

$
  J_S(u) := integral_a^b 1/2 sigma(x) abs((diff u)/(diff x) (x))^2 - f(x) u(x) dif x
  \
  J_M(u) := integral_Omega 1/2 sigma(xv) norm(grad u (xv))^2 - f(xv) u(xv) dif xv
$

#pagebreak()

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


A quadratic functional on a real vector space V0 is a mapping J : V0 �→ R of the form
J(u) := 1
2a(u, u) − ℓ(u) + c ,
u ∈ V0 ,
(1.2.3.3)
where a : V0 × V0 �→ R is a symmetric bilinear form (→ Def. 0.3.1.4), ℓ : V0 �→ R a linear form,


