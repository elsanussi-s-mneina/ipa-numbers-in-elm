module Main exposing (main)

import Html exposing (Html, div, input, span, text)
import Html.Attributes exposing (class, placeholder, value)


inputTextArea : Html msg
inputTextArea = 
           input [ placeholder "IPA Numbers", value "Put content here"] []

main : Html a
main = div []
       [
           inputTextArea
           , span [class "welcome-message"] [text "Programmed by Elsanussi Mneina, 2021"]
       ]
