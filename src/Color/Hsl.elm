module Color.Hsl exposing
  ( toRgb255
  , fromRgb255
  , toRgb
  , fromRgb
  )


import Color.Rgb
import Color.Rgb255



toRgb255
  : Float
  -> Float
  -> Float
  -> Float
  ->  { red : Int
      , green : Int
      , blue : Int
      , alpha : Float
      }
toRgb255 =
  Rgb255.fromHsl


toRgb
  : Float
  -> Float
  -> Float
  -> Float
  ->  { red : Float
      , green : Float
      , blue : Float
      , alpha : Float
      }
toRgb =
  Rgb.fromHsl


fromRgb
  : Float
  -> Float
  -> Float
  -> Float
  ->  { hue : Float
      , saturation : Float
      , lightness : Float
      , alpha : Float
      }
fromRgb =
  Rgb.toHsl


fromRgb255
  : Int
  -> Int
  -> Int
  -> Float
  ->  { hue : Float
      , saturation : Float
      , lightness : Float
      , alpha : Float
      }
fromRgb255 =
  Rgb255.toHsl