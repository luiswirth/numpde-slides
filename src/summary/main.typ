#import "setup.typ": *
#show: this-template

//Theorem 0.3.1.19 Cauchy Schwarz Inequality
#myblock(color: blue)[Cauchy-Schwarz inequality][
  $bilf(a): V times V -> RR$ symmetric positive semi-definite bilinear form

  $
    abs(bilf(a)(u, v)) <= bilf(a)(u, u)^(1/2) bilf(a)(v, v)^(1/2)
  $
]


#myblock(color: blue)[Transformation rule for Integration][
  $Omega, hat(Omega) subset.eq RR^d$ \
  $Phi in C^1(hat(Omega), Omega)$

  $
    integral_Omega
    f(xv) dif xv
    =
    integral_hat(Omega)
    f(Phi(hat(xv))) abs(det Dif Phi(hat(xv))) dif hat(xv)
  $
]

#myblock[Norms][

  supremum norm \
  $
    norm(avec(u))_oo =
    norm(avec(u))_(L^oo (Omega)) :=
    sup_(avec(x) in Omega) norm(avec(u)(xv))
  $

  $L^2$ norm
  $
    norm(avec(u))_2 =
    norm(avec(u))_(L^2 (Omega)) :=
    (integral_Omega norm(avec(u)(xv))^2)^(1/2)
  $
]


$
  integral_Omega avec(j) dot grad v dif xv
  =
  -integral_Omega "div"(avec(j)) v dif xv
  +
  integral_(diff Omega) avec(j) dot nvec(n) v dif xv
$
