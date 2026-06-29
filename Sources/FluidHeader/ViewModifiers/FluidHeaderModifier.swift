//
//  FluidHeaderModifier.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

/// A modifier that applies FluidHeader's position, scale, blur, and opacity
/// effects to a view as it moves through a scroll view.
///
/// You normally apply this modifier with ``SwiftUICore/View/fluidHeader()`` rather
/// than creating it directly.
public struct FluidHeaderModifier: ViewModifier {
    @Environment(\.fluidHeaderScrollSensitivity)
    private var scrollSensitivity: CGFloat

    @Environment(\.fluidHeaderScaleSensitivity)
    private var scaleSensitivity: CGFloat

    @Environment(\.fluidHeaderMaxBlurRadius)
    private var maxBlurRadius: CGFloat

    @Environment(\.fluidHeaderBlurOffset)
    private var blurOffset: CGFloat

    @Environment(\.fluidHeaderBlurHeight)
    private var blurHeight: CGFloat

    @Environment(\.fluidHeaderOpacityHeight)
    private var opacityHeight: CGFloat

    /// Applies the configured fluid header effects to `content`.
    public func body(content: Content) -> some View {
        content
            .visualEffect {
                [
                    scrollSensitivity, scaleSensitivity,
                    maxBlurRadius, blurOffset,
                    blurHeight, opacityHeight
                ]
                effect,
                geometry in

                let minY: CGFloat = geometry.frame(in: .scrollView).minY

                let yOffset: CGFloat =
                    -(minY < 0 ? minY * scrollSensitivity : minY)

                let scale: CGFloat =
                    1.0 + (minY * scaleSensitivity).clamped(to: 0.0...1.0)

                let blurRadius: CGFloat =
                    maxBlurRadius
                    * ((-minY - blurOffset) / blurHeight).clamped(to: 0.0...1.0)

                let opacity: CGFloat =
                    1.0
                    - ((-minY - (blurOffset + blurHeight)) / opacityHeight)
                    .clamped(to: 0.0...1.0)

                return
                    effect
                    .scaleEffect(scale, anchor: .top)
                    .offset(y: yOffset)
                    .blur(radius: blurRadius)
                    .opacity(opacity)
            }
    }
}

extension View {
    /// Applies stretchy header behavior based on the view's position in its
    /// nearest scroll view.
    ///
    /// Use this modifier when an existing view should act as the header. For a
    /// container-style API, use ``FluidHeader``.
    ///
    /// ```swift
    /// ScrollView {
    ///     Image("Landscape")
    ///         .resizable()
    ///         .scaledToFill()
    ///         .frame(height: 320)
    ///         .fluidHeader()
    ///
    ///     ArticleContent()
    /// }
    /// ```
    ///
    /// - Returns: A view that responds to scrolling with FluidHeader effects.
    public func fluidHeader() -> some View {
        self
            .modifier(FluidHeaderModifier())
    }
}
