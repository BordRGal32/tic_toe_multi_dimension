class Space
  attr_reader :position, :player
  @@all_space = []
  def Space.create(attributes)
    new_space = Space.new(attributes)
    new_space.save
    new_space
  end

  def Space.all
    @@all_space
  end

  def Space.clear
    @@all_space = []
  end

  def initialize(attributes)
    @position = attributes[:value]
    @player = attributes[:player]
  end

  def save
    @@all_space << self
  end
end

