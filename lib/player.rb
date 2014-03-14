class Player
  attr_reader :every_space, :id, :name, :letter

  def initialize(id, board_dimension)
    @id = id
    @every_space = []
    1.upto(board_dimension**2) do |i|
      @every_space << []
    end
  end

  def add_space(board_number, value)
    @every_space[board_number - 1] << value
  end

  def clear_spaces
    @every_space.each do |array|
      array = []
    end
  end

  def set_name(name)
    @name = name
  end

  def set_letter(letter)
    @letter = letter
  end

  def boards(board_number)
    @every_space[board_number - 1]
  end
end
