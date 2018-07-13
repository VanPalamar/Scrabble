module Main exposing (..)

import Html exposing (Html)
import List exposing (filter)
import Models.Model exposing (Model, initialModel)
import Mouse
import Views.View exposing (view)
import Messages.Msg exposing (..)
import Models.Player exposing (login)
import String exposing(isEmpty)

init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetName name ->
            ({ model | typingName = name }, Cmd.none)
        SelectLetter letter ->
            ({ model | selectedLetter = letter }, Cmd.none)
        SubmitName ->
            let
                oldPlayer = model.currentPlayer
                newCurrentPlayer =
                    { oldPlayer | name = model.typingName }
            in
                if isEmpty model.typingName
                then
                (model, Cmd.none)
                else
                ({ model | currentPlayer = newCurrentPlayer }, login)
        Login (Ok userId) ->
          (model, Cmd.none)
        Login (Err errMsg) ->
          ({ model | error = toString errMsg }, Cmd.none)
        UpdateMouse x y ->
            let
                oldMouse = model.mouse
                newMouse = { x = x, y = y }
            in
                ({ model | mouse = newMouse }, Cmd.none)
        HandleRowClick x y ->
            let
                oldPlayer = model.currentPlayer
                oldLetters = oldPlayer.placedLetters
                newLettersAvailable = filter (\x -> x /= model.selectedLetter) model.currentPlayer.lettersAvailable
                newPlayer = { oldPlayer | placedLetters = oldLetters ++ [{ x = x, y = y, value = model.selectedLetter }] }
                updatedPlayer = { newPlayer | lettersAvailable = newLettersAvailable }
                newModel = { model | selectedLetter = "" }
            in
                if isEmpty model.selectedLetter
                then
                (newModel, Cmd.none)
                else
                ({ newModel | currentPlayer = updatedPlayer }, Cmd.none)




-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Mouse.moves (\{x, y} -> UpdateMouse x y)


-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
