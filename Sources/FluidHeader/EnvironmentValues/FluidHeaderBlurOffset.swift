//
//  FluidHeaderBlurOffset.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    @Entry
    public var fluidHeaderBlurOffset: CGFloat = 80.0
}

extension View {
    public func fluidHeaderBlurOffset(_ offset: CGFloat) -> some View {
        self
            .environment(
                \.fluidHeaderBlurOffset,
                offset.clamped(to: 0.0...CGFloat.infinity)
            )
    }
}
