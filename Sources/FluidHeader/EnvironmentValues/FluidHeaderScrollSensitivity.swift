//
//  FluidHeaderScrollSensitivity.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    @Entry
    public var fluidHeaderScrollSensitivity: CGFloat = 0.5
}

extension View {
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
