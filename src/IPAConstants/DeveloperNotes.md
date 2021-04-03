# Regular expressions used in Vim
## To convert Unicode escape sequences from Haskell to Elm.

%s/\\x\(....\)/\\u\{\1\}/g

## To convert type signature from Haskell syntax to Elm.

%s/::/:/g
