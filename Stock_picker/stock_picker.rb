# Each.with index
def stock_picker(prices)
  buy = 0
  sell = 0
  profit = 0
  prices.each_with_index do |buy_price, buy_day|
    prices.each_with_index do |sell_price, sell_day|
      if sell_day > buy_day
        if sell_price - buy_price > profit
          profit = sell_price - buy_price
          buy = buy_day
          sell = sell_day
        end 
      end 
    end 
  end
  puts "buy on daay #{buy} and sell on day #{sell}"
end