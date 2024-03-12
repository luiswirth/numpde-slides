#import "@preview/polylux:0.3.1": *
#import "@preview/cetz:0.2.1"

#import "../math.typ": *
#import "../layout.typ": *


#let titleslide(nweek) = page(
  background: image("../res/numpde-art0.jpg", width: 100%)
)[
  #set text(black)

  #box(fill: rgb(255, 255, 255, 200), radius: 0pt, outset: 40pt)[
    #align(center)[
      #text(size: 100pt)[
        NumPDE
      ] \
      #text(size: 17pt)[
        Numerical Methods for Partial Differential Equations
      ]
      #v(1cm)
      #text(size: 45pt)[
        Week \##nweek
      ] \
      #text(size: 20pt)[
        Tutorial Class 2024
      ]

      #v(2cm)
      #text(size: 30pt)[
        Luis Wirth
      ]
      \
      #link("mailto:luwirth@student.ethz.ch")
    ]
  ]
]

#let githubref = page(
  fill: white.darken(10%),
)[
  #set text(black)

  #let height = 70%
  #align(horizon + center, grid(
    columns: (auto, auto),
    gutter: 0pt,
    align(horizon, image("../res/github-banner.png", height: height)),
    align(horizon, box(fill: white, image("../res/github-qr.svg", height: height))),
  ))

  #v(1em)
  #align(center, text(size: 40pt, link("github.com/LU15W1R7H/numpde-notes")))
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

