//
//  FluidHeaderMaxBlurRadius.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

extension EnvironmentValues {
    @Entry
    public var fluidHeaderMaxBlurRadius: CGFloat = 4.0
}

extension View {
    public func fluidHeaderMaxBlurRadius(_ radius: CGFloat) -> some View {
        self
            .environment(
                \.fluidHeaderMaxBlurRadius,
                radius.clamped(to: 0.0...CGFloat.infinity)
            )
    }
}
