//
//  ContentView.swift
//  VolumeControl
//
//  Created by Roberto Teixeira on 31/10/2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var viewModel = VolumeControlViewModel()
    
    private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        UIApplication.shared.dismissKeyboard()
                    }
                
                VStack {
                    HStack(spacing: 40) {
                        CustomSlider(
                            sliderProgress: $viewModel.sliderProgress,
                            orientation: .vertical,
                            foregroundColor: .blue,
                            style: .continuous,
                            barCount: viewModel.barCount
                        )
                        .frame(width: 60, height: 180)
                        
                        CustomSlider(
                            sliderProgress: $viewModel.sliderProgress,
                            orientation: .vertical,
                            foregroundColor: .red,
                            style: .bar,
                            barCount: viewModel.barCount
                        )
                        .frame(width: 60, height: 180)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    VStack(spacing: 40) {
                        CustomSlider(
                            sliderProgress: $viewModel.sliderProgress,
                            orientation: .horizontal,
                            foregroundColor: .blue,
                            style: .continuous,
                            barCount: viewModel.barCount
                        )
                        .frame(width: 220, height: 30)
                        
                        CustomSlider(
                            sliderProgress: $viewModel.sliderProgress,
                            orientation: .horizontal,
                            foregroundColor: .red,
                            style: .bar,
                            barCount: viewModel.barCount
                        )
                        .frame(width: 220, height: 30)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Text("Current volume: \(String(format: "%.1f", viewModel.sliderProgress * 100))%")
                        
                        HStack {
                            TextField("Progress (0 to 100)", text: $viewModel.inputProgress)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 100)
                            
                            Button("Set Progress") {
                                viewModel.setVolume()
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            TextField("Number of Bars", text: $viewModel.inputBarCount)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 100)
                            
                            Button("Set Bars") {
                                viewModel.setBarCount()
                            }
                        }
                        .padding(.horizontal)
                        
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                                .padding(.top)
                        }
                        
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .top)
                .navigationTitle("Custom Slider")
            }
        }
    }
}

#Preview {
    ContentView()
}
