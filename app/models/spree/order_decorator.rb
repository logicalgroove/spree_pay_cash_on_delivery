Spree::Order.class_eval do

  def cash_on_delivery_payment?
    payments && payments.last.payment_method.is_a?(Spree::CashOnDelivery::PaymentMethod)
  end

end
