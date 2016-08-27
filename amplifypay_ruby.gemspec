# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amplifypay_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "amplifypay_ruby"
  spec.version       = AmplifypayRuby::VERSION
  spec.authors       = ["Innocent"]
  spec.email         = ["innocentudeh@gmail.com"]

  spec.summary       = %q{Ruby library for integrating with AmplifyPay}
  spec.description   = %q{Ruby client bindings for the AmplifyPay API}
  spec.homepage      = "https://amplifypay.com/developers"
  spec.license       = "MIT"
  spec.post_install_message = "Thanks for installing MPower Payments Ruby client.\nYou may read full API docs at https://amplifypay.com/developers"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency('multi_json', '~> 1.10', '>= 1.10.1')
  spec.add_dependency('http', '~> 2.0', '>= 2.0.3')
  spec

end
