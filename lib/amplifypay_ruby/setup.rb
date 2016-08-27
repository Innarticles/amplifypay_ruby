module AmplifypayRuby
  module Setup
    @@merchant_id = nil
    @@private_key = nil
    @@public_key = nil
    @@token = nil
    @@mode = "test"

    ROOT_URL_BASE = "https://api.amplifypay.com"

    LIVE_CHECKOUT_INVOICE_BASE_URL = "#{ROOT_URL_BASE}/merchant/transact"
    TEST_CHECKOUT_INVOICE_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/checkout-invoice/create"

    LIVE_CHECKOUT_CONFIRM_BASE_URL = "#{ROOT_URL_BASE}/merchant/verify"
    TEST_CHECKOUT_CONFIRM_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/checkout-invoice/confirm/"

    LIVE_OPR_BASE_URL = "#{ROOT_URL_BASE}/api/v1/opr/create"
    TEST_OPR_BASE_URL = "#{ROOT_URL_BASE}/sandbox-api/v1/opr/create"


    def self.merchant_id=(merchant_id); @@merchant_id = merchant_id; end
    def self.merchant_id; @@merchant_id; end
    def self.private_key=(private_key); @@private_key = private_key; end
    def self.private_key; @@private_key; end


    def self.mode=(mode); @@mode = mode; end
    def self.mode; @@mode; end

    def self.checkout_base_url
        LIVE_CHECKOUT_INVOICE_BASE_URL
    end

    def self.checkout_confirm_base_url
        LIVE_CHECKOUT_CONFIRM_BASE_URL
    end

  end
end