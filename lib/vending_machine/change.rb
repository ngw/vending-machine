# frozen_string_literal: true

module VendingMachine
  class Change
    attr_accessor :coins

    def initialize(initial_change)
      @coins = initial_change
    end
  end
end
