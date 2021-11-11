
module Offset
  def date_formatter
    Date.today.strftime('%d''%m''%y')
  end

  def offset_finder(date = date_formatter)
    date_squared = (date).to_i ** 2
    date_squared.to_s.slice(-4..-1)
  end

  def a_offset(date = date_formatter)
    offset_finder(date).slice(0).to_i
  end

  def b_offset(date = date_formatter)
    offset_finder(date).slice(1).to_i
  end

  def c_offset(date = date_formatter)
    offset_finder(date).slice(2).to_i
  end

  def d_offset(date = date_formatter)
    offset_finder(date).slice(3).to_i
  end

  def offset(date = date_formatter)
    {
      'A' => a_offset(date),
      'B' => b_offset(date),
      'C' => c_offset(date),
      'D' => d_offset(date)
    }
  end
end
