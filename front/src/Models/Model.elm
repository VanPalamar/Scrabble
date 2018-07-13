module Models.Model exposing (..)

import Models.Mouse exposing (Mouse)
import Models.Player exposing (Player)

type alias Model =
  {
  mouse : Mouse
  , selectedLetter : String
  , typingName : String
  , players : List Player
  , error: String
  , currentPlayer: Player }

initialModel : Model
initialModel =
  {
    mouse = {
      x = 0,
      y = 0
    },
    selectedLetter = "",
    typingName = "",
    players = [],
    error = "",
    currentPlayer = {   name = ""
                        , score = 0
                        , lettersAvailable = ["a", "b", "z", "f", "l", "e", "r", "o", "p", "k", "m", "n"]
                        , placedLetters = [] }
  }
