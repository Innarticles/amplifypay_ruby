module AmplifypayRuby
  module Checkout
    class Invoice < AmplifypayRuby::Checkout::Core

      attr_accessor :total_amount, :redirect_url, :store, :paymentDescription
      attr_accessor :customer, :status_desc, :trans_id, :transaction_ref, :response_text, :invoice_url, :status_code

      def initialize
        @trans_id = "22"
        @customer = {}
        @total_amount =  0.0
        @redirect_url  =  ""
        @paymentDescription = ""
      end

      def get_customer_info(key)
        @customer["#{key}"]
      end

      def get_custom_data(key)
        @custom_data["#{key}"]
      end

      def confirm(token)
        verification_payload = build_verification_payload(token)
        result = http_json_request(AmplifypayRuby::Setup.checkout_confirm_base_url, verification_payload)

        if result["StatusDesc"] == "Approved"
          # rebuild_invoice(result)
          @response_text = "Payment was successful"
          true
        else
          @status = result["status"]
          @response_text = "Invoice status is #{result['StatusDesc'].upcase}"
          false
        end
      end

      def create
        result = http_json_request(AmplifypayRuby::Setup.checkout_base_url,build_invoice_payload)
        @store = result.inspect
        create_response(result)
      end

      protected
      def build_invoice_payload
         { 
          merchantId: AmplifypayRuby::Setup.merchant_id,
          apiKey: AmplifypayRuby::Setup.private_key, 
          transID: @trans_id, 
          customerEmail: @customer["email"], 
          customerName: @customer["name"], 
          Amount: @total_amount, 
          redirectUrl: AmplifypayRuby::Setup.redirect_url,
          paymentDescription: @paymentDescription
      }
      end 

      def build_verification_payload(token)
         { 
          merchantId: AmplifypayRuby::Setup.merchant_id,
          apiKey: AmplifypayRuby::Setup.private_key, 
          transactionRef: token
      }

      end

      def rebuild_invoice(result={})

      end

      def create_response(result={})

        if result["StatusCode"] == "000"
          @status_desc = result["StatusDesc"]
          @status_code = result["StatusCode"]
          @trans_id = result["TransID"]
          @transaction_ref = result["TransactionRef"]
          @auth_token = result["AuthToken"]
          @invoice_url = result["PaymentUrl"]
          @status = AmplifypayRuby::SUCCESS
          true
        else
          @status_desc = result["StatusDesc"]
          @status_code = result["StatusCode"]
          @invoice_url = nil
          @status = AmplifypayRuby::FAIL
          false
        end
      end

    end
  end
end
