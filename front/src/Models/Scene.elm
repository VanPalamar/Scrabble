module Models.Scene exposing (..)
import Models.Player exposing (Player)

type alias Scene =
  { player1 : Player
  , player2 : Player
  , currentPlayer: Player }

initialScene : Scene
initialScene =
  { }
