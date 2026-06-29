//
//  FluidHeaderBlurHeight.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    /// The scroll distance over which a fluid header reaches its maximum blur.
    ///
    /// The default value is `80` points.
    @Entry
    public var fluidHeaderBlurHeight: CGFloat = 80.0
}

extension View {
    /// Sets the scroll distance over which a fluid header reaches its maximum
    /// blur radius.
    ///
    /// - Parameter height: The transition distance in points. Values below zero
    ///   are clamped to zero. The default is `80`.
    /// - Returns: A view with the blur transition distance stored in its
    ///   environment.
    public func fluidHeaderBlurHeight(_ height: CGFloat) -> some View {
        self
            .environment(
                \.fluidHeaderBlurHeight,
                height.clamped(to: 0.0...CGFloat.infinity)
            )
    }
}
