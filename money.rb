class Money
  def initialize
    @currency = [1, 5, 10, 50, 100, 500, 1000, 2000, 5000, 10000]
  end

  def vending_machine
    @currency = [10, 50, 100, 500, 1000].freeze
  end
end
