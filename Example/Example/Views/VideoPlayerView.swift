//
//  VideoPlayerView.swift
//  Example
//
//  Created by Huigyun Jeong on 6/28/26.
//

import AVKit
import SwiftUI

struct VideoPlayerView: UIViewRepresentable {
    private let player: AVPlayer

    init(player: AVPlayer) {
        self.player = player
    }

    func makeUIView(context: Context) -> VideoPlayerUIView {
        let uiView: VideoPlayerUIView = .init()
        uiView.playerLayer.player = player
        uiView.playerLayer.videoGravity = .resizeAspectFill
        return uiView
    }

    func updateUIView(_ uiView: VideoPlayerUIView, context: Context) {}
}

class VideoPlayerUIView: UIView {
    override class var layerClass: AnyClass {
        AVPlayerLayer.self
    }

    var playerLayer: AVPlayerLayer {
        layer as! AVPlayerLayer
    }
}
