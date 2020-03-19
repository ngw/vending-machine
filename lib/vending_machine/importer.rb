# frozen_string_literal: true

module VendingMachine
  class Importer
    def initialize(init_file)
      @config = YAML.load_file(init_file)
    end

    def call
      [products, change]
    end

    private

    def products
      @config['products'].collect do |name, data|
        Product.new(name: name,
                    price: data['price'],
                    quantity: data['quantity'])
      end
    end

    def change
      Change.new(@config['change'])
    end
  end
end
