//
//  FluidHeaderOpacityHeight.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    @Entry
    public var fluidHeaderOpacityHeight: CGFloat = 80.0
}

extension View {
    public func fluidHeaderOpacityHeight(_ height: CGFloat) -> some View {
        self
            .environment(
                \.fluidHeaderOpacityHeight,
                height.clamped(to: 0.0...CGFloat.infinity)
            )
    }
}
