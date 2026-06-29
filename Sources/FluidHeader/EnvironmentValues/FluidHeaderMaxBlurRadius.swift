//
//  FluidHeaderMaxBlurRadius.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    /// The maximum blur radius applied to a fluid header.
    ///
    /// The default value is `4` points.
    @Entry
    public var fluidHeaderMaxBlurRadius: CGFloat = 4.0
}

extension View {
    /// Sets the maximum blur radius for a fluid header.
    ///
    /// - Parameter radius: The maximum radius in points. Values below zero are
    ///   clamped to zero. The default is `4`.
    /// - Returns: A view with the maximum blur radius stored in its environment.
    public func fluidHeaderMaxBlurRadius(_ radius: CGFloat) -> some View {
        self
            .environment(
                \.fluidHeaderMaxBlurRadius,
                radius.clamped(to: 0.0...CGFloat.infinity)
            )
    }
}
