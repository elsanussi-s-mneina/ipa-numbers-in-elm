module Main exposing (main)

import Browser
import Html exposing (Html, Attribute, div, h1, input, label, span, text)
import Html.Attributes exposing (class, for, id, placeholder, value)
import Html.Events exposing (onInput)

inputTextArea : Model -> Html Msg
inputTextArea model = 
        let inputId = "ipaNumbersInput"
        in
        div []
        [
          label [for inputId] [text "IPA Numbers"]
        , input [id inputId,  placeholder "IPA Numbers", value model.ipaNumbersContent, onInput ChangeInIPANumbers] [] ]
        

outputTextArea : Model -> Html Msg
outputTextArea model =
  let inputId = "ipaCharacterInput"
  in
  div []
  [
    label [for inputId] [text "IPA Characters"]
  , input [ placeholder "IPA Characters", value model.ipaCharactersContent, onInput ChangeInIPAChars] []
  ]
-- MAIN

main = Browser.sandbox { init = init, update = update, view = view }

-- Model

type alias Model =
  { ipaNumbersContent : String
  , ipaCharactersContent : String
  }

init : Model
init =
  { ipaNumbersContent = "", ipaCharactersContent = "" }

-- UPDATE
type Msg
  = ChangeInIPAChars String | ChangeInIPANumbers String

ipaNumbersToCharacters : String -> String
ipaNumbersToCharacters x = x -- To be implemented.

ipaCharactersToNumbers : String -> String
ipaCharactersToNumbers x = x -- To be implemented.

update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeInIPAChars newContent ->
            {model | 
                    ipaCharactersContent = newContent  -- Allows normal input to text field. 
                    , ipaNumbersContent = ipaCharactersToNumbers newContent }
    ChangeInIPANumbers newContent ->
            {model | ipaNumbersContent = newContent -- Allow normal input 
                   , ipaCharactersContent = ipaNumbersToCharacters newContent }

view : Model -> Html Msg
view model =  div []
       [   h1 [] [text "IPA Number to IPA Character Convertor"]
           , inputTextArea model
           , outputTextArea model
           , span [class "welcome-message"] [text "Programmed by Elsanussi Mneina, 2021"]
       ]
