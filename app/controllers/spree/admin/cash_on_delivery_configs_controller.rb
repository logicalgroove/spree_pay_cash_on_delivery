

module Spree
  module Admin
    class CashOnDeliveryConfigsController < Spree::Admin::BaseController

      def edit
      end

      def update
        flash[:success] = "Cash on delivery charge has been updated"
        redirect_to edit_admin_cash_on_delivery_configs_path
      end

    end
  end
end
