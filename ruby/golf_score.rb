# frozen_string_literal: true

# コマンドラインから値取得
regulations_strokes = gets.chomp.split(',').map(&:to_i)
player_strokes = gets.chomp.split(',').map(&:to_i)

# 表示
puts player_strokes.map.with_index { |v, i|
  next 'ホールインワン' if v == 1 && regulations_strokes[i] != 5

  {
    4 => '4ボギー',
    3 => '3ボギー',
    2 => '2ボギー',
    1 => 'ボギー',
    0 => 'パー',
    -1 => 'バーディ',
    -2 => 'イーグル',
    -3 => 'アルバトロス',
    -4 => 'コンドル'
  }[v - regulations_strokes[i]]
}.join(',')
