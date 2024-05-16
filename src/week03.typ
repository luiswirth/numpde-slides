#import "setup.typ": *
#show: this-template


#let pathemph(a, b) = [
  #text(fill: white.darken(60%))[#a]#b
]

#titleslide("03")

#pagebreak()

#githubref

#pagebreak()

= Setting

Hilbert space $V_0$ \
Symmetric Positive-Definite Bilinear form $a: V times V -> RR$ \
Continuous Linear form $l: V -> RR$ \

Gives rise to linear variational problem
$
  u in V_0: quad
  a(u, v) = l(v)
  quad forall v in V_0
$

Notice that here we are considering only the vector space and not the affine space.
Meaning that a conversion is needed, if the problem was originally posed on an affine space.
Is will be done using the *offset function trick*. $hat(u) = u_0 + tilde(u)$

#pagebreak()

Finite dimensional subspace
#text(size: 60pt)[$
  V_(0, h) subset V_0
  \
  dim V_(0,h) < oo
$]

Discrete linear variational problem (DVP)
$
  u_h in V_(0,h): quad
  a(u_h, v_h) = l(v_h)
  quad forall v_h in V_(0,h)
$

#pagebreak()


#cetz.canvas(length: 3cm, {
  import cetz.draw: *

  let box_text_size = 16pt
  
  let lvp = text(box_text_size)[$
    u in V_0: quad
    a(u, v) = l(v)
    quad forall v in V_0
  $]
  let dvp = text(box_text_size)[$
    u_h in V_(0,h): quad
    a(u_h, v_h) = l(v_h)
    quad forall v_h in V_(0,h)
  $]
  let cmin = text(box_text_size)[$
    u = argmin_(v in V_0) J(v)
  $]
  let dmin = text(box_text_size)[$
    u_h = argmin_(v_h in V_(0,h)) J(v_h)
  $]

  set-style(
    mark: (fill: white, scale: 2),
    line: (stroke: white),
    circle: (stroke: white),
    stroke: (thickness: 0.4pt, cap: "round"),
    content: (padding: 5pt)
  )

  rect((0, 0), (3.0, 1), stroke: (paint: white, thickness: 1pt),name: "rect0")
  rect((5, 0), (9, 1), stroke: (paint: white, thickness: 1pt),name: "rect1")
  rect((0, -2), (3.0, -1), stroke: (paint: white, thickness: 1pt),name: "rect2")
  rect((5, -2), (9, -1), stroke: (paint: white, thickness: 1pt),name: "rect3")
  content("rect0", lvp)
  content("rect1", dvp)
  content("rect2", cmin)
  content("rect3", dmin)
  line("rect0", "rect1", mark: (end: "stealth"), name: "line0")
  line("rect2", "rect3", mark: (end: "stealth"), name: "line1")
  content(("line0.start", 50%, "line0.end"), align(center)[Galerkin\ Discretization], anchor: "south")
  content(("line1.start", 50%, "line1.end"), align(center)[Ritz\ Discretization], anchor: "south")
  content(("rect0", 50%, "rect2"), text(40pt, sym.arrow.t.b.double))
  content(("rect1", 50%, "rect3"), text(40pt, sym.arrow.t.b.double))
})

#pagebreak()

$
  frak(B)_h = {b_h^1, dots, b_h^N}
  quad
  N = dim V_(0,h)
  \
  V_(0,h) = "span" frak(B)_h
  \
  u in V_(0,h) ==> u = sum_(i=1)^N mu_i b_h^i
  quad
  u tilde.eq vvec(mu) in RR^N
  \
  v in V_(0,h) ==> v = sum_(i=1)^N nu_i b_h^i
  quad
  v tilde.eq vvec(nu) in RR^N
$

#pagebreak()

$
  u_h in V_(0,h):&& quad
  bilf(a)(u_h, v_h) &= linf(l)(v_h)
  quad &&forall v_h in V_(0,h)
  \
  vvec(mu) in RR^N:&& quad
  bilf(a)(sum_(j=j)^N mu_j b_h^j, sum_(i=1)^N nu_i b_h^i) &= linf(l)(sum_(i=1)^N nu_i b_h^i)
  quad &&forall avec(nu) in RR^N
  \
  vvec(mu) in RR^N:&& quad
  sum_(j=1)^N mu_j sum_(i=1)^N nu_i bilf(a)(b_h^j, b_h^i) &= sum_(i=1)^N nu_i linf(l)(b_h^i)
  quad &&forall avec(nu) in RR^N
  \
  vvec(mu) in RR^N:&& quad
  sum_(i=1)^N nu_j (sum_(i=1)^N mu_i bilf(a)(b_h^j, b_h^i) - linf(l)(b_h^i)) &= 0
  quad &&forall avec(nu) in RR^N
  \
  vvec(mu) in RR^N:&& quad
  sum_(i=1)^N mu_i bilf(a)(b_h^j, b_h^i) - linf(l)(b_h^i) &= 0
  quad &&forall i in {1,dots,N}
  \
  vvec(mu) in RR^N:&& quad
  sum_(i=1)^N mu_i bilf(a)(b_h^j, b_h^i) &= linf(l)(b_h^i)
  quad &&forall i in {1,dots,N}
  \
  vvec(mu) in RR^N:&& quad
  amat(A) vvec(mu) &= vvec(phi)
  quad&&
$
with
$
  &vvec(mu) &&= [mu_1, dots, mu_N]^transp &&in RR^N
  \
  &amat(A) &&= [bilf(a)(b_h^j, b_h^i)]_(i,j=1)^N &&in RR^(N times N)
  \
  &vvec(phi) &&= [linf(l)(b_h^i)]_(i,j=1)^N &&in RR^N
$

LSE!!!
$
  amat(A) vvec(mu) = vvec(phi)
$

The solution can then be recovered by
$
  u_h = sum_(i=1)^N mu_i b_h^i
$

#pagebreak()

Concrete 1D Galerkin Discretization

$
  u in H^1_0 (]a,b[): quad
  integral_a^b
  (dif u)/(dif x)(x) (dif v)/(dif x)(x) dif x
  =
  integral_a^b
  f(x) v(x) dif x
  quad forall v in H^1_0 (]a,b[)
$

