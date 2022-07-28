require 'json'

require_relative 'lib/player'
require_relative 'lib/space'
require_relative 'lib/helper_methods'

# Import external data and convert them into usable data for the game
BOARD = read_json('data/board.json')
ROLLS_ONE = read_json('data/rolls_1.json')
ROLLS_TWO = read_json('data/rolls_2.json')

# Order the names within the PLAYER_NAMES array determines the order of rolls for the players.
PLAYER_NAMES = %w[Peter Billy Charlotte Sweedal].freeze

GO_INCOME = 1

GAME_ONE = game(BOARD, PLAYER_NAMES, ROLLS_ONE, GO_INCOME)
GAME_TWO = game(BOARD, PLAYER_NAMES, ROLLS_TWO, GO_INCOME)

pp GAME_ONE
