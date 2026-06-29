//
//  FluidHeader.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

public struct FluidHeader<Content>: View where Content: View {
    private let content: Content

    public init(
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
    }

    public var body: some View {
        content
            .fluidHeader()
    }
}
