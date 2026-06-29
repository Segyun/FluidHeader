//
//  FluidHeaderScaleSensitivity.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    /// The rate at which a fluid header grows while pulled down.
    ///
    /// The default value is `0.001` scale units per point. Growth is capped at
    /// twice the header's original size.
    @Entry
    public var fluidHeaderScaleSensitivity: CGFloat = 0.001
}

extension View {
    /// Sets how quickly a fluid header scales while pulled down.
    ///
    /// - Parameter sensitivity: The scale increase per point of downward pull.
    ///   Values below zero are clamped to zero. The default is `0.001`.
    /// - Returns: A view with the scale sensitivity stored in its environment.
    public func fluidHeaderScaleSensitivity(
        _ sensitivity: CGFloat
    ) -> some View {
        self
            .environment(
                \.fluidHeaderScaleSensitivity,
                sensitivity.clamped(to: 0.0...CGFloat.infinity)
            )
    }
}
