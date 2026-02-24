// FOSS4G Hiroshima 2026 チラシ（日本語版）

#let image_path = "../assets/img9228.jpg"
#let logo_path  = "../assets/logo-02.svg"
#let img_height = 208mm

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

        [*ハンズオンデイ*],
        [2026年8月30日 〜 31日 \ #text(size: 7.5pt)[RCC文化センター]],

        [*コアデイ*],
        [2026年9月1日 〜 3日 \ #text(size: 7.5pt)[広島国際会議場]],

        [*コミュニティスプリント*],
        [2026年9月4日 〜 5日 \ #text(size: 7.5pt)[広島で予定]],
      )
    ],

    // ── 右列：参加費 ──
    [
      #text(size: 10.5pt, weight: "bold")[参加費用]
      #v(5pt)
      #set text(size: 8.5pt)
      #grid(
        columns: (1fr, auto),
        column-gutter: 6pt,
        row-gutter: 3pt,
        align: (left, right),

        [Super Early Bird \ #text(size: 7pt, fill: luma(50%))[100枚限定 〜 2026年3月7日]],
        [*¥40,000*],

        [Early Bird \ #text(size: 7pt, fill: luma(50%))[〜 2026年4月21日]],
        [*¥50,000*],

        [Regular \ #text(size: 7pt, fill: luma(50%))[〜 当日]],
        [*¥80,000*],

        [学生],
        [*¥30,000*],

        [国内 #text(size: 7pt, fill: luma(50%))[（学生以外の国内在住者向け）]],
        [*¥40,000*],

        [各ハンズオン],
        [*¥7,500*],
      )
    ],
  )

  #v(10pt)
  #line(length: 100%, stroke: 0.5pt + luma(200))
  #v(6pt)

  // フッター：主催・URL・連絡先
  #set text(size: 8pt)
  #text(weight: "bold")[主催：FOSS4G Hiroshima 2026 LOC / OSGeo.JP / OSGeo財団]
  #linebreak()
  #link("https://2026.foss4g.org/")[https://2026.foss4g.org/]
  #h(14pt)
  問い合わせ：#link("mailto:info@foss4g.org")[info\@foss4g.org]
]

// ロゴ（右下に絶対配置）
#place(
  bottom + right,
  dx: -18pt,
  dy: -14pt,
  image(logo_path, height: 26mm),
)
