//
//  TabBarChildComponent.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

struct TabBarChildComponent: View {
    var icon: String?
    var title: String?
    var titleColor: Color = Color.grayColor
    var isSelected: Bool = false

    var body: some View {
        VStack {
            if let icon = icon {
                Image(icon)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.bottom, 5)
                    .colorMultiply(isSelected ? Color.primaryColor : Color.gray)
            }

            if let title = title {
                Text(title)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(isSelected ? Color.primaryColor : Color.gray)
                    .lineLimit(1)
                    .fixedSize()
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical,  8)
        .padding(.bottom, 15)
    }
}

#Preview {
    HStack {
        TabBarChildComponent(icon: "ic_cmcb", title: "Account", isSelected: true)
        TabBarChildComponent(icon: "ic_benefits", title: "Benefits", isSelected: true)
        TabBarChildComponent(icon: "ic_cmcb", title: "Account", isSelected: true)
        TabBarChildComponent(icon: "ic_benefits", title: "Benefits", isSelected: false)
    }
}
