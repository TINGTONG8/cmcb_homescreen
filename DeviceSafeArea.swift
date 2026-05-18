//
//  DeviceSafeArea.swift
//  homescreen
//
//  Created by Kheangsreng.srun on 18/5/26.
//

import SwiftUI

// MARK: - Device Type
enum DeviceType {
    case dynamicIsland    // iPhone 14 Pro and later
    case notch            // iPhone X – iPhone 13
    case homeButton       // iPhone 8 and earlier / SE
}

// MARK: - Detection
extension DeviceType {
    static var current: DeviceType {
        let top = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first?.safeAreaInsets.top ?? 0
        
        if top >= 59 {
            return .dynamicIsland
        } else if top >= 44 {
            return .notch
        } else {
            return .homeButton
        }
    }
}

// MARK: - Extra Padding
extension DeviceType {
    var extraTopPadding: CGFloat {
        switch self {
        case .dynamicIsland: return 50
        case .notch:        return 50
        case .homeButton:    return 80
        }
    }
    
    var extraBottomPadding: CGFloat {
        switch self {
        case .dynamicIsland: return 0
        case .notch:         return 0
        case .homeButton:    return 60
        }
    }
}

// MARK: - SafeAreaReader View
struct SafeAreaReader<Content: View>: View {
    let content: (EdgeInsets, DeviceType) -> Content
    
    @State private var insets: EdgeInsets = .init()
    
    init(@ViewBuilder content: @escaping (EdgeInsets, DeviceType) -> Content) {
        self.content = content
    }
    
    var body: some View {
        content(insets, DeviceType.current)
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            insets = geo.safeAreaInsets
                        }
                }
                .ignoresSafeArea()
            )
    }
}
