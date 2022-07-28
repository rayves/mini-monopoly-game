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

def game(board, player_names, rolls, go_income)
  # Generate player objects using the player names in the PLAYE_NAMES array
  players = generate_players(player_names)

  # Generate the board using the imported data
  spaces = generate_spaces(board)

  # Create relationship between the player objects and the rolls based on the predetermined player roll order.
  player_rolls = connect_rolls_to_players(players, rolls)

  index = 0
  # endgame = trigger to stop while loop
  endgame = player_rolls.count
  while index < endgame
    roll = player_rolls[index]
    roll.each do |player, num|
      new_position = player.new_position(num, spaces)

      player.wallet += go_income if new_position < player.current_position

      player.current_position = new_position

      current_space = spaces[player.current_position]
      next if current_space.type == 'go' || player == current_space.owner

      if current_space.owner == 'Unowned'
        player.buy_property(current_space)
      else
        player.pay_rent(current_space)
      end
    end

    index += 1
  end

  { players: players, spaces: spaces }
end
