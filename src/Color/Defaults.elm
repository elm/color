module Color.Defaults exposing
  ( red, orange, yellow, green, blue, purple, brown
  , lightRed, lightOrange, lightYellow, lightGreen, lightBlue, lightPurple, lightBrown
  , darkRed, darkOrange, darkYellow, darkGreen, darkBlue, darkPurple, darkBrown
  , white
  , lightGrey, grey, darkGrey
  , lightGray, gray, darkGray
  , lightCharcoal, charcoal, darkCharcoal
  , black
  )

{-| These colors come from the [Tango palette][tango] which provides
aesthetically reasonable defaults for colors. Each color also comes with a
light and dark version.

[tango]: http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines

### Standard
@docs red, orange, yellow, green, blue, purple, brown

### Light
@docs lightRed, lightOrange, lightYellow, lightGreen, lightBlue, lightPurple, lightBrown

### Dark
@docs darkRed, darkOrange, darkYellow, darkGreen, darkBlue, darkPurple, darkBrown

### Eight Shades of Grey

These colors are a compatible series of shades of grey, fitting nicely
with the Tango palette.

@docs white, lightGrey, grey, darkGrey, lightCharcoal, charcoal, darkCharcoal, black

These are identical to the *grey* versions. It seems the spelling is regional, but
that has never helped me remember which one I should be writing.

@docs lightGray, gray, darkGray

-}

import Color exposing (Color, rgb)



-- TANGO COLORS


{-|-}
lightRed : Color
lightRed =
  rgb 239 41 41


{-|-}
red : Color
red =
  rgb 204 0 0


{-|-}
darkRed : Color
darkRed =
  rgb 164 0 0


{-|-}
lightOrange : Color
lightOrange =
  rgb 252 175 62


{-|-}
orange : Color
orange =
  rgb 245 121 0


{-|-}
darkOrange : Color
darkOrange =
  rgb 206 92 0


{-|-}
lightYellow : Color
lightYellow =
  rgb 255 233 79


{-|-}
yellow : Color
yellow =
  rgb 237 212 0


{-|-}
darkYellow : Color
darkYellow =
  rgb 196 160 0


{-|-}
lightGreen : Color
lightGreen =
  rgb 138 226 52


{-|-}
green : Color
green =
  rgb 115 210 22


{-|-}
darkGreen : Color
darkGreen =
  rgb 78 154 6


{-|-}
lightBlue : Color
lightBlue =
  rgb 114 159 207


{-|-}
blue : Color
blue =
  rgb 52 101 164


{-|-}
darkBlue : Color
darkBlue =
  rgb 32 74 135


{-|-}
lightPurple : Color
lightPurple =
  rgb 173 127 168


{-|-}
purple : Color
purple =
  rgb 117 80 123


{-|-}
darkPurple : Color
darkPurple =
  rgb 92 53 102


{-|-}
lightBrown : Color
lightBrown =
  rgb 233 185 110


{-|-}
brown : Color
brown =
  rgb 193 125 17


{-|-}
darkBrown : Color
darkBrown =
  rgb 143 89 2


{-|-}
black : Color
black =
  rgb 0 0 0


{-|-}
white : Color
white =
  rgb 255 255 255


{-|-}
lightGrey : Color
lightGrey =
  rgb 238 238 236


{-|-}
grey : Color
grey =
  rgb 211 215 207


{-|-}
darkGrey : Color
darkGrey =
  rgb 186 189 182


{-|-}
lightGray : Color
lightGray =
  rgb 238 238 236


{-|-}
gray : Color
gray =
  rgb 211 215 207


{-|-}
darkGray : Color
darkGray =
  rgb 186 189 182


{-|-}
lightCharcoal : Color
lightCharcoal =
  rgb 136 138 133


{-|-}
charcoal : Color
charcoal =
  rgb 85 87 83


{-|-}
darkCharcoal : Color
darkCharcoal =
  rgb 46 52 54