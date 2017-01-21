module JobBoard
  module Stripe
    class Base
      def initialize(data)
        @object = data
      end
      
      def execute
        raise 'Missing implementation Stripe::Base.execute'
      end    
    end
  end
end