module JobBoard
  module Stripe
    class CreateCharge < Base
      
      def execute
        ::Stripe::Charge.create(
          :amount => @object[:amount],
          :currency => "usd",
          :source => @object[:token], # obtained with Stripe.js
          :description => "Charge for #{@object[:email]} for posting # #{@object[:transaction_id]}"
        )      
      end
      
    end
  end
end