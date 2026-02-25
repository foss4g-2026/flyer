// FOSS4G Hiroshima 2026 Flyer (English)

#let image_path = "../assets/img9228.jpg"
#let logo_path  = "../assets/logo-02.svg"
#let img_height = 208mm
#let content = toml("../content_en.toml")

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
  dy: 33mm,
  block(width: 100%)[
    #align(center)[
      #text(fill: white, size: 40pt, weight: "bold",
        tracking: 0.5pt)[FOSS4G Hiroshima 2026]
      #v(4pt)
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

        [*#content.workshop.at(0).name*],
        [#content.workshop.at(0).date_start – #content.workshop.at(0).date_end \ #text(size: 7.5pt)[#content.workshop.at(0).venue]],

        [*#content.conference.at(0).name*],
        [#content.conference.at(0).date_start – #content.conference.at(0).date_end \ #text(size: 7.5pt)[#content.conference.at(0).venue]],

        [*#content.communitysprint.at(0).name*],
        [#content.communitysprint.at(0).date_start – #content.communitysprint.at(0).date_end]
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

        ..content.registration.tickets.map(ticket => {
          let details = if "note" in ticket and "deadline" in ticket {
            text(size: 7pt, fill: luma(50%))[#ticket.note — #ticket.deadline]
          } else if "deadline" in ticket {
            text(size: 7pt, fill: luma(50%))[#ticket.deadline]
          } else if "note" in ticket {
            text(size: 7pt, fill: luma(50%))[(#ticket.note)]
          } else {
            []
          }

          (
            [#ticket.name #if details != [] {[#details]}],
            [*#ticket.price*]
          )
        }).flatten()
      )
    ],
  )

  #v(10pt)
  #line(length: 100%, stroke: 0.5pt + luma(200))
  #v(6pt)

  // Footer: organizer, website, contact
  #set text(size: 8pt)
  #text(weight: "bold")[#content.footer.organizer]
  #linebreak()
  #link(content.url)[#content.url]
  #h(14pt)
  Contact: #link("mailto:" + content.footer.contact)[#content.footer.contact]
]

// Logo (absolute placement, bottom-right)
#place(
  bottom + right,
  dx: -18pt,
  dy: -14pt,
  image(logo_path, height: 26mm),
)

// QR code (absolute placement, bottom-left)
#place(
  bottom + left,
  dx: 18pt,
  dy: -14pt,
  image("../assets/foss4g-2026-en.svg", height: 26mm),
)
