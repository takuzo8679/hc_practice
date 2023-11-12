# frozen_string_literal: true

# 全メンバー
all_member = 'ABCDEF'.chars

# グループA：ランダムに2or3人抽出 -> 名前順にソート
p group_a = all_member
            .sample(rand(2..3))
            .sort

# グループB：全メンバからAを除いたメンバ
p all_member - group_a
