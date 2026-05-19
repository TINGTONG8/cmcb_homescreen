//
//  TabBarComponent.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

struct TabBarComponent: View {

        var items: [ItemModel] = []

        var body: some View {
                ZStack {
                        Rectangle()
                                .fill(Color.tabBarColor)
                                .frame(maxWidth: .infinity, maxHeight: 90)
                                .overlay (
                                        HStack(spacing: 0) {
                                                ForEach(items) { item in
                                                        TabBarChildComponent(icon: item.icon, title: item.title)
                                                                .frame(maxWidth: .infinity)
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
                ]
        )
}
