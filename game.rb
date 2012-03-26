require_relative "frame_factory"

class Game
  def initialize
    @rolls = []
  end

  def add_roll(pins)
    @rolls.push(pins)
  end

  def score
    score = 0
    i = 0
    while i < @rolls.length do
      frame = FrameFactory.create(@rolls, i)
      score += frame.score
      i+=frame.rolls_count
      break if in_bonus?(i, frame)
    end
    score
  end
  
  private
  def in_bonus?(index, frame)
     index == @rolls.length - frame.bonus_rolls_count
  end
end