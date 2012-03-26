require_relative "frame_type"

class Frame
  def initialize(rolls, first_roll_of_frame_index)
    @rolls = rolls
    @first_roll_of_frame_index = first_roll_of_frame_index
  end
  
  def rolls_count
    return frame_type.rolls_count
  end
  
  def bonus_rolls_count
    return frame_type.bonus_rolls_count
  end
  
  def score
    base_score + bonus
  end
end

class StrikeFrame < Frame 
  private
  def frame_type
    StrikeFrameType.new
  end
  
  def base_score
    @rolls[@first_roll_of_frame_index]
  end
  
  def bonus
    @rolls[@first_roll_of_frame_index +1 ] + @rolls[@first_roll_of_frame_index + 2]
  end
end

class SpareFrame < Frame  
  private
  def frame_type
    SpareFrameType.new
  end
  
  def base_score
    @rolls[@first_roll_of_frame_index] + @rolls[@first_roll_of_frame_index + 1]
  end
  
  def bonus
    @rolls[@first_roll_of_frame_index + 2]
  end
end

class NormalFrame < Frame
  private
  def frame_type
    NormalFrameType.new
  end
  
  def base_score
    @rolls[@first_roll_of_frame_index] + @rolls[@first_roll_of_frame_index + 1]
  end
  
  def bonus
    0
  end
end