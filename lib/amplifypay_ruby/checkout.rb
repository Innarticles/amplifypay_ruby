module AmplifypayRuby
  module Checkout
    class Core
      include AmplifypayRuby::Utilities
      attr_accessor :status, :response_text, :response_code, :transaction_id, :description, :token, :result, :invoice_token

      def push_results(result={})
        @result = result
        @transaction_id = result["transaction_id"]
        @description = result["description"]
        @response_code = result["response_code"]
        @response_text = result["response_text"]
        @token = result["token"]
        @response_code == "00" ? @status = AmplifypayRuby::SUCCESS : @status = AmplifypayRuby::FAIL
      end
    end
  end
end

%w(checkout/redirect_invoice
).each do |lib|
  require File.join(File.dirname(__FILE__), lib)
end
