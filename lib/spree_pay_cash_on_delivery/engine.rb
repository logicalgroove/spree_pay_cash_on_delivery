module SpreePayCashOnDelivery
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_pay_cash_on_delivery'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc

    initializer "spree_cash_on_delivery.register.payment_method", :after => "spree.register.payment_methods" do |app|
      app.config.spree.payment_methods << Spree::CashOnDelivery::PaymentMethod
    end

  end
end
