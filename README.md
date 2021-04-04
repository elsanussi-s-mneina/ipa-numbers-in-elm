# IPA Numbers in Elm
This project will implement converting IPA characters to IPA numbers, and back.
This will be programmed in the Elm programming language, and will run on a web browser.

## Try it now in the browser:
The following link takes you to a preliminary release of the software that you can try in your browser.
https://elsanussi-s-mneina.github.io/ipa-numbers-in-elm/


## History
This project was created by Elsanussi S. Mneina on April 3rd, 2021.
This is based on on an earlier project at  https://github.com/elsanussi-s-mneina/ipa-numbers-in-haskell

## Current Status
- A draft of the graphical user interface is ready.
- Conversion from IPA characters to numbers is implemented, and working from the web page.
- Conversion from numbers to IPA Characters is implemented, and working form the web page.

I still need to:
- figure out how to deal with spaces in the text.
- make user interface nicer
  - make input text area better
  - include introduction
  - include reference chart or table of numbers
- write unit tests


## How to develop.
### Prerequisites
- Elm compiler
- Web browser

## How to run locally
Run the following command:
`elm reactor`

## How to produce index.html file.
Run the following command: 
`elm make src/Main.elm`
