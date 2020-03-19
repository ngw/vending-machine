# frozen_string_literal: true

describe VendingMachine::CLI do
  context 'when initializing' do
    let(:init_path) { File.join(ROOT, 'spec/fixtures', 'products.yml') }

    before do
      stub_const('VendingMachine::CLI::DEFAULT_INIT', init_path)
      allow(VendingMachine::Engine).to receive(:new)
      described_class.new
    end

    it 'the Engine has a default' do
      expect(VendingMachine::Engine).to have_received(
        :new
      ).with(init_path: init_path)
    end
  end

  context 'when restarting' do
    let(:restart_init_path) { File.join(ROOT, 'spec/fixtures', 'products.yml') }

    before do
      allow(VendingMachine::Engine).to receive(:new)
      app = described_class.new
      app.restart!(configuration_path: restart_init_path)
    end

    it 'instantiates a new Engine' do
      expect(VendingMachine::Engine).to have_received(
        :new
      ).with(init_path: restart_init_path)
    end
  end
end
