//
//  FluidHeaderScrollSensitivity.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    /// The fraction of upward scrolling applied to a fluid header's movement.
    ///
    /// The default value is `0.5`.
    @Entry
    public var fluidHeaderScrollSensitivity: CGFloat = 0.5
}

extension View {
    /// Sets how quickly a fluid header moves while scrolling upward.
    ///
    /// A value of `0` keeps the header fixed, `0.5` moves it at half the scroll
    /// rate, and `1` follows the content's scroll rate.
    ///
    /// - Parameter sensitivity: The movement multiplier. Values below zero are
    ///   clamped to zero. The default is `0.5`.
    /// - Returns: A view with the scroll sensitivity stored in its environment.
    public func fluidHeaderScrollSensitivity(
        _ sensitivity: CGFloat
    ) -> some View {
        self
            .environment(
                \.fluidHeaderScrollSensitivity,
                sensitivity.clamped(to: 0.0...CGFloat.infinity)
            )
    }
}
