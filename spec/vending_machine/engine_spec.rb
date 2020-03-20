# frozen_string_literal: true

describe VendingMachine::Engine do
  subject(:engine) do
    described_class.new(init_path:
                        File.join(ROOT, 'spec/fixtures', 'products.yml'))
  end

  context 'when importing' do
    it 'displays the menu' do
      expect(engine.to_s).to eq(
        "1: product_1 - £10.00\n2: product_2 - £12.25"
      )
    end
  end

  context 'when buying' do
    it 'finalizes purchase when enough money' do
      expect { engine.buy(1, '£11') }.to output(
        "product_1 bought\nPLONK 50 £0.02 coins\n"
      ).to_stdout
    end

    it 'complains when not enough money' do
      expect { engine.buy(1, '£9') }.to output(
        "Can't buy: you must add £1.00\n"
      ).to_stdout
    end
  end
end
