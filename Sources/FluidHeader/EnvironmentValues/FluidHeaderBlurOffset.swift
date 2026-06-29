//
//  FluidHeaderBlurOffset.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    /// The upward scroll distance before a fluid header begins to blur.
    ///
    /// The default value is `80` points.
    @Entry
    public var fluidHeaderBlurOffset: CGFloat = 80.0
}

extension View {
    /// Sets how far a header scrolls upward before blur begins.
    ///
    /// - Parameter offset: The delay distance in points. Values below zero are
    ///   clamped to zero. The default is `80`.
    /// - Returns: A view with the blur offset stored in its environment.
    public func fluidHeaderBlurOffset(_ offset: CGFloat) -> some View {
        self
            .environment(
                \.fluidHeaderBlurOffset,
                offset.clamped(to: 0.0...CGFloat.infinity)
            )
    }
}
