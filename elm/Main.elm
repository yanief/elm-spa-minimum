module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Navigation exposing (..)
import UrlParser exposing (..)


import Model exposing (..)
import Update exposing ( update )
import Subscriptions exposing ( subscriptions )
import Routing exposing (..)
import View exposing ( view )


main =
  Navigation.program manageLocation
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }


-- MODEL


init : Location -> ( Model, Cmd Msg )
init location =
  let
    page =
      case parsePath route location of
        Nothing ->
          Home

        Just page ->
          page
  in
    ( Model page, Cmd.none )

