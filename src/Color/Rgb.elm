module Color.Rgb exposing
  ( toHsl
  , fromHsl
  )


import Color.Rgb1 as Rgb1



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
      Rgb1.fromHsl h s l alpha
  in
  { red = round (255 * color.red)
  , green = round (255 * color.green)
  , blue = round (255 * color.blue)
  , alpha = color.alpha
  }



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
  Rgb1.toHsl (toFloat r / 255) (toFloat g / 255) (toFloat b / 255) alpha
