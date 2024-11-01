//
//  ContentView.swift
//  VolumeControl
//
//  Created by Roberto Teixeira on 31/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var progress: CGFloat = .zero
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 40) {
                    CustomSlider(
                        sliderProgress: $progress,
                        orientation: .vertical,
                        color: .blue,
                        style: .continuous
                    )
                    .frame(width: 60, height: 180)
                    
                    CustomSlider(
                        sliderProgress: $progress,
                        orientation: .vertical,
                        color: .red,
                        style: .bar
                    )
                    .frame(width: 60, height: 180)
                }
                .padding(.top, 20)
                
               Spacer()
                
                VStack(spacing: 40) {
                    CustomSlider(
                        sliderProgress: $progress,
                        orientation: .horizontal,
                        color: .blue,
                        style: .continuous
                    )
                    .frame(width: 220, height: 30)
                    
                    
                    CustomSlider(
                        sliderProgress: $progress,
                        orientation: .horizontal,
                        color: .red,
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
}

#Preview {
    ContentView()
}
