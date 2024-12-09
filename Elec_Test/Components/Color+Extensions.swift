//
//  ColorExtensions.swift
//  Elec_Test
//
//  Created by Vlad Sobchuk on 09/12/2024.
//

import SwiftUI

extension Color {

    init(hex: UInt32) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        let alpha = Double((hex >> 24) & 0xFF) / 255.0
        self = Color(red: red, green: green, blue: blue, opacity: alpha)
    }

}
