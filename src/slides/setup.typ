#import "../math.typ": *
#import "../layout.typ": *

#let this-template(doc) = [
  #show: math-template

  #set page(paper: "presentation-16-9")

  #set text(white)
  #set page(fill: black)
  #set page(margin: 2cm)
  #set par(justify: true)

  #show heading: it => block(
      //stroke: white,
      fill: gray.darken(70%),
      inset: 0.3em,
      radius: 0.2em,
  )[
    #it.body
  ]

  #doc
]

