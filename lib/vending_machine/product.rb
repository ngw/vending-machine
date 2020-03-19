# frozen_string_literal: true

module VendingMachine
  class Product
    attr_reader :name, :price
    attr_accessor :quantity

    def initialize(name:, price:, quantity:)
      @name = name
      @price = ::Money.new(price * 100)
      @quantity = quantity
    end
  end
end
