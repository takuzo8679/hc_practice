# frozen_string_literal: true

require_relative 'juice'

INITIAL_STOCK = [
  { name: 'pepci', price: 150, num: 5 }
].freeze

class Vendor
  def initialize
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
end
