require 'json'

# Import external data and convert them into usable data for the game
BOARD = JSON.parse(File.read('data/board.json'))
ROLLS_ONE = JSON.parse(File.read('data/rolls_1.json'))
ROLLS_TWO = JSON.parse(File.read('data/rolls_2.json'))

# Order the names within the PLAYER_NAMES array determines the order of rolls for the players.
PLAYER_NAMES = %w[Peter Billy Charlotte Sweedal].freeze
