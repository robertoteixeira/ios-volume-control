//
//  ContentView.swift
//  VolumeControl
//
//  Created by Roberto Teixeira on 31/10/2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var progress: CGFloat = 0.5
    private var audioPlayer: AVAudioPlayer?
    
    init() {
        self.audioPlayer = setupAudioPlayer()
        self.audioPlayer?.volume = Float(progress)
        self.audioPlayer?.play()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 40) {
                    CustomSlider(
                        sliderProgress: $progress,
                        orientation: .vertical,
                        foregroundColor: .blue,
                        style: .continuous
                    )
                    .frame(width: 60, height: 180)
                    
                    CustomSlider(
                        sliderProgress: $progress,
                        orientation: .vertical,
                        foregroundColor: .red,
                        style: .bar
                    )
                    .frame(width: 60, height: 180)
                    .onChange(of: progress) {
                        audioPlayer?.volume = Float(progress)
                    }
                }
                .padding(.top, 20)
                
               Spacer()
                
                VStack(spacing: 40) {
                    CustomSlider(
                        sliderProgress: $progress,
                        orientation: .horizontal,
                        foregroundColor: .blue,
                        style: .continuous
                    )
                    .frame(width: 220, height: 30)
                    
                    
                    CustomSlider(
                        sliderProgress: $progress,
                        orientation: .horizontal,
                        foregroundColor: .red,
                        style: .bar
                    )
                    .frame(width: 220, height: 30)
                }
                .padding(.top, 20)
                
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Current progress: \(String(format: "%.1f", progress * 100))%")
                    
                    Button("Update Progress") {
                        progress = 1.0
                    }
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .top)
            .navigationTitle("Custom Slider")
        }
    }
    
    private func setupAudioPlayer() -> AVAudioPlayer? {
        guard let path = Bundle.main.path(forResource: "background-music", ofType: "mp3") else {
            print("Background music file not found")
            return nil
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1 // Loop indefinitely
            return player
        } catch {
            print("Failed to initialize AVAudioPlayer: \(error.localizedDescription)")
            return nil
        }
    }
}

#Preview {
    ContentView()
}
