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
      product_list = @config['products'].collect do |name, data|
        Product.new(name: name,
                    price: data['price'],
                    quantity: data['quantity'])
      end
      Hash[(1..product_list.size).zip product_list]
    end

    def change
      Change.new(@config['change'])
    end
  end
end
