# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'juice'

class JuiceTest < Minitest::Test
  def setup
    @juice = Juice.new('test_name', 'test_price')
  end

  def test_jice
    assert_equal 'test_name', @juice.name
    assert_equal 'test_price', @juice.price
  end
end
