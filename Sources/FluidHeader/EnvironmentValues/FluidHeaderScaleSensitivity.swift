//
//  FluidHeaderScaleSensitivity.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    @Entry
    public var fluidHeaderScaleSensitivity: CGFloat = 0.001
}

extension View {
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
