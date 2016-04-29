module SaleHelper
  def to_money(amount)
    '%.2f' % (amount / 100.0)
  end
end
