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

def connect_rolls_to_players(players, rolls)
  player_rolls = []
  last_player = players.count - 1
  i = 0
  rolls.each do |roll|
    player_rolls << { players[i] => roll }
    i += 1
    i = 0 if i > last_player
  end
  player_rolls
end
