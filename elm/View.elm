module View exposing ( view )

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import Events exposing (onClickPage)

view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text "SPA application" ]
    , renderMenu model
    , renderPage model
    ]


renderMenu : Model -> Html Msg
renderMenu model =
  div []
    [ a ( onClickPage "/home" ) [ text "Home" ]
    , a ( onClickPage "/login" ) [ text "Login" ]
    , a ( onClickPage "/about" ) [ text "About" ]
    , a ( onClickPage "/post/17" ) [ text "Go to post 17" ]
    ]


renderPage : Model -> Html Msg
renderPage model =
  let
    page_content =
      case model.currentPage of
        Home ->
          text "Home"

        Login ->
          text "Login"

        About ->
          text "About"

        PostShow postid ->
          text ("Render the post with id: " ++ toString postid)
  in
    div [] [ page_content ]
