# frozen_string_literal: true

module VendingMachine
  class Change
    attr_accessor :coins

    def initialize(initial_change)
      @coins = initial_change.collect do |coin, quantity|
        { coin => [Monetize.parse(coin), quantity] }
      end.reduce({}, :merge)
    end

    def total
      @coins.values.inject(Money.new(0)) do |sum, change|
        sum + (change[0] * change[1])
      end
    end

    def enough?(amount)
      total >= amount
    end

    def to_pocket(amount)
      pocket = []
      @coins.reduce(amount) do |memo, coin|
        how_many = (memo / coin[1][0]).to_i
        next(memo) unless how_many.positive?

        memo, pocket = get_coins!(how_many, coin, memo, pocket)
        memo
      end
      pocket
    end

    private

    def get_coins!(how_many, coin, memo, pocket)
      if how_many <= coin[1][1]
        memo -= coin[1][0] * how_many
        pocket << [coin[1][0], how_many]
        @coins[coin[0]][1] -= how_many
      else
        memo -= coin[1][0] * coin[1][1]
        pocket << [coin[1][0], coin[1][1]]
        @coins[coin[0]][1] = 0
      end
      [memo, pocket]
    end
  end
end
