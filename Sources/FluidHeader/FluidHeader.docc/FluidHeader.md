# ``FluidHeader``

Build SwiftUI headers that stretch when pulled down and gracefully move, blur,
and fade while scrolling away.

## Overview

FluidHeader derives its animations from a header's position in the nearest
scroll view. Wrap header content in ``FluidHeader`` or apply
``SwiftUICore/View/fluidHeader()`` directly to an existing view.

```swift
import FluidHeader
import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            FluidHeader {
                Image("Landscape")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 320)
                    .clipped()
            }

            Text("Story content")
                .padding()
        }
        .ignoresSafeArea(edges: .top)
    }
}
```

The default configuration creates a parallax-like movement, scales the header
during downward overscroll, and progressively blurs and fades it during upward
scrolling. Apply configuration modifiers to the header or to one of its
ancestors to tune those effects.

> Important: FluidHeader calculates its effect in the `.scrollView` coordinate
> space. Place the affected view inside a `ScrollView` for meaningful behavior.

## Topics

### Essentials

- <doc:GettingStarted>
- ``FluidHeader``
- ``SwiftUICore/View/fluidHeader()``
- ``FluidHeaderModifier``

### Customizing the Effect

- <doc:CustomizingEffects>
- ``SwiftUICore/View/fluidHeaderScrollSensitivity(_:)``
- ``SwiftUICore/View/fluidHeaderScaleSensitivity(_:)``
- ``SwiftUICore/View/fluidHeaderMaxBlurRadius(_:)``
- ``SwiftUICore/View/fluidHeaderBlurOffset(_:)``
- ``SwiftUICore/View/fluidHeaderBlurHeight(_:)``
- ``SwiftUICore/View/fluidHeaderOpacityHeight(_:)``

### Environment Values

- ``SwiftUICore/EnvironmentValues/fluidHeaderScrollSensitivity``
- ``SwiftUICore/EnvironmentValues/fluidHeaderScaleSensitivity``
- ``SwiftUICore/EnvironmentValues/fluidHeaderMaxBlurRadius``
- ``SwiftUICore/EnvironmentValues/fluidHeaderBlurOffset``
- ``SwiftUICore/EnvironmentValues/fluidHeaderBlurHeight``
- ``SwiftUICore/EnvironmentValues/fluidHeaderOpacityHeight``
