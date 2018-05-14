module Color.Rgb255 exposing
  ( toHsl
  , fromHsl
  , toRgb
  , fromRgb
  )


import Color.Rgb as Rgb


fromRgb
  : Float
  -> Float
  -> Float
  -> Float
  ->  { red : Int
      , green : Int
      , blue : Int
      , alpha : Float
      }
fromRgb =
  Rgb.toRgb255


toRgb
  : Int
  -> Int
  -> Int
  -> Float
  ->  { red : Float
      , green : Float
      , blue : Float
      , alpha : Float
      }
toRgb =
  Rgb.fromRgb255



-- FROM HSL


fromHsl
  : Float
  -> Float
  -> Float
  -> Float
  ->  { red : Int
      , green : Int
      , blue : Int
      , alpha : Float
      }
fromHsl h s l alpha =
  let
    color =
      Rgb.fromHsl h s l alpha
  in
  Rgb.toRgb255
    color.red
    color.green
    color.blue
    color.alpha



-- TO HSL


toHsl
  : Int
  -> Int
  -> Int
  -> Float
  ->  { hue : Float
      , saturation : Float
      , lightness : Float
      , alpha : Float
      }
toHsl r g b alpha =
  Rgb.toHsl
    (toFloat r / 255)
    (toFloat g / 255)
    (toFloat b / 255)
    alpha
