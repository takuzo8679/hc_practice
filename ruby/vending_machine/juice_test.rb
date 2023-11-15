# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'juice'

class JuiceTest < Minitest::Test
  def setup
    @juice = Juice.new(:test_name, 123)
  end

  def test_jice
    assert_equal :test_name, @juice.name
    assert_equal 123, @juice.price
  end
end
