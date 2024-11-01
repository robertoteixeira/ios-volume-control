//
//  VolumeControlViewModel.swift
//  VolumeControl
//
//  Created by Roberto Teixeira on 01/11/2024.
//

import SwiftUI
import AVFoundation

class VolumeControlViewModel: ObservableObject {
    @Published var sliderProgress: CGFloat = 0.5 {
        didSet {
            audioPlayer?.volume = Float(sliderProgress) // Update volume as slider progresses
        }
    }
    @Published var barCount: Int = 10
    @Published var inputBarCount: String = "10"
    @Published var inputProgress: String = "50"
    @Published var errorMessage: String = ""
    
    private var audioPlayer: AVAudioPlayer?
    
    init() {
        setupAudioPlayer()
    }
    
    func setBarCount() {
        if let count = Int(inputBarCount), count > 3, count <= 30 { // Set maximum limit
            barCount = count
            errorMessage = ""
        } else {
            errorMessage = "Bar count must be between 4 and 30."
        }
    }
    
    func setVolume() {
        if let progressPercentage = Int(inputProgress), progressPercentage >= 0 && progressPercentage <= 100 {
            sliderProgress = CGFloat(progressPercentage) / 100.0
            audioPlayer?.volume = Float(sliderProgress)
            errorMessage = ""
        } else {
            errorMessage = "Progress must be between 0 and 100."
        }
    }
    
    private func setupAudioPlayer() {
        guard let path = Bundle.main.path(forResource: "background-music", ofType: "mp3") else {
            print("Background music file not found")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // Loop indefinitely
            audioPlayer?.volume = Float(sliderProgress) // Set initial volume
            audioPlayer?.play() // Start playing the background music
        } catch {
            print("Failed to initialize AVAudioPlayer: \(error.localizedDescription)")
        }
    }
}

