# frozen_string_literal: true

require 'optparse'
require 'date'

# オプション引数を有無に関わらず一旦代入
month = ARGV.getopts('m:')['m']&.to_i

# オプションあり、かつ範囲外の場合はエラー表示して終了
if month && !(1..12).include?(month)
  puts "#{month} is neither a month number (1..12) nor a name"
  return
end

# 年月のデフォルトは月初。オプションが優先
month ||= Date.today.month
year = Date.today.year

# Dateクラスから開始曜日、開始日、終了日を変数に代入
start_date = Date.new(year, month, 1)
start_day_of_week = start_date.wday # 日曜が0、土曜が6
start_day_of_week = 7 if start_date.sunday? # 今後の処理のために日曜日を7として扱う
start_day = start_date.day
end_day = Date.new(year, month, -1).day

# カレンダーのヘッダ部分の出力
puts "      #{month}月  #{year}"
puts ' 月 火 水 木 金 土 日'

# 1日の開始曜日の調整：ずれる分だけ空白3つ出力
print ' ' * 3 * (start_day_of_week - 1)

# 1日から最終日までを出力
(start_day..end_day).each do |day|
  print format('% 3d', day)
  puts "\n" if ((day + start_day_of_week - 1) % 7).zero?
end

# 整形用に改行
puts "\n"
