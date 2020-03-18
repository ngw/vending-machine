require 'yaml'

require 'bundler/setup'
Bundler.require(:default)

root = File.expand_path('..', __dir__)
require File.join(root, 'lib', 'vending_machine')
