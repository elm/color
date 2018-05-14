module Color.Rgb exposing
  ( toHsl
  , fromHsl
  , toRgb255
  , fromRgb255
  )


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
toRgb255 r g b alpha =
  { red = round (255 * r)
  , green = round (255 * g)
  , blue = round (255 * b)
  , alpha = alpha
  }

fromRgb255
  : Int
  -> Int
  -> Int
  -> Float
  ->  { red : Float
      , green : Float
      , blue : Float
      , alpha : Float
      }
fromRgb255 r g b alpha =
  { red = toFloat r / 255
  , green = toFloat g / 255
  , blue = toFloat b / 255
  , alpha = alpha
  }



-- FROM HSL


fromHsl
  : Float
  -> Float
  -> Float
  -> Float
  ->  { red : Float
      , green : Float
      , blue : Float
      , alpha : Float
      }
fromHsl hue saturation lightness alpha =
  let
    chroma = (1 - abs (2 * lightness - 1)) * saturation
    normHue = hue / degrees 60

    x = chroma * (1 - abs (modFloatBy 2 normHue - 1))
    m = lightness - chroma / 2

    make r g b =
      { red = r + m, green = g + m, blue = b + m, alpha = alpha }
  in
  if normHue < 0 then
    make 0 0 0

  else if normHue < 1 then
    make chroma x 0

  else if normHue < 2 then
    make x chroma 0

  else if normHue < 3 then
    make 0 chroma x

  else if normHue < 4 then
    make 0 x chroma

  else if normHue < 5 then
    make x 0 chroma

  else if normHue < 6 then
    make chroma 0 x

  else
    make 0 0 0


modFloatBy : Int -> Float -> Float
modFloatBy n float =
  let
    integer = floor float
  in
  toFloat (modBy n integer) + float - toFloat integer



-- TO HSL


toHsl
  : Float
  -> Float
  -> Float
  -> Float
  ->  { hue : Float
      , saturation : Float
      , lightness : Float
      , alpha : Float
      }
toHsl red green blue alpha =
  let
    cMax = max (max r g) b
    cMin = min (min r g) b

    c = cMax - cMin

    hue =
      degrees 60 *
        if cMax == r then
          modFloatBy 6 ((g - b) / c)
        else if cMax == g then
          ((b - r) / c) + 2
        else {- cMax == b -}
          ((r - g) / c) + 4

    lightness =
      (cMax + cMin) / 2

    saturation =
      if lightness == 0 then
        0
      else
        c / (1 - abs (2 * lightness - 1))
  in
  { hue = hue
  , saturation = saturation
  , lightness = lightness
  , alpha = alpha
  }
