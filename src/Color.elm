module Color exposing
  ( Color
  , rgb, rgba, toRgb, Rgb
  , hsl, hsla, toHsl, Hsl
  , greyscale, grayscale
  )

{-| Create [RGB][], [HSL][], and [greyscale][] colors.

[RGB]: https://en.wikipedia.org/wiki/RGB_color_model
[HSL]: https://en.wikipedia.org/wiki/HSL_and_HSV
[greyscale]: https://en.wikipedia.org/wiki/Grayscale

# Colors
@docs Color

# RGB
@docs rgb, rgba, toRgb, Rgb

# HSL
@docs hsl, hsla, toHsl, Hsl

# Greyscale
@docs greyscale, grayscale

-}



-- COLORS


{-| Representation of colors.
-}
type Color
    = RGBA Int Int Int Float
    | HSLA Float Float Float Float



-- RGB


{-| Create RGB colors from numbers between 0 and 255 inclusive. -}
rgb : Int -> Int -> Int -> Color
rgb r g b =
  RGBA r g b 1


{-| Create RGB colors with an alpha component for transparency.
The alpha component is specified with numbers between 0 and 1. -}
rgba : Int -> Int -> Int -> Float -> Color
rgba =
  RGBA


{-| The result of [`toRgb`](#toRgb). Convert it to CSS or whatever you need!
-}
type alias Rgb =
  { red : Int
  , green : Int
  , blue : Int
  , alpha : Float
  }


{-| Extract the components of a color in the RGB format.
-}
toRgb : Color -> Rgb
toRgb color =
  case color of
    RGBA r g b a ->
      Rgb r g b a

    HSLA hue saturation lightness alpha ->
      let
        chroma = (1 - abs (2 * lightness - 1)) * saturation
        normHue = hue / degrees 60

        x = chroma * (1 - abs (modFloatBy 2 normHue - 1))
        m = lightness - chroma / 2

        toColor c =
          round (255 * (c + m))

        toRgbHelp r g b =
          Rgb (toColor r) (toColor g) (toColor b) alpha
      in
      if normHue < 0 then
        toRgbHelp 0 0 0

      else if normHue < 1 then
        toRgbHelp chroma x 0

      else if normHue < 2 then
        toRgbHelp x chroma 0

      else if normHue < 3 then
        toRgbHelp 0 chroma x

      else if normHue < 4 then
        toRgbHelp 0 x chroma

      else if normHue < 5 then
        toRgbHelp x 0 chroma

      else if normHue < 6 then
        toRgbHelp chroma 0 x

      else
        toRgbHelp 0 0 0


modFloatBy : Int -> Float -> Float
modFloatBy n float =
  let
    integer = floor float
  in
    toFloat (modBy n integer) + float - toFloat integer


-- HSL


{-| Create [HSL colors](https://en.wikipedia.org/wiki/HSL_and_HSV). This gives
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
hsl h s l =
  hsla h s l 1


{-| Create [HSL colors](https://en.wikipedia.org/wiki/HSL_and_HSV)
with an alpha component for transparency.
-}
hsla : Float -> Float -> Float -> Float -> Color
hsla h s l a =
  HSLA (h - turns (toFloat (floor (h / (2*pi))))) s l a


{-| The result of [`toHsl`](#toHsl). Convert it to CSS or whatever you need!
-}
type alias Hsl =
  { hue : Float
  , saturation : Float
  , lightness : Float
  , alpha : Float
  }


{-| Extract the components of a color in the HSL format.
-}
toHsl : Color -> Hsl
toHsl color =
  case color of
    HSLA h s l a ->
      Hsl h s l a

    RGBA red green blue alpha ->
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
      Hsl hue saturation lightness alpha



-- GREYSCALE


{-| Produce a gray based on the input. 0 is white, 1 is black.
-}
grayscale : Float -> Color
grayscale p =
  HSLA 0 0 (1-p) 1


{-| Produce a gray based on the input. 0 is white, 1 is black.
-}
greyscale : Float -> Color
greyscale p =
  HSLA 0 0 (1-p) 1
