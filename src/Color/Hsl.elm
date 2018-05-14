module Color.Hsl exposing
  ( toRgb
  , fromRgb
  , toRgb1
  , fromRgb1
  )



toRgb
  : Float
  -> Float
  -> Float
  -> Float
  ->  { red : Int
      , green : Int
      , blue : Int
      , alpha : Float
      }
toRgb =
  Rgb.fromHsl


toRgb1
  : Float
  -> Float
  -> Float
  -> Float
  ->  { red : Float
      , green : Float
      , blue : Float
      , alpha : Float
      }
toRgb1 =
  Rgb1.fromHsl


fromRgb1
  : Float
  -> Float
  -> Float
  -> Float
  ->  { hue : Float
      , saturation : Float
      , lightness : Float
      , alpha : Float
      }
fromRgb1 =
  Rgb1.toHsl


fromRgb
  : Int
  -> Int
  -> Int
  -> Float
  ->  { hue : Float
      , saturation : Float
      , lightness : Float
      , alpha : Float
      }
fromRgb =
  Rgb.toHsl