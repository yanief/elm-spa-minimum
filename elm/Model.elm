module Model exposing (..)

type Page
  = Home
  | Login
  | About
  | PostShow Int


type alias Model =
  { currentPage : Page
  }

type Msg
  = GoTo (Maybe Page)
  | LinkTo String