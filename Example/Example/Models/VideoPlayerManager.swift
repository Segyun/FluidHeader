//
//  VideoPlayerManager.swift
//  Example
//
//  Created by Huigyun Jeong on 6/28/26.
//

import AVFoundation
import Foundation

@Observable
final class VideoPlayerManager {
    let player: AVQueuePlayer
    private let looper: AVPlayerLooper

    init(url: URL) {
        let item: AVPlayerItem = .init(url: url)
        let player: AVQueuePlayer = .init()

        self.player = player
        self.looper = .init(player: player, templateItem: item)
    }
}
