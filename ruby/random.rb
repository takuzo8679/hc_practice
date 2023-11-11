# frozen_string_literal: true

'ABCDEF' # メンバを定義
  .chars # 配列化
  .shuffle # シャッフル
  .each_slice(rand(3..4)) # ランダムに分解=要素数3or4
  .to_a # Enumarable型を配列に変換
  .map(&:sort) # メンバをアルファベット順にソート
  .sort_by(&:size) => [group_a, group_b ] # グループをサイズ小さい順にソートして代入

p group_a
p group_b
