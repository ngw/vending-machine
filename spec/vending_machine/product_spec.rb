# frozen_string_literal: true

describe VendingMachine::Product do
  subject(:product) do
    described_class.new(name: 'test', price: 10, quantity: 3)
  end

  it { expect(product.name).to eq('test') }
  it { expect(product.price).to be_an Money }
  it { expect(product.price.format).to eq('£10.00') }
  it { expect(product.quantity).to eq(3) }

  context 'when checking purchase' do
    let(:more_amount) { Money.new(1_100) }
    let(:same_amount) { Money.new(1_000) }
    let(:less_amount) { Money.new(900) }

    it { expect(product).to be_enough(more_amount) }
    it { expect(product).to be_enough(same_amount) }
    it { expect(product).not_to be_enough(less_amount) }
  end
end
