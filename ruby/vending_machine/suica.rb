# frozen_string_literal: true

class Suica
  def initialize
    # 残高
    @balance = 500
  end

  def balance
    @balance
  end

  def charge(deposit)
    raise '入金は100円以上からです' if deposit < 100

    @balance += deposit
  end

  def withdrawal(money)
    @balance -= money
  end
end
