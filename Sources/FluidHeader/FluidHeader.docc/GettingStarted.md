# Getting Started with FluidHeader

Add a fluid header to a SwiftUI scroll view and choose where its content begins.

## Add a header

Import `FluidHeader`, then put ``FluidHeader`` at the beginning of a vertical
`ScrollView`:

```swift
import FluidHeader
import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            FluidHeader {
                Image("Cover")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 360)
                    .clipped()
            }

            VStack(alignment: .leading, spacing: 16) {
                Text("Mountain Journal")
                    .font(.largeTitle.bold())

                Text("The rest of the page content goes here.")
            }
            .padding()
        }
        .ignoresSafeArea(edges: .top)
    }
}
```

Ignoring the top safe area lets the image extend behind system chrome. Omit
`ignoresSafeArea(edges:)` when the design should remain below the safe area.

## Apply the modifier directly

Use ``SwiftUICore/View/fluidHeader()`` when wrapping the content would add an
unwanted container:

```swift
ScrollView {
    Rectangle()
        .fill(.blue.gradient)
        .frame(height: 280)
        .overlay {
            Text("Explore")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
        }
        .fluidHeader()

    DestinationList()
}
```

Both forms apply the same ``FluidHeaderModifier`` and respond to the nearest
scroll view.

## Configure one header or a group

Configuration values use the SwiftUI environment. Apply them to a single
header to configure it locally:

```swift
FluidHeader {
    CoverImage()
}
.fluidHeaderScrollSensitivity(0.35)
.fluidHeaderMaxBlurRadius(8)
```

Apply the same modifiers to a common ancestor when several headers should share
a configuration. See <doc:CustomizingEffects> for the available controls and
their timing.
