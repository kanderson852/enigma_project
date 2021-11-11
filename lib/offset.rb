
module Offset
  def offset_finder(date = Date.today)
    date_formatter = date.strftime('%d''%m''%y')
    date_squared = (date_formatter).to_i ** 2
    date_squared.to_s.slice(-4..-1)
  end

  def a_offset(date = Date.today)
    offset_finder(date).slice(0).to_i
  end

  def b_offset(date = Date.today)
    offset_finder(date).slice(1).to_i
  end

  def c_offset(date = Date.today)
    offset_finder(date).slice(2).to_i
  end

  def d_offset(date = Date.today)
    offset_finder(date).slice(3).to_i
  end

  def offset(date = Date.today)
    {
      'A' => a_offset(date),
      'B' => b_offset(date),
      'C' => c_offset(date),
      'D' => d_offset(date)
    }
  end
end
