# frozen_string_literal: true

require_relative 'pokemon'

# Pikachu
class Pikachu < Pokemon
  def attack
    puts "#{@name}の10万ボルト！"
  end
end
