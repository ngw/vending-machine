# frozen_string_literal: true

Dir[File.join(__dir__, '**/*.rb')].sort.each { |f| require f }

module VendingMachine
  VERSION = '0.1'
end
