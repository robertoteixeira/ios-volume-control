# VolumeControl

An iOS app that demonstrates a customizable volume control slider with interactive visual elements, haptic feedback, and audio volume adjustment capabilities. Built with SwiftUI, this app includes sliders with configurable styles, colors, and orientations to enhance user experience.

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Requirements](#requirements)
- [Setup](#setup)
- [Usage](#usage)
- [Customization](#customization)
- [Acknowledgments](#acknowledgments)

## Features

- **Custom Sliders**: Vertical and horizontal sliders with two styles: continuous and bar-based.
- **Configurable**: Adjustable number of bars, progress levels, and colors.
- **Haptic Feedback**: Provides haptic feedback as you adjust the sliders.
- **Real-time Audio Control**: The sliders control the volume of background music in real time.
- **Error Handling**: Ensures user inputs for progress and bar count are within valid ranges.

## Screenshots

[Include screenshots of the app here to show off the UI and slider interactions.]

## Requirements

- iOS 15.0+
- Xcode 15+
- Swift 5

## Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/VolumeControl.git
   cd VolumeControl

2. **Open the Project in Xcode**

Double-click on VolumeControl.xcodeproj to open the project in Xcode.

3. **Add Background Music (Optional)**

Add an audio file named background_music.mp3 to the Resources folder in the project. This file will play in the background and respond to slider volume adjustments.

4. **Build and Run**

Select an iOS simulator or connect a physical device, then click Run (or press Cmd + R) to build and launch the app.

## Usage
1. Adjust the Volume Slider: Use the sliders to adjust the background music volume. The vertical and horizontal sliders update in real time.

2. Set Custom Bar Count: Enter the number of bars you want in the bar-style slider and click "Set Bars." The app will validate the input to ensure it’s a positive integer.

3. Set Progress: Enter a percentage (0 to 100) to set a specific progress level and click "Set Progress." The app updates the slider to reflect the specified progress.

## Customization
The app includes a CustomSlider SwiftUI component with several configurable properties:

- Slider Orientation: Set the slider orientation to .horizontal or .vertical.
- Slider Style: Choose between .continuous or .bar style.
- Foreground Color: Set the color of the filled portion of the slider.
- Background Color: Set the color of the unfilled portion.
- Number of Bars: Adjust the number of bars for bar-style sliders.
- Enable Haptics: Toggle haptic feedback on or off.
To modify these settings, edit the ContentView where the CustomSlider instances are initialized.

## Acknowledgments
- SwiftUI: For the declarative UI framework.
- AVFoundation: For audio playback.
- UIKit: Used for keyboard dismissal.