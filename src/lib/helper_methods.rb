def read_json(file_path)
  JSON.parse(File.read(file_path))
end

def generate_players(player_names)
  player_names.map { |name| Player.new(name) }
end

def generate_spaces(board)
  board.map do |space|
    if space['type'] != 'property'
      Space.new(space['name'], space['price'], space['colour'], space['type'], 'Cannot be purchased')
    else
      Space.new(space['name'], space['price'], space['colour'], space['type'], 'Unowned')
    end
  end
end