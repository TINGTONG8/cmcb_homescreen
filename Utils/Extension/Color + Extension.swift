//
//  Color + Extension.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

// MARK: - Color + Hex

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
                     .replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8)  & 0xFF) / 255
        let b = Double( rgb        & 0xFF) / 255

        self.init(.sRGB, red: r, green: g, blue: b, opacity: 1)
    }
}


// MARK: - App Colors

extension Color {

    private static var currentSystemColor: Bool {
        UITraitCollection.current.userInterfaceStyle == .light
    }
        
        static var primaryColor:  Color { currentSystemColor ? Color(hex: "#139D61") : Color(hex: "#094E31") }
        static var whiteColor:  Color { currentSystemColor ? Color(hex: "#FFFFFF") : Color(hex: "#FFFFFF") }
        static var blackColor:  Color { currentSystemColor ? Color(hex: "#000000") : Color(hex: "#000000") }
        static var primaryContainerColor:  Color { currentSystemColor ? Color(hex: "#D4F7E1") : Color(hex: "#D4F7E1") }
        static var tabBarColor:  Color { currentSystemColor ? Color(hex: "#B8E1CF") : Color(hex: "#B8E1CF") }
        static var grayColor:  Color { currentSystemColor ? Color(hex: "#727272") : Color(hex: "#727272") }
}
