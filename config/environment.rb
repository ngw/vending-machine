require 'forwardable'
require 'pry'
require 'yaml'

require 'bundler/setup'
Bundler.require(:default)

Money.default_currency = Money::Currency.new('GBP')
Money.locale_backend = nil
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

ROOT = File.expand_path('..', __dir__)
require File.join(ROOT, 'lib', 'vending_machine')
