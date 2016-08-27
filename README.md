
# AmplifyPay Ruby Client API
========================
AMplifyPay Payments Ruby Client Library

## Offical Documentation
http://https://amplifypay.com/developers

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

    AMplifyPay::Setup.merchant_id = "YOUR_MERCHANT_ID" 
    AMplifyPay::Setup.private_key = "YOUR_API_PRIVATE_KEY"

## Create your Checkout Invoice

    co = AMplifyPay::Checkout::Invoice.new

## Set the total amount to be charged ! Important

    co.total_amount = 1200.99


## Redirecting to your checkout invoice page

    if co.create
        redirect_to co.invoice_url
    else
        @message = co.response_text
    end





## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
















