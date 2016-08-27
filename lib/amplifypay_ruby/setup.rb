module AmplifypayRuby
  module Setup
    @@merchant_id = nil
    @@private_key = nil
    @@redirect_url = nil
    @@mode = "test"

    ROOT_URL_BASE = "https://api.amplifypay.com"

    LIVE_CHECKOUT_INVOICE_BASE_URL = "#{ROOT_URL_BASE}/merchant/transact"

    LIVE_CHECKOUT_CONFIRM_BASE_URL = "#{ROOT_URL_BASE}/merchant/verify"


    def self.merchant_id=(merchant_id); @@merchant_id = merchant_id; end
    def self.merchant_id; @@merchant_id; end
    def self.private_key=(private_key); @@private_key = private_key; end
    def self.private_key; @@private_key; end
    def self.redirect_url=(redirect_url); @@redirect_url = redirect_url; end
    def self.redirect_url; @@redirect_url; end


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