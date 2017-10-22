module Update exposing (..)


import Model exposing (..)
import Navigation exposing (newUrl)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    GoTo maybePage ->
      case maybePage of
        Nothing ->
          ( { model | currentPage = Home }, Cmd.none )

        Just page ->
          ( { model | currentPage = page }, Cmd.none )

    LinkTo path ->
      ( model, newUrl path )
