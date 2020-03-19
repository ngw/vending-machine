# frozen_string_literal: true

describe VendingMachine::Change do
  subject(:change) { described_class.new(config['change']) }

  let(:config) do
    YAML.load_file(File.join(ROOT, 'spec/fixtures', 'products.yml'))
  end

  it { expect(change.coins).to eq(config['change']) }
end
