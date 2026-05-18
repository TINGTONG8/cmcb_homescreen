//
//  StatusComponent.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

struct StatusComponent: View {
    var title: String?
    var titleColor: Color = Color.primaryColor
    var bgColor: Color = Color.primaryContainerColor

    var body: some View {
        HStack {
            if let title = title {
                Text(title)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(titleColor)
                    .lineLimit(1)
                    .fixedSize()
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical,6)
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .fill(bgColor)
                .opacity(0.5)
        )
    }
}

#Preview {
    StatusComponent(title: "Default")
}
