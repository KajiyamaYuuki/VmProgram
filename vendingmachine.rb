class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    @slot_money = 0
    @sales = 0
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    puts "現在の投入金額：#{@slot_money}円"
  end

  # 投入は複数回できる。
  def slot_money(money)
    return "#{money}はこの自販機では使えません" unless MONEY.include?(money)
    @slot_money += money
    current_slot_money
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    puts "払い出し：#{@slot_money}円"
    @slot_money = 0
  end

  # 購入処理
  def buy_item(list)
    return "先にお金を投入してください" unless @slot_money > 0
    list
    puts current_slot_money
    puts "購入する商品を選んでください"

    buy_item = gets.chomp

    if list.has_key?(:"#{buy_item}") == true
      kakaku = list[:"#{buy_item}"][:price]
      if kakaku <= @slot_money
        puts "#{buy_item}を購入しました"
        @slot_money -= kakaku
        list[:"#{buy_item}"][:stock] -= 1
        @sales += kakaku
      else
        puts "投入金額が不足しています"
      end
    else
      puts "その商品は販売しておりません"
    end
  end

  # 現在の売上金額の取得
  def sales
    "売上金：#{@sales}円"
  end
end
