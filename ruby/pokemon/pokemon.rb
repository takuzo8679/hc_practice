# frozen_string_literal: true

require_relative 'change_name'

# Pokemon
class Pokemon
  include ChangeName

  attr_reader :name

  def initialize(name, type1, type2, hit_point)
    @name = name
    @type1 = type1
    @type2 = type2
    @hit_point = hit_point
  end

  def attack
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end
end
