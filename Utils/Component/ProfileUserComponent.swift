//
//  ProfileUserComponent.swift
//  homescreen
//

import SwiftUI

struct ProfileUserComponent: View {
    @State private var profileHeight: CGFloat = 0

    let topSafeArea: CGFloat
    @Binding var offsetY: CGFloat

    private var progress: CGFloat {
        max(0.9, min(1.0, 1 + offsetY / 200))
    }

    var body: some View {
        HStack(spacing: 15) {
            Image("ic_nbc")
                .resizable()
                .frame(width: 45, height: 45)

            VStack(alignment: .leading, spacing: 3) {
                Text("La Seavyong")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.whiteColor)
                    .offset(y: progress > 0.9 ? 0 : 10)
                    .frame(height: 25)
                    .animation(.easeInOut(duration: 0.4), value: progress)

                Text("Member since '21")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.whiteColor.opacity(0.7))
                    .frame(height: 18)
                    .opacity(progress > 0.9 ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3), value: progress)
            }

            Spacer()
        }
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear {
                        profileHeight = geo.size.height
                    }
            }
        )
        .scaleEffect(x: progress, y: progress, anchor: UnitPoint.topLeading)
        .offset(y: clampedOffsetY())
    }

    private func clampedOffsetY() -> CGFloat {
        let nudge: CGFloat = 3
        guard topSafeArea > 51 else {
            return max(-profileHeight, offsetY) - nudge
        }
        return max(-(topSafeArea - 5), offsetY) - nudge
    }
}

#Preview {
    ProfileUserComponent(topSafeArea: 59, offsetY: .constant(0))
}
