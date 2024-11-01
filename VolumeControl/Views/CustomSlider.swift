//
//  CustomSlider.swift
//  VolumeControl
//
//  Created by Roberto Teixeira on 31/10/2024.
//

import SwiftUI

struct CustomSlider: View {
    @Binding var sliderProgress: CGFloat
    
    var orientation: SliderOrientation
    var color: Color
    var style: SliderStyle = .continuous
    
    @State private var progress: CGFloat = .zero
    @State private var dragOffset: CGFloat = .zero
    @State private var lastDragOffset: CGFloat = .zero
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let orientationSize = orientation == .horizontal ? size.width : size.height
            
            Group {
                if style == .continuous {
                    // Continuous style
                    ZStack(alignment: orientation == .horizontal ? .leading : .bottom) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                        
                        Rectangle()
                            .fill(color)
                            .frame(
                                width: orientation == .horizontal ? progress * orientationSize : nil,
                                height: orientation == .vertical ? progress * orientationSize : nil
                            )
                    }
                    .cornerRadius(15)
                } else {
                    // Bar style
                    if orientation == .horizontal {
                        HStack(spacing: 2) {
                            ForEach(0..<10, id: \.self) { index in
                                let barThreshold = CGFloat(index + 1) / 10
                                
                                Rectangle()
                                    .fill(progress >= barThreshold ? color : Color.gray.opacity(0.3))
                                    .frame(width: size.width / 10 - 2, height: size.height)
                                    .cornerRadius(4)
                            }
                        }
                    } else {
                        VStack(spacing: 2) {
                            ForEach((0..<10).reversed(), id: \.self) { index in
                                let barThreshold = CGFloat(index + 1) / 10
                                
                                Rectangle()
                                    .fill(progress >= barThreshold ? color : Color.gray.opacity(0.3))
                                    .frame(width: size.width, height: size.height / 10 - 2)
                                    .cornerRadius(4)
                            }
                        }
                    }
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged {
                        let translation = $0.translation
                        let movement = (orientation == .horizontal ? translation.width : -translation.height) + lastDragOffset
                        dragOffset = max(0, min(movement, orientationSize))
                        calculateProgress(orientationSize: orientationSize)
                    }
                    .onEnded { _ in
                        withAnimation(.smooth) {
                            dragOffset = max(0, min(dragOffset, orientationSize))
                            calculateProgress(orientationSize: orientationSize)
                        }
                        lastDragOffset = dragOffset
                    }
            )
            .frame(
                maxWidth: size.width,
                maxHeight: size.height,
                alignment: orientation == .vertical ? .bottom : .leading
            )
            .onChange(of: sliderProgress, initial: true) { oldValue, newValue in
                if sliderProgress != progress {
                    progress = max(min(sliderProgress, 1.0), .zero)
                    dragOffset = progress * orientationSize
                    lastDragOffset = dragOffset
                }
            }
            .onChange(of: orientation) { oldValue, newValue in
                sliderProgress = max(min(progress, 1.0), .zero)
            }
        }
        .onChange(of: progress) { oldValue, newValue in
            sliderProgress = max(min(progress, 1.0), .zero)
        }
    }
    
    private func calculateProgress(orientationSize: CGFloat) {
        let clampedOffset = max(0, min(dragOffset, orientationSize))
        var newProgress = clampedOffset / orientationSize
        
        if newProgress > 0.99 {
            newProgress = 1.0
        }
        
        self.progress = clampedOffset / orientationSize
    }
    
    enum SliderOrientation {
        case vertical
        case horizontal
    }
    
    enum SliderStyle {
        case continuous
        case bar
    }
}

#Preview {
    ContentView()
}
