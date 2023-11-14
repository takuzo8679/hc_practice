# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'suica'

class SuicaTest < Minitest::Test
  def setup
    @suica = Suica.new
  end

  def test_default_500_yen
    assert_equal 500, @suica.balance
  end

  def test_charge
    @suica.charge(100)
    assert_equal 600, @suica.balance
  end

  def test_charge_less_than_100_raise
    e = assert_raises(RuntimeError) do
      @suica.charge(99)
    end
    assert_equal '入金は100円以上からです', e.message
  end

  def test_withdrawal
    @suica.withdrawal(100)
    assert_equal 400, @suica.balance
  end
end
