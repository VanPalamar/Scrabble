module Views.View exposing (..)

import Array exposing (toList)
import Html exposing (..)
import Html.Attributes exposing (class, colspan, id, style)
import Html.Events exposing (onClick, onInput)
import Models.Model exposing (Model)
import Messages.Msg exposing (..)
import String exposing (concat, isEmpty)

getCellValue : Model -> Int -> Int -> String
getCellValue model x y =
    let
      foundModel = List.head (List.filter (\m -> m.x == x && m.y == y) model.currentPlayer.placedLetters)
    in
      case foundModel of
        Just trueModel -> trueModel.value
        Nothing -> ""

cellHead : Model -> Int -> Int -> Html Msg
cellHead model x y = td [ colspan 2,
                            class ("table-row " ++ if isEmpty (getCellValue model x y) == False then "table-row-full" else ""),
                            id (concat [toString x, "-", toString y]), onClick (HandleRowClick x y) ]
                        [ text (getCellValue model x y)]

letterView : String -> Html Msg
letterView letter =
    div [ class "letter", onClick (SelectLetter letter) ] [text letter]


letterStyle : Model -> Attribute msg
letterStyle model = style
                  [ ("position", "absolute")
                  , ("left", toString (model.mouse.x) )
                  , ("top", toString (model.mouse.y))
                  ]


selectedLetterView : Model -> Html Msg
selectedLetterView model =
    div [ letterStyle model, class "letter letter-selected" ] [text model.selectedLetter]


renderView : Model -> Html Msg
renderView model =
    div [] [
        Html.table [ class "table-container" ]
                    [
                    caption [] []
                    , tbody [] (Array.initialize 10 (\y -> tr [] (Array.initialize 10 (\x -> (cellHead model x y)) |> toList)) |> toList)
                    ],
        div [ class "letter-container" ] (List.map letterView model.currentPlayer.lettersAvailable)
    ]


view : Model -> Html Msg
view model =
    div []
    [
        div [ class "login-container" ]
            [
                input [ onInput SetName, class "form-control" ] [text "Username"],
                button [ onClick SubmitName, class "btn btn-success" ] [text "Login"],
                table []
                [
                    tbody []
                    [
                       tr [] [text " "]
                    ]
                ]
            ],
        div []
            [
                div [ class "error" ] [ text model.error ]
            ],
        if isEmpty model.currentPlayer.name == False
        then
            renderView model
        else
            h2 [ class "error" ] [ text "Please login" ]
        ,
        if isEmpty model.selectedLetter == False
        then
            selectedLetterView model
        else
            div [] []
    ]
