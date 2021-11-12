module Keys
  def key_finder
    rand(99999).to_s.rjust(5,'0')
  end

  def a_key(key = key_finder)
    key.slice(0..1).to_i
  end

  def b_key(key = key_finder)
    key.slice(1..2).to_i
  end

  def c_key(key = key_finder)
    key.slice(2..3).to_i
  end

  def d_key(key = key_finder)
    key.slice(3..4).to_i
  end

  def key_hash(key = key_finder)
    {
      'A' => a_key(key),
      'B' => b_key(key),
      'C' => c_key(key),
      'D' => d_key(key)
    }
  end
end
