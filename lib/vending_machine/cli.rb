# frozen_string_literal: true

module VendingMachine
  class CLI
    DEFAULT_INIT = File.join(ROOT, 'config', 'moloko_plus.yml')

    def initialize(init_path: DEFAULT_INIT)
      @engine = Engine.new(init_path: init_path)
    end

    def call
      puts <<~HELP
        COMMANDS: restart CONFIGURATION_YAML_PATH
      HELP
      binding.pry
    end

    def restart!(configuration_path:)
      @engine = Engine.new(init_path: configuration_path)
    end
    alias restart restart!
  end
end
