// FOSS4G Hiroshima 2026 Flyer (English)

#let image_path = "../assets/img9228.jpg"
#let logo_path  = "../assets/logo-02.svg"
#let img_height = 208mm

#set page(paper: "a4", margin: 0pt)
#set text(font: ("Helvetica Neue", "Arial", "Helvetica"), lang: "en")

// ─────────────────────────────────────────────────────────────
// Top: Full-width image + title overlay (~70% of A4)
// ─────────────────────────────────────────────────────────────

// Background image (no margin, full width)
#place(
  top + left,
  image(image_path, width: 100%, height: img_height, fit: "cover"),
)

// Gradient overlay for text readability (transparent top → dark bottom)
#place(
  top + left,
  rect(
    width: 100%,
    height: img_height,
    fill: gradient.linear(
      (rgb(0, 0, 0, 0%), 0%),
      (rgb(0, 0, 0, 0%), 25%),
      (rgb(0, 0, 0, 62%), 100%),
      angle: 90deg,
    ),
  ),
)

// Title (positioned in the lower portion of the image)
#place(
  top + center,
  dy: 134mm,
  block(width: 100%)[
    #align(center)[
      #text(fill: white, size: 44pt, weight: "bold",
        tracking: 0.5pt)[FOSS4G Hiroshima 2026]
      #v(4pt)
      #text(fill: white, size: 36pt, weight: "bold")[Peace4G]
    ]
  ],
)

// Skip past the image in the document flow
#v(img_height)

// ─────────────────────────────────────────────────────────────
// Bottom: Event details (~30% of A4)
// ─────────────────────────────────────────────────────────────

#block(
  width: 100%,
  inset: (x: 24pt, top: 14pt, bottom: 0pt),
)[
  // Two-column layout: Schedule | Registration
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 20pt,
    align: (top, top),

    // ── Left column: Schedule ──
    [
      #text(size: 10.5pt, weight: "bold")[Schedule]
      #v(5pt)
      #set text(size: 8.5pt)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 6pt,
        row-gutter: 5pt,

        [*Hands-on Days*],
        [August 30 – 31, 2026 \ #text(size: 7.5pt)[RCC Bunka Center]],

        [*Core Days*],
        [September 1 – 3, 2026 \ #text(size: 7.5pt)[International Conference Center Hiroshima]],

        [*Community Sprint*],
        [September 4 – 5, 2026 \ #text(size: 7.5pt)[Planned in Hiroshima]],
      )
    ],

    // ── Right column: Registration ──
    [
      #text(size: 10.5pt, weight: "bold")[Registration]
      #v(5pt)
      #set text(size: 8.5pt)
      #grid(
        columns: (1fr, auto),
        column-gutter: 6pt,
        row-gutter: 3pt,
        align: (left, right),

        [Super Early Bird \ #text(size: 7pt, fill: luma(50%))[Limited to 100 — Until March 7, 2026]],
        [*¥40,000*],

        [Early Bird \ #text(size: 7pt, fill: luma(50%))[Until April 21, 2026]],
        [*¥50,000*],

        [Regular \ #text(size: 7pt, fill: luma(50%))[Until day of event]],
        [*¥80,000*],

        [Student],
        [*¥30,000*],

        [Local #text(size: 7pt, fill: luma(50%))[(for residents in Japan, non-student)]],
        [*¥40,000*],

        [Each Workshop],
        [*¥7,500*],
      )
    ],
  )

  #v(10pt)
  #line(length: 100%, stroke: 0.5pt + luma(200))
  #v(6pt)

  // Footer: organizer, website, contact
  #set text(size: 8pt)
  #text(weight: "bold")[Organized by: FOSS4G Hiroshima 2026 LOC / OSGeo.JP / OSGeo Foundation]
  #linebreak()
  #link("https://2026.foss4g.org/")[https://2026.foss4g.org/]
  #h(14pt)
  Contact: #link("mailto:info@foss4g.org")[info\@foss4g.org]
]

// Logo (absolute placement, bottom-right)
#place(
  bottom + right,
  dx: -18pt,
  dy: -14pt,
  image(logo_path, height: 26mm),
)
