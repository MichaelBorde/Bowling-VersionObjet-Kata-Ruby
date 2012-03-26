require_relative "frame"

class FrameFactory
  def FrameFactory.create(rolls, first_roll_of_frame_index)
    return StrikeFrame.new(rolls, first_roll_of_frame_index) if strike?(rolls, first_roll_of_frame_index)
    return SpareFrame.new(rolls, first_roll_of_frame_index) if spare?(rolls, first_roll_of_frame_index)
    return NormalFrame.new(rolls, first_roll_of_frame_index)
  end
  
  private
  def FrameFactory.strike?(rolls, first_roll_of_frame_index)
    rolls[first_roll_of_frame_index] == 10
  end
      
  def FrameFactory.spare?(rolls, first_roll_of_frame_index)
    rolls[first_roll_of_frame_index] + rolls[first_roll_of_frame_index + 1] == 10
  end
end