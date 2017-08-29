# Colors

A standard format for sharing colors between Elm packages.


## Accessible Colors

It is important that your colors look good for everyone! Here are some things to think about:

  - **Color Blindness** is when someone cannot distinguish certain colors easily. There are [so many different types of color blindness](http://www.alanzucconi.com/2015/12/16/color-blindness/) that a good option is to offer a couple alternate color schemes and let folks choose what works for them.

  - **Bad Contrast** is when you have two different colors, but their percieved *brightness* is similar. This can make text really hard to read for some folks.

In both cases, the solution will be specific to your color scheme and the particulars of your design. For example, say your color scheme has two colors with bad contrast. If those colors are never used near each other, that is fine! But if one is text and the other is the background, that is a problem!

The following code shows some ideas of how you can have more accessible colors in an imaginary `Website` project.

```elm
module Website.Color exposing (..)

import Color


-- CUSTOM COLOR TYPE

type Color =
  Color
    { normal : Color.Color
    , alternate : Color.Color
    , contrast : Color.Color
    }

type Mode = Normal | Alternate | HighContrast

toRgb : Mode -> Color -> Color.Rgb
toRgb mode (Color { normal, alternate, contrast }) =
  case mode of
    Normal ->
      Color.toRgb normal

    Alternate ->
      Color.toRgb alternate

    HighContrast ->
      Color.toRgb contrast


-- WEBSITE COLOR SCHEME

blue : Color
blue =
  Color { normal = ..., alternate = ..., contrast = ... }
```

You can play around with the details of the `Color` type to specify more alternates or to try compute better colors. Maybe you can record metadata like “this color is for text and it will be paired with this color background” so you can compute higher contrast algorithmically?

It is not yet clear if something like this can become part of this package. I would love to have a way to make colors accessible by default without too much work, so please let me know how the strategy outlined here works for you!