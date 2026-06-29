//
//  FluidHeader.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

/// A container that turns its content into a stretchy, fading scroll header.
///
/// Place a `FluidHeader` at the top of a vertical `ScrollView`. The header grows
/// when pulled down and moves, blurs, and fades as it scrolls above the viewport.
///
/// ```swift
/// ScrollView {
///     FluidHeader {
///         Image("Landscape")
///             .resizable()
///             .scaledToFill()
///             .frame(height: 320)
///     }
///
///     ArticleContent()
/// }
/// .ignoresSafeArea(edges: .top)
/// ```
///
/// Customize the animation by applying FluidHeader environment modifiers to
/// this view, such as ``SwiftUICore/View/fluidHeaderScrollSensitivity(_:)``.
///
/// - Note: The effect reads the content's position in the nearest scroll view,
///   so use this view inside a `ScrollView`.
public struct FluidHeader<Content>: View where Content: View {
    private let content: Content

    /// Creates a fluid header from the supplied content.
    ///
    /// - Parameter content: The view that fills the header.
    public init(
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
    }

    /// The content and scrolling effects that make up the header.
    public var body: some View {
        content
            .fluidHeader()
    }
}
