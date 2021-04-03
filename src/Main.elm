module Main exposing (main)

import Browser
import Html exposing (Html, Attribute, div, input, span, text)
import Html.Attributes exposing (class, placeholder, value)
import Html.Events exposing (onInput)

inputTextArea : Model -> Html Msg
inputTextArea model = 
           input [ placeholder "IPA Numbers", value model.ipaNumbersContent, onInput ChangeInIPANumbers] []

outputTextArea : Model -> Html Msg
outputTextArea model =
           input [ placeholder "IPA Characters", value model.ipaCharactersContent, onInput ChangeInIPAChars] []

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
       [
           inputTextArea model
           , outputTextArea model
           , span [class "welcome-message"] [text "Programmed by Elsanussi Mneina, 2021"]
       ]
