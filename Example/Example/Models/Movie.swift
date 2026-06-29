//
//  Movie.swift
//  Example
//
//  Created by Huigyun Jeong on 6/28/26.
//

import SwiftUI

struct Movie {
    let title: String
    let videoURL: URL
    let premise: String
    let color: Color
    let director: String
    let actors: [String]
}

extension Movie {
    static let bigBuckBunny: Self = .init(
        title: "Big Buck Bunny",
        videoURL: .init(
            string:
                "https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov"
        )!,
        premise:
            "A gentle giant rabbit enjoys a peaceful day in the forest until three mischievous rodents begin bullying the woodland creatures. Using wit and a series of elaborate traps, the bunny turns the tables on his tormentors.",
        color: .init(red: 111 / 255, green: 132 / 255, blue: 76 / 255),
        director: "Sacha Goedegebure",
        actors: [
            "Big Buck Bunny",
            "Frank",
            "Rinky",
            "Gimera",
        ]
    )
}
