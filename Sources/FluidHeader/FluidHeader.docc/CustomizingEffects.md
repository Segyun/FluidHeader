# Customizing FluidHeader Effects

Tune movement, stretching, blur, and fading independently with environment
modifiers.

## Control movement and stretching

``SwiftUICore/View/fluidHeaderScrollSensitivity(_:)`` controls upward movement as a
multiplier of the scroll distance. The default `0.5` gives the header slower
movement than the rest of the content. Use `0` for a stationary header or `1`
to match the content's rate.

``SwiftUICore/View/fluidHeaderScaleSensitivity(_:)`` controls growth during a
downward pull. Its default is `0.001` scale units per point, and FluidHeader caps
the additional scale at `1`, for a maximum total scale of `2`.

```swift
FluidHeader {
    HeroArtwork()
}
.fluidHeaderScrollSensitivity(0.4)
.fluidHeaderScaleSensitivity(0.0015)
```

## Sequence blur and fading

Blur starts after ``SwiftUICore/View/fluidHeaderBlurOffset(_:)`` points of upward
scrolling. It reaches ``SwiftUICore/View/fluidHeaderMaxBlurRadius(_:)`` over the next
``SwiftUICore/View/fluidHeaderBlurHeight(_:)`` points. The header then fades to
transparent over ``SwiftUICore/View/fluidHeaderOpacityHeight(_:)`` points.

```swift
FluidHeader {
    HeroArtwork()
}
.fluidHeaderBlurOffset(120)
.fluidHeaderBlurHeight(100)
.fluidHeaderMaxBlurRadius(10)
.fluidHeaderOpacityHeight(140)
```

The defaults produce this upward-scroll sequence:

| Scroll distance | Result |
| --- | --- |
| `0...80` points | No blur; fully opaque |
| `80...160` points | Blur increases from `0` to `4` points |
| `160...240` points | Blur remains at `4`; opacity decreases to zero |

All configuration modifiers clamp negative arguments to zero. Use positive
transition distances: a zero blur or opacity height makes its corresponding
calculation discontinuous and should be avoided when a smooth transition is
required.
