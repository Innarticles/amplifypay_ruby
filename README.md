
# AmplifyPay Ruby Client API
========================
AMplifyPay Payments Ruby Client Library

## Offical Documentation
http://amplifypay.com/developers

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'amplifypay_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install amplifypay_ruby

## Usage

## Setup your API Keys
If you are using rails you may create an file under `RAILS_ROOT/config/initializers` and put these setting there.

    AmplifypayRuby::Setup.merchant_id = "YOUR_MERCHANT_ID" 
    AmplifypayRuby::Setup.private_key = "YOUR_API_PRIVATE_KEY"
    AmplifypayRuby::Setup.redirect_url = "http://example.com/order"


## Create your Checkout Invoice

    co = AmplifypayRuby::Checkout::Invoice.new

## Set transaction details ! Important

    co.total_amount = 1200.99
    co.customer = {"email" => "john.doe@mail.com", "name" => "John Doe"}
    co.trans_id = 23437888888


## Redirecting to your checkout invoice page

    if co.create
        redirect_to co.invoice_url
    else
        @message = co.response_text
    end

## Verifying transactions
    
    if co.confirm(transactionRef)
      //your logic e.g
      @message  =  co.response_text
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
















