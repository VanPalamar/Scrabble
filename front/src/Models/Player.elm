module Models.Player exposing (..)

import Http
import Messages.Msg exposing (Msg(Login))

type alias Letter =
    { x : Int
    , y : Int
    , value: String
    }

type alias Player =
    { name : String
    , score : Int
    , lettersAvailable: List String
    , placedLetters: List Letter
    }

login : Cmd Msg
login =
  Http.send Login <|
    Http.getString "http://localhost:3000/login/"
