module Routing exposing ( route, manageLocation )

import Html exposing (..)
import Navigation exposing (..)
import UrlParser exposing (..)

import Update exposing (..)
import Model exposing (..)

route : Parser (Page -> a) a
route =
  oneOf
    [ UrlParser.map Home (UrlParser.s "home")
    , UrlParser.map Login (UrlParser.s "login")
    , UrlParser.map About (UrlParser.s "about")
    , UrlParser.map PostShow (UrlParser.s "post" </> int)
    ]


manageLocation : Location -> Msg
manageLocation location =
  parsePath route location
    |> GoTo