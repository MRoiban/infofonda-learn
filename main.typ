#import "@preview/equate:0.2.0": equate
#import "@preview/showybox:2.0.1": showybox
#import "@preview/lovelace:0.3.0": *
#import "@preview/ilm:1.1.2": *

#show: ilm.with(
  title: [Informatique Fondamentale],
  author: "Roiban Marius-Alexandru",
  date: datetime(year: 2024, month: 07, day: 22),
  abstract: [],
  preface: [],
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true)
)

#let showbox(title, body) = box()[
  #showybox(
    shadow: (
      offset:3.5pt
    ), title: title,
    [#body]
  )
]


#let pseudocodeblock(title, code) = box[#text(
  font: "FiraCode Nerd Font Mono", 
  ligatures: true
)[
  #showybox(
    shadow: (
      offset: 3.5pt
  ),
  title: title,
  [#code]
  )
]]

#let CQFD = box[$space square.filled$]

#let cardinal(variable) = box[$bar variable bar$]

= Théorie de la complexité
#showbox("Problème de décision", [
  Un problème de décision est un langage $P subset.eq sum^*$
])

#showbox("Algorithme de décision",[
  Un algorithme qui pour un problème de décision $P$, on a un programme $A$ qui prend comme argument $u in sum^*$ tel que:
  $
    A(u) = cases(
      1 #[si $u in$ P] \
      0 #[sinon]
    )
  $
])

#showbox("La classe "+$cal(P)$, [
  La classe $cal(P)$ est la classe des problèmes qui peuvent être décidé en temps polynomial. Tout langage $P in sum^*$ qui a comme  un algorithme de décision qui va prendre un temps polynomial pour trouver une solution est alors en $P in cal(P)$:
  $
  A(u) &= O(n^k) \
  A(u) &= cases(
    1 #[si $u in P$] \
    0 #[sinon]
  )
  $
])

#showbox("Algorithme de vérification", [
  Un algorithme de vérification est un programme $A(u,v)$ qui va prendre comme argument une solution candidate $u in sum^* $ et va vérifier que cette solution est correcte en utilisant un certificat $v$ tel que:
  $
  A(u,v) = cases(
    1 #[si $u$ sachant $v in P$ ] \
    0 #[sinon]
  )
  $
])

#showbox("La classe "+$cal(N)cal(P)$, [
  Un problème $P$ est dit dans $cal(N)cal(P)$ s'il existe un algorithme de vérification $A$ en temps polynomial qui prends un mot $u in sum^*$ et une constante $k$, tel que pour tout $u$ les affirmations suivantes sont vraies:

  1. $u in P$
  2. la longeur du certificat $v$ est polynomiale:
      $
      bar v bar = O(#cardinal("u") ^k)
      $
])