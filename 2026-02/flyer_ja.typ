// FOSS4G Hiroshima 2026 チラシ（日本語版）

#let image_path = "../assets/img9228.jpg"
#let logo_path  = "../assets/logo-02.svg"
#let img_height = 208mm
#let content = toml("../content_ja.toml")

#set page(paper: "a4", margin: 0pt)
#set text(
  font: ("Hiragino Sans", "Hiragino Kaku Gothic Pro", "Hiragino Kaku Gothic ProN"),
  lang: "ja",
)

// ─────────────────────────────────────────────────────────────
// 上部：フル幅画像 ＋ タイトルオーバーレイ（A4の約70%）
// ─────────────────────────────────────────────────────────────

// 背景画像（縁なし・フル幅）
#place(
  top + left,
  image(image_path, width: 100%, height: img_height, fit: "cover"),
)

// テキスト可読性のためのグラデーションオーバーレイ（上部：透明 → 下部：暗）
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

// タイトル（画像の下寄りに配置）
#place(
  top + center,
  dy: 33mm,
  block(width: 100%)[
    #align(center)[
      #text(fill: white, size: 40pt, weight: "bold",
        tracking: 0.5pt, font: "Helvetica Neue")[FOSS4G Hiroshima 2026]
      #v(4pt)
    ]
  ],
)

// 画像エリアをフロー上でスキップ
#v(img_height)

// ─────────────────────────────────────────────────────────────
// 下部：イベント詳細（A4の約30%）
// ─────────────────────────────────────────────────────────────

#block(
  width: 100%,
  inset: (x: 24pt, top: 14pt, bottom: 0pt),
)[
  // スケジュールと参加費の2段組
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 20pt,
    align: (top, top),

    // ── 左列：スケジュール ──
    [
      #text(size: 10.5pt, weight: "bold")[スケジュール]
      #v(5pt)
      #set text(size: 8.5pt)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 6pt,
        row-gutter: 5pt,

        [*#content.workshop.at(0).name*],
        [#content.workshop.at(0).date_start 〜 #content.workshop.at(0).date_end \ #text(size: 7.5pt)[#content.workshop.at(0).venue]],

        [*#content.conference.at(0).name*],
        [#content.conference.at(0).date_start 〜 #content.conference.at(0).date_end \ #text(size: 7.5pt)[#content.conference.at(0).venue]],

        [*#content.communitysprint.at(0).name*],
        [#content.communitysprint.at(0).date_start 〜 #content.communitysprint.at(0).date_end]
      )
    ],

    // ── 右列：参加費 ──
    [
      #text(size: 10.5pt, weight: "bold")[参加費]
      #v(5pt)
      #set text(size: 8.5pt)
      #grid(
        columns: (1fr, auto),
        column-gutter: 6pt,
        row-gutter: 3pt,
        align: (left, right),

        ..content.registration.tickets.map(ticket => {
          let details = if "note" in ticket and "deadline" in ticket {
            text(size: 7pt, fill: luma(50%))[#ticket.note #ticket.deadline]
          } else if "deadline" in ticket {
            text(size: 7pt, fill: luma(50%))[#ticket.deadline]
          } else if "note" in ticket {
            text(size: 7pt, fill: luma(50%))[（#ticket.note）]
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

  // フッター：主催・URL・連絡先
  #set text(size: 8pt)
  #text(weight: "bold")[#content.footer.organizer]
  #linebreak()
  #link(content.url)[#content.url]
  #h(14pt)
  問い合わせ：#link("mailto:" + content.footer.contact)[#content.footer.contact]
]

// ロゴ（右下に絶対配置）
#place(
  bottom + right,
  dx: -18pt,
  dy: -14pt,
  image(logo_path, height: 26mm),
)

// QRコード（左下に絶対配置）
#place(
  bottom + left,
  dx: 18pt,
  dy: -14pt,
  image("../assets/foss4g-2026-ja.svg", height: 26mm),
)
