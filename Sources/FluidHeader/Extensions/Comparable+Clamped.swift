//
//  Comparable+Clamped.swift
//  FluidHeader
//
//  Created by Huigyun Jeong on 6/28/26.
//

extension Comparable {
    internal func clamped(to range: ClosedRange<Self>) -> Self {
        return min(range.upperBound, max(range.lowerBound, self))
    }
}
