//
//  FluidHeaderBlurHeight.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    @Entry
    public var fluidHeaderBlurHeight: CGFloat = 80.0
}

extension View {
    public func fluidHeaderBlurHeight(_ height: CGFloat) -> some View {
        self
            .environment(
                \.fluidHeaderBlurHeight,
                height.clamped(to: 0.0...CGFloat.infinity)
            )
    }
}
