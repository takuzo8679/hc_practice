# frozen_string_literal: true

require_relative 'juice'
require_relative 'suica'

DLINK_LIST = [
  { name: :pepsi, price: 150, num: 5 },
  { name: :monster, price: 230, num: 5 },
  { name: :irohasu, price: 120, num: 5 }
].freeze

class Vendor
  attr_reader :sales

  def initialize
    @sales = 0
    @stock = []
    DLINK_LIST.map do |juice|
      juice[:num].times do
        @stock << Juice.new(juice[:name], juice[:price])
      end
    end
  end

  def stock
    @stock.size
  end

  def can_buy?(suica, name)
    return false unless available_juice.include?(name)
    return false if suica.balance < juice_info(name)[:price]

    true
  end

  def buy(suica, name)
    raise 'チャージ残高か在庫が不足しています' unless can_buy?(suica, name)

    juice_index = @stock.index { |v| v.name == name }
    juice = @stock[juice_index]
    @stock.delete_at(juice_index)
    @sales += juice.price
    suica.withdrawal(juice.price)
  end

  # 購入可能ジュースリスト
  # @return [Array(String) ジュース名の配列
  def available_juice
    @stock.map(&:name).uniq
  end

  # 補充
  # @param [String] juice_name
  def refill(juice_name)
    juice = juice_info(juice_name)
    @stock << Juice.new(juice[:name], juice[:price])
  end

  private

  def juice_info(name)
    DLINK_LIST.find { |v| v[:name] == name }
  end
end
