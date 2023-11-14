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
    assert_equal 15, @vendor.stock
  end

  def test_can_buy
    assert_equal true, @vendor.can_buy?(@suica, :pepsi)
    # falseパターンはbuyで行う
  end

  def test_buy_ok
    assert_equal 0, @vendor.sales
    @vendor.buy(@suica, :pepsi)
    assert_equal 14, @vendor.stock
    assert_equal 150, @vendor.sales
    @vendor.buy(@suica, :monster)
    assert_equal 13, @vendor.stock
    assert_equal 380, @vendor.sales
    @vendor.buy(@suica, :irohasu)
    assert_equal 12, @vendor.stock
    assert_equal 500, @vendor.sales
  end

  def test_buy_ng_deposit_short
    @vendor.buy(@suica, :pepsi)
    @vendor.buy(@suica, :pepsi)
    @vendor.buy(@suica, :pepsi)
    e = assert_raises(RuntimeError) do
      @vendor.buy(@suica, :pepsi)
    end
    assert_equal 'チャージ残高が不足しています', e.message
  end

  def test_buy_ng_stock_short
    @suica.charge(1000)
    5.times { @vendor.buy(@suica, :pepsi) }
    e = assert_raises(RuntimeError) do
      @vendor.buy(@suica, :pepsi)
    end
    assert_equal '在庫がありません', e.message
  end

  def test_available_juice
    assert_equal %i[pepsi monster irohasu], @vendor.available_juice
  end

  def test_refill
    @vendor.refill(:pepsi)
    @vendor.refill(:monster)
    @vendor.refill(:irohasu)
    assert_equal 18, @vendor.stock
  end
end
