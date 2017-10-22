module Events exposing ( onClickPage )

import Html exposing (..)
import Html.Events exposing (onWithOptions, defaultOptions)
import Json.Decode exposing (Decoder)
import Html.Attributes exposing (..)
import Model exposing (..)


onSimpleClick : msg -> Attribute msg
onSimpleClick message =
    onWithOptions "click"
        { defaultOptions | preventDefault = True }
        (preventDefault2
            |> Json.Decode.andThen (maybePreventDefault message)
        )


preventDefault2 : Decoder Bool
preventDefault2 =
    Json.Decode.map2
        (invertedOr)
        (Json.Decode.field "ctrlKey" Json.Decode.bool)
        (Json.Decode.field "metaKey" Json.Decode.bool)


maybePreventDefault : msg -> Bool -> Decoder msg
maybePreventDefault msg preventDefault =
    case preventDefault of
        True ->
            Json.Decode.succeed msg

        False ->
            Json.Decode.fail "Normal link"


invertedOr : Bool -> Bool -> Bool
invertedOr x y =
    not (x || y)


onClickPage : String -> List (Attribute Msg)
onClickPage url =
  [ href url, onSimpleClick ( LinkTo url ) ]