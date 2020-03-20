# frozen_string_literal: true

module VendingMachine
  class Product
    attr_reader :name, :price, :quantity

    def initialize(name:, price:, quantity:)
      @name = name
      @price = Money.new(price * 100)
      @quantity = quantity
    end

    def enough?(amount)
      purchase = amount - @price
      purchase.positive? || purchase.zero?
    end

    def buy!
      @quantity = @quantity.pred
    end
  end
end
