//
//  ContentView.swift
//  Example
//
//  Created by Huigyun Jeong on 6/28/26.
//

import AVKit
import BlurSwiftUI
import BlurUIKit
import FluidHeader
import SwiftUI

struct ContentView: View {
    private let movie: Movie = .bigBuckBunny

    @State
    private var playerManager: VideoPlayerManager

    private var player: AVPlayer { playerManager.player }

    init() {
        self.playerManager = .init(url: movie.videoURL)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                FluidHeader {
                    VideoPlayerView(player: player)
                        .frame(height: 480)
                        .overlay(alignment: .bottom) {
                            GeometryReader { geometry in
                                VariableBlur(direction: .up)
                                    .maximumBlurRadius(16.0)
                                    .dimmingTintColor(nil)
                                    .frame(height: geometry.size.height / 2)
                                    .frame(
                                        maxHeight: .infinity,
                                        alignment: .bottom
                                    )
                                    .padding(-geometry.size.height / 4)
                            }
                        }
                        .onAppear {
                            if player.timeControlStatus != .playing {
                                player.isMuted = true
                                player.play()
                            }
                        }
                }
                .fluidHeaderBlurOffset(160)
                .padding(.bottom, -160)

                LazyVStack(spacing: 16) {
                    VStack {
                        Text(movie.title)
                            .font(.largeTitle)
                            .bold()
                            .italic()
                            .foregroundStyle(.white)

                        Text(movie.director)
                            .font(.headline)
                            .foregroundStyle(.white)
                    }

                    HStack(spacing: 24) {
                        Button {

                        } label: {
                            Label("Info", systemImage: "info")
                                .labelStyle(.iconOnly)
                                .font(.title3)
                                .foregroundStyle(.white)
                                .frame(width: 44, height: 44)
                                .background(.black.quinary, in: .circle)
                        }

                        Button {

                        } label: {
                            Label("Play", systemImage: "play.fill")
                                .labelStyle(.iconOnly)
                                .font(.title)
                                .bold()
                                .blendMode(.destinationOut)
                                .frame(width: 64, height: 64)
                                .background(.white, in: .circle)
                                .compositingGroup()
                        }

                        Button {

                        } label: {
                            Label("Favorite", systemImage: "star")
                                .labelStyle(.iconOnly)
                                .font(.title3)
                                .foregroundStyle(.white)
                                .frame(width: 44, height: 44)
                                .background(.black.quinary, in: .circle)
                        }
                    }
                    .buttonStyle(.plain)

                    Text(movie.premise)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .background {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white.quinary)
                                    .shadow(radius: 4)

                                RoundedRectangle(cornerRadius: 16)
                                    .blendMode(.destinationOut)

                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white.quinary)
                                    .strokeBorder(.white.quaternary)
                            }
                            .compositingGroup()
                        }

                    HStack(spacing: 4) {
                        Text("Actors")
                            .font(.title3)

                        Image(systemName: "chevron.forward")
                    }
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)

                    ForEach(movie.actors, id: \.self) { actor in
                        HStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.quinary)
                                .frame(width: 32, height: 32)
                                .overlay {
                                    Image(systemName: "person.fill")
                                        .foregroundStyle(.secondary)
                                }

                            Text(actor)

                            Spacer()

                            Menu("More", systemImage: "ellipsis") {

                            }
                            .labelStyle(.iconOnly)
                            .buttonStyle(.plain)
                        }
                    }

                    HStack(spacing: 4) {
                        Text("Photos")
                            .font(.title3)

                        Image(systemName: "chevron.forward")
                    }
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)

                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<10) { _ in
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.quinary)
                                    .aspectRatio(16 / 9, contentMode: .fit)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .frame(height: 160)
                }
                .safeAreaPadding(24)
            }
            .foregroundStyle(.white)
            .background(movie.color)
            .ignoresSafeArea(edges: .top)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Back", systemImage: "chevron.backward") {}
                }

                ToolbarItem {
                    ShareLink(items: [] as [URL])
                }

                ToolbarItem {
                    Button("More", systemImage: "ellipsis") {}
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
