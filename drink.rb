class Drink
  def initialize
    @kind = {:cola => {:price => 120, :stock => 5}}
  end

  # 在庫情報
  def what_kind
    @kind.each do |name, info|
      puts "商品名：#{name} 価格：#{info[:price]} 円 在庫：#{info[:stock]} 個"
    end
  end

  # 在庫補充
  def add_stock(name, price, stock)
    @kind[:"#{name}"] = {price:price, stock:stock}
  end

  # 販売リスト
  def buyable
    @buyable_items = @kind.select do |name|
      @kind[:"#{name}"][:stock] >= 1
    end
    puts "販売可能な商品"
      @buyable_items.each do |name, info|
        puts "#{name} 価格：#{info[:price]} 円 在庫：#{info[:stock]} 個"
      end
  end
end
