class StrikeFrameType
  def rolls_count
    1
  end
  
  def bonus_rolls_count
    2
  end
end

class SpareFrameType
  def rolls_count
    2
  end
  
  def bonus_rolls_count
    1
  end
end

class NormalFrameType
  def rolls_count
    2
  end
  
  def bonus_rolls_count
    0
  end
end