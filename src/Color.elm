module Color exposing
  ( Color
  , rgb, rgba, toRgb
  , hsl, hsla, toHsl
  , greyscale, grayscale
  )

{-| Create [RGB][], [HSL][], and [greyscale][] colors.

[RGB]: https://en.wikipedia.org/wiki/RGB_color_model
[HSL]: https://en.wikipedia.org/wiki/HSL_and_HSV
[greyscale]: https://en.wikipedia.org/wiki/Grayscale

# Colors
@docs Color

# RGB
@docs rgb, rgba, toRgb

# HSL
@docs hsl, hsla, toHsl

# Greyscale
@docs greyscale, grayscale

-}

import Basics exposing (..)



-- COLORS


{-| Representation of colors.
-}
type Color
    = RGB Int Int Int Float
    | HSL Float Float Float Float



-- RGB


{-| Create RGB colors from numbers between 0 and 255 inclusive. -}
rgb : Int -> Int -> Int -> Color
rgb r g b =
  RGB r g b 1


{-| Create RGB colors with an alpha component for transparency.
The alpha component is specified with numbers between 0 and 1. -}
rgba : Int -> Int -> Int -> Float -> Color
rgba =
  RGB


{-| Extract the components of a color in the RGB format.
-}
toRgb : Color -> { red:Int, green:Int, blue:Int, alpha:Float }
toRgb color =
  case color of
    RGB r g b a ->
      { red = r, green = g, blue = b, alpha = a }

    HSL h s l a ->
      let
        (r,g,b) = hslToRgb h s l
      in
        { red = round (255 * r)
        , green = round (255 * g)
        , blue = round (255 * b)
        , alpha = a
        }



-- HSL


{-| Create [HSL colors](http://en.wikipedia.org/wiki/HSL_and_HSV). This gives
you access to colors more like a color wheel, where all hues are arranged in a
circle that you specify with standard Elm angles (radians).

    red   = hsl (degrees   0) 1 0.5
    green = hsl (degrees 120) 1 0.5
    blue  = hsl (degrees 240) 1 0.5

    pastelRed = hsl (degrees 0) 0.7 0.7

To cycle through all colors, just cycle through degrees. The saturation level
is how vibrant the color is, like a dial between grey and bright colors. The
lightness level is a dial between white and black.
-}
hsl : Float -> Float -> Float -> Color
hsl hue saturation lightness =
  hsla hue saturation lightness 1


{-| Create [HSL colors](http://en.wikipedia.org/wiki/HSL_and_HSV)
with an alpha component for transparency.
-}
hsla : Float -> Float -> Float -> Float -> Color
hsla hue saturation lightness alpha =
  HSL (hue - turns (toFloat (floor (hue / (2*pi))))) saturation lightness alpha


{-| Extract the components of a color in the HSL format.
-}
toHsl : Color -> { hue : Float, saturation : Float, lightness : Float, alpha : Float }
toHsl color =
  case color of
    HSL h s l a ->
      { hue = h, saturation = s, lightness = l, alpha = a }

    RGB r g b a ->
      let
        (h,s,l) = rgbToHsl r g b
      in
        { hue = h, saturation = s, lightness = l, alpha = a }



-- GREYSCALE


{-| Produce a gray based on the input. 0 is white, 1 is black.
-}
grayscale : Float -> Color
grayscale p =
  HSL 0 0 (1-p) 1


{-| Produce a gray based on the input. 0 is white, 1 is black.
-}
greyscale : Float -> Color
greyscale p =
  HSL 0 0 (1-p) 1



-- COLOR SPACE CONVERSIONS


rgbToHsl : Int -> Int -> Int -> (Float,Float,Float)
rgbToHsl red green blue =
  let
    r = toFloat red   / 255
    g = toFloat green / 255
    b = toFloat blue  / 255

    cMax = max (max r g) b
    cMin = min (min r g) b

    c = cMax - cMin

    hue =
      degrees 60 *
        if cMax == r then
          fmod ((g - b) / c) 6
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
    (hue, saturation, lightness)


hslToRgb : Float -> Float -> Float -> (Float,Float,Float)
hslToRgb hue saturation lightness =
  let
    chroma = (1 - abs (2 * lightness - 1)) * saturation
    normHue = hue / degrees 60

    x = chroma * (1 - abs (fmod normHue 2 - 1))

    (r,g,b) =
      if normHue < 0 then (0, 0, 0)
      else if normHue < 1 then (chroma, x, 0)
      else if normHue < 2 then (x, chroma, 0)
      else if normHue < 3 then (0, chroma, x)
      else if normHue < 4 then (0, x, chroma)
      else if normHue < 5 then (x, 0, chroma)
      else if normHue < 6 then (chroma, 0, x)
      else (0, 0, 0)

    m = lightness - chroma / 2
  in
    (r + m, g + m, b + m)


fmod : Float -> Int -> Float
fmod f n =
  let
    integer = floor f
  in
    toFloat (integer % n) + f - toFloat integer
