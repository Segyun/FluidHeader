# FluidHeader

FluidHeader is a lightweight SwiftUI package for building headers that stretch when pulled down and move, blur, and fade as they scroll out of view.

<p align="center">
  <img width="320" alt="FluidHeader" src="https://github.com/user-attachments/assets/4bfb7993-66a0-4698-83a0-e123151f56f2" />
</p>

## Features

- Stretching during downward overscroll
- Parallax-style movement while scrolling upward
- Configurable blur and fade transitions
- Container and view-modifier APIs
- Environment-based configuration for individual headers or entire view trees
- No third-party dependencies

## Requirements

- Swift 6.2 or later
- Xcode 26 or later
- iOS 17+, macOS 14+, visionOS 1+, tvOS 17+, or watchOS 10+

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/Segyun/FluidHeader.git", from: "1.0.0")
]
```

Or add the package in Xcode with:

```text
https://github.com/Segyun/FluidHeader.git
```

## Usage

Place `FluidHeader` at the beginning of a vertical `ScrollView`:

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

FluidHeader reads the header position in the nearest scroll-view coordinate space, so the affected view needs to be inside a `ScrollView`.

### View modifier

Apply `fluidHeader()` directly when a container is unnecessary:

```swift
ScrollView {
    Image("Landscape")
        .resizable()
        .scaledToFill()
        .frame(height: 320)
        .clipped()
        .fluidHeader()

    PageContent()
}
```

## Customization

Configuration modifiers use the SwiftUI environment. Apply them to a header or to an ancestor shared by multiple headers.

```swift
FluidHeader {
    HeroArtwork()
}
.fluidHeaderScrollSensitivity(0.4)
.fluidHeaderScaleSensitivity(0.0015)
.fluidHeaderBlurOffset(120)
.fluidHeaderBlurHeight(100)
.fluidHeaderMaxBlurRadius(10)
.fluidHeaderOpacityHeight(140)
```

| Modifier                           | Default | Purpose                                                   |
| ---------------------------------- | ------: | --------------------------------------------------------- |
| `fluidHeaderScrollSensitivity(_:)` |   `0.5` | Controls upward movement relative to the scroll distance. |
| `fluidHeaderScaleSensitivity(_:)`  | `0.001` | Controls growth per point of downward pull.               |
| `fluidHeaderBlurOffset(_:)`        |    `80` | Delays the start of blur by a number of points.           |
| `fluidHeaderBlurHeight(_:)`        |    `80` | Sets the distance over which blur reaches its maximum.    |
| `fluidHeaderMaxBlurRadius(_:)`     |     `4` | Sets the maximum blur radius.                             |
| `fluidHeaderOpacityHeight(_:)`     |    `80` | Sets the fade-out distance after the blur transition.     |

Negative configuration values are clamped to zero. Use positive blur and opacity heights when a smooth transition is required.

## Documentation

The package includes a DocC catalog with a getting-started guide, effect timing details, and complete public API documentation. Select **Product > Build Documentation** in Xcode to open it.

## Example

The [`Example`](Example) project demonstrates FluidHeader with a media-style detail screen.

## License

FluidHeader is available under the MIT License. See [`LICENSE`](LICENSE) for details.
