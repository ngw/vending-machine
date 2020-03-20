# frozen_string_literal: true

module VendingMachine
  class Engine
    def initialize(init_path:)
      @init_path = init_path
      import!
    end

    def to_s
      @products.collect do |index, product|
        if product.quantity.positive?
          "#{index}: #{product.name} - #{product.price.format}"
        end
      end.join("\n")
    end

    def buy(code, amount)
      product = @products[code]
      return unless product.quantity.positive?

      money = Monetize.parse(amount)
      change = money - product.price
      if product.enough?(money) && @change.enough?(change)
        finalize_purchase!(product, change)
      else
        puts "Can't buy: you must add #{change.abs.format}"
      end
    end

    private

    def import!
      @products, @change = Importer.new(@init_path).call
    end

    def finalize_purchase!(product, change)
      puts "#{product.name} bought" if product.buy!
      @change.to_pocket(change).each do |coin|
        puts "PLONK #{coin[1]} #{coin[0].format} coins"
      end
    end
  end
end
