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

