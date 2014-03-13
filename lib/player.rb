class Player
  attr_reader :spaces, :id

  def initialize(id)
    @id = id
    @spaces = []
  end

  def add_space(value)
    @spaces << value
  end
  def clear_spaces
    @spaces = []
  end
end
