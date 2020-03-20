# frozen_string_literal: true

module VendingMachine
  class CLI
    DEFAULT_INIT = File.join(ROOT, 'config', 'moloko_plus.yml')

    def initialize(init_path: DEFAULT_INIT)
      @engine = Engine.new(init_path: init_path)
    end

    def call
      menu
      binding.pry
    end

    def menu
      puts <<~MENU
        #{@engine}

        COMMANDS: restart CONFIGURATION_YAML_PATH
                  buy ITEM_CODE, "MONEY"
                  exit
      MENU
    end

    def restart!(configuration_path:)
      @engine = Engine.new(init_path: configuration_path)
    end
    alias restart restart!

    def buy(code:, amount:)
      @engine.buy(code, amount)
    end
  end
end
