# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'suica'
require_relative 'vendor'

class VendorTest < Minitest::Test
  def setup
    @vendor = Vendor.new
    @suica = Suica.new
  end

  def test_get_stock
    assert_equal 5, @vendor.stock
  end

  def test_can_buy
    assert_equal true, @vendor.can_buy?(@suica)
    # falseパターンはbuyで行う
  end

  def test_buy_ok
    @vendor.buy(@suica)
    assert_equal 4, @vendor.stock
  end

  def test_buy_ng_deposit_short
    @vendor.buy(@suica)
    @vendor.buy(@suica)
    @vendor.buy(@suica)
    e = assert_raises(RuntimeError) do
      @vendor.buy(@suica)
    end
    assert_equal 'チャージ残高か在庫が不足しています', e.message
  end

  def test_buy_ng_stock_short
    @suica.charge(1000)
    @vendor.buy(@suica)
    @vendor.buy(@suica)
    @vendor.buy(@suica)
    @vendor.buy(@suica)
    @vendor.buy(@suica)
    e = assert_raises(RuntimeError) do
      @vendor.buy(@suica)
    end
    assert_equal 'チャージ残高か在庫が不足しています', e.message
  end
end
