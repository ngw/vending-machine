# frozen_string_literal: true

describe VendingMachine::Product do
  subject(:product) do
    described_class.new(name: 'test', price: 10, quantity: 3)
  end

  it { expect(product.name).to eq('test') }
  it { expect(product.price).to be_an ::Money }
  it { expect(product.price.format).to eq('£10.00') }
  it { expect(product.quantity).to eq(3) }
end
