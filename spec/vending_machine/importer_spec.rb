# frozen_string_literal: true

describe VendingMachine::Importer do
  subject(:importer) { described_class.new(config_path) }

  let(:config_path) { File.join(ROOT, 'spec/fixtures', 'products.yml') }

  context 'when importing products' do
    let(:products) { importer.call[0] }

    it 'returns the right number of products' do
      expect(products.count).to eq(2)
    end

    it 'returns products' do
      expect(products.values.first).to be_a(VendingMachine::Product)
    end
  end

  context 'when importing change' do
    let(:change) { importer.call[1] }

    it 'returns the right amount of coins' do
      expect(change.coins.count).to eq(2)
    end

    it 'returns change' do
      expect(change).to be_a(VendingMachine::Change)
    end
  end
end
