class Stock_Picker
	def stock_picker(prices)
  
  min_price = prices[0]
  min_day = 0
  profit = 0
  buy_days = [0, 0]

  prices.each_with_index do |price, day|
    
    if price < min_price
      min_price = price
      min_day = day
    end

    # Calculate expected profit
    expected_profit = price - min_price

    # To check new profit
    if expected_profit > profit
      profit = expected_profit
      buy_days = [min_day, day]
    end
  end

  buy_days
	end
end
ob=Stock_Picker.new

prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
buy_days = ob.stock_picker(prices)
puts "Best days to buy and sell: #{buy_days}"
