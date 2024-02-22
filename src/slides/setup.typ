#import "../math.typ": *
#import "../layout.typ": *

#let titleslide = [
  #align(center)[
    #text(size: 100pt)[
      NumPDE
    ] \
    #text(size: 17pt)[
      Numerical Methods for Partial Differential Equations
    ]
    #v(1cm)
    #text(size: 45pt)[
      Week \#01
    ] \
    #text(size: 20pt)[
      Tutorial Class 2024
    ]

    #v(3cm)
    #text(size: 30pt)[
      Luis Wirth
    ]
    \
    #link("mailto:luwirth@student.ethz.ch")
  ]
]

#let githubref = [
  #page(fill: white.darken(10%), margin: 0pt)[

    #align(horizon, grid(
      columns: (60%, 40%),
      gutter: 0pt,
      align(horizon, image("../res/github-banner.png")),
      align(horizon, image("../res/github-qr.svg")),
    ))
    #v(1em)
    #align(center, text(fill: black, size: 30pt, link("github.com/LU15W1R7H/numpde-notes")))
  ]
]


#let this-template(doc) = [
  #set page(paper: "presentation-16-9")
  #set page(fill: black)
  #set page(margin: 2cm)

  #set text(white)
  #set text(size: 18pt)

  #set par(justify: true)
  
  #show link: underline
  
  #show: math-template

  #doc
]

