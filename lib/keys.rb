module Keys
  def key_finder
    rand(99999).to_s.rjust(5,'0')
  end

  def a_key
    key_finder.slice(0..1).to_s
  end

  def b_key
    key_finder.slice(1..2).to_s
  end

  def c_key
    key_finder.slice(2..3).to_s
  end

  def d_key
    key_finder.slice(3..4).to_s
  end
end
