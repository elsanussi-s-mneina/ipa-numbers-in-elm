module Main exposing (main)

import Browser
import Html exposing (Html, Attribute, div, h1, input, label, span, text)
import Html.Attributes exposing (class, for, id, placeholder, value)
import Html.Events exposing (onInput)
import IPAConstants.IPANumbers
import IPAConstants.IPAUnicodeConstants
import IPANumberToUnicode
import UnicodeToIPANumber

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
ipaNumbersToCharacters numbers = numbers -- To be implemented.

ipaCharactersToNumbers : String -> String
ipaCharactersToNumbers characters =
        characters 
        |> String.toList 
        |> ipaCharactersListToNumbers
        |> String.fromList

ipaCharactersListToNumbers : List Char -> List Char
ipaCharactersListToNumbers charList = 
  case charList of
    [] -> []
    (' '::restOfChars) -> [' '] ++ ipaCharactersListToNumbers restOfChars
    (char::restOfChars) -> 
       let firstPart : List Char
           firstPart = char
                     |> UnicodeToIPANumber.unicodeToNumber
                     |> String.fromInt
                     |> String.toList
        in firstPart ++ [' '] ++ ipaCharactersListToNumbers restOfChars 

update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeInIPAChars newContent ->
            { model 
            |  ipaCharactersContent = newContent  -- Allows normal input to text field. 
            , ipaNumbersContent = ipaCharactersToNumbers newContent
            }
    ChangeInIPANumbers newContent ->
            {model 
            | ipaNumbersContent = newContent -- Allow normal input 
            , ipaCharactersContent = ipaNumbersToCharacters newContent
            }

view : Model -> Html Msg
view model =  div []
       [   h1 [] [text "IPA Number to IPA Character Convertor"]
           , inputTextArea model
           , outputTextArea model
           , span [class "welcome-message"] [text "Programmed by Elsanussi Mneina, 2021"]
       ]
