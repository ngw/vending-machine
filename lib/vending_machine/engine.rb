# frozen_string_literal: true

module VendingMachine
  class Engine
    def initialize(init_path:)
      @init_path = init_path
      import!
    end

    private

    def import!
      @products, @change = Importer.new(@init_path).call
    end
  end
end
