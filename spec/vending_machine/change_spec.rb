# frozen_string_literal: true

describe VendingMachine::Change do
  subject(:change) { described_class.new(config['change']) }

  let(:config) do
    YAML.load_file(File.join(ROOT, 'spec/fixtures', 'products.yml'))
  end
  let(:two_pounds_fifty) { Monetize.parse('£2.06') }
  let(:two_pounds) { '£2' }
  let(:two_pence) { '0.02p' }

  it { expect(change.coins.keys).to eq(config['change'].keys) }
  it { expect(change.coins[two_pounds]).to eq([Monetize.parse(two_pounds), 6]) }
  it { expect(change.coins[two_pence]).to eq([Monetize.parse(two_pence), 70]) }
  it { expect(change.total).to eq(Money.new(1_340)) }

  context 'when checking change' do
    let(:more_change) { Money.new(1_500) }
    let(:same_amount) { Money.new(1_340) }
    let(:less_amount) { Money.new(1_000) }

    it { expect(change).not_to be_enough(more_change) }
    it { expect(change).to be_enough(same_amount) }
    it { expect(change).to be_enough(less_amount) }
  end

  context 'when returning change' do
    it 'returns the right amount' do
      expect(change.to_pocket(two_pounds_fifty)).to eq(
        [
          [Monetize.parse(two_pounds), 1],
          [Monetize.parse(two_pence), 3]
        ]
      )
    end
  end
end
