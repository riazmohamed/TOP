# stock_picker.rb

def stock_picker(stock_dates)
  counter = 1
  buying = stock_dates[0]
  selling = stock_dates[1]
  arr = []
  loop do
    break if counter >= stock_dates.length - 1
    value_day1 = stock_dates[counter]
    counter += 1
    value_day2 = stock_dates[counter]
    index_buying = stock_dates.index(buying)
    index_selling = stock_dates.index(selling)
    index_day1 = stock_dates.index(value_day1)
    if value_day1 < buying && index_day1 > index_selling
      value_day1 = buying
    end
    index_day2 = stock_dates.index(value_day2)

    if value_day1 < value_day2 && value_day2 > selling
      selling = value_day2
      arr[1] = selling
    end

    if value_day1 < value_day2 && value_day1 < buying
      buying = value_day1
      arr[0] = buying
    end
  end

  p arr.map { |e| stock_dates.index(e)  }
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
