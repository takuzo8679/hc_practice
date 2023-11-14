# frozen_string_literal: true

require_relative 'juice'
require_relative 'suica'

INITIAL_STOCK = [
  { name: 'pepci', price: 150, num: 5 }
].freeze

class Vendor
  def initialize
    @sales = 0
    @stock = []
    INITIAL_STOCK.map do |juice|
      juice[:num].times do
        @stock << Juice.new(juice[:name], juice[:price])
      end
    end
  end

  def stock
    @stock.size
  end

  def can_buy?(suica)
    return false if @stock.empty?
    return false if suica.balance < @stock[0].price

    true
  end

  def buy(suica)
    raise 'チャージ残高か在庫が不足しています' unless can_buy?(suica)

    juice = @stock.pop
    @sales += juice.price
    suica.withdrawal(juice.price)
  end
end
