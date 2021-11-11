module Keys
  def key_finder
    rand(99999).to_s.rjust(5,'0')
  end

  def a_key
    key_finder.slice(0..1).to_i
  end

  def b_key
    key_finder.slice(1..2).to_i
  end

  def c_key
    key_finder.slice(2..3).to_i
  end

  def d_key
    key_finder.slice(3..4).to_i
  end

  def keys
    {
      'A' => a_key,
      'B' => b_key,
      'C' => c_key,
      'D' => d_key
    }
  end
end
