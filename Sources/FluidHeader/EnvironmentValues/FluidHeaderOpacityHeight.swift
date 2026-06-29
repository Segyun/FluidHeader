//
//  FluidHeaderOpacityHeight.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    /// The scroll distance over which a fluid header fades out after blurring.
    ///
    /// The default value is `80` points.
    @Entry
    public var fluidHeaderOpacityHeight: CGFloat = 80.0
}

extension View {
    /// Sets the scroll distance over which a fluid header fades out.
    ///
    /// The fade begins after the blur offset and blur transition have elapsed.
    ///
    /// - Parameter height: The fade distance in points. Values below zero are
    ///   clamped to zero. The default is `80`.
    /// - Returns: A view with the fade distance stored in its environment.
    public func fluidHeaderOpacityHeight(_ height: CGFloat) -> some View {
        self
            .environment(
                \.fluidHeaderOpacityHeight,
                height.clamped(to: 0.0...CGFloat.infinity)
            )
    }
}
