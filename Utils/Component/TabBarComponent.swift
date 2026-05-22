//
//  TabBarComponent.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

struct TabBarComponent: View {
    var items: [ItemModel] = []
    @Binding var selectedTab: Int
    var scanAction: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.tabBarColor)
                .frame(maxWidth: .infinity, maxHeight: 90)
                .overlay(
                    HStack(spacing: 0) {
                        ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                            Button {
                                selectedTab = index
                            } label: {
                                TabBarChildComponent(
                                    icon: item.icon,
                                    title: item.title,
                                    isSelected: selectedTab == index
                                )
                                .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                )

            ZStack {
                RoundedRectangle(cornerRadius: 35)
                    .fill(Color.tabBarColor)
                    .frame(width: 85, height: 85)
                Image("ic_scan")
                    .resizable()
                    .frame(width: 65, height: 65)
            }
            .offset(x: 0, y: -25)
            .onTapGesture {
                scanAction?()
            }
        }
    }
}

#Preview {
    TabBarComponent(
        items: [
            ItemModel(icon: "ic_cmcb", title: "Account"),
            ItemModel(icon: "ic_benefits", title: "Benefits"),
            ItemModel(icon: "", title: ""),
            ItemModel(icon: "ic_withdraw", title: "Withdraw"),
            ItemModel(icon: "ic_support", title: "Support")
        ],
        selectedTab: .constant(0)
    )
}
