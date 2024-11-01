//
//  UIApplication+Extensions.swift
//  VolumeControl
//
//  Created by Roberto Teixeira on 01/11/2024.
//

import UIKit

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
