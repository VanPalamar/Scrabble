module Messages.Msg exposing (..)

import Http

type Msg
    = SetName String
    | SubmitName
    | Login (Result Http.Error String)
    | SelectLetter String
    | UpdateMouse Int Int
    | HandleRowClick Int Int
