# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'vendor'

class VendorTest < Minitest::Test
  def setup
    @vendor = Vendor.new
  end

  def test_get_stock
    assert_equal 5, @vendor.stock
  end
end
