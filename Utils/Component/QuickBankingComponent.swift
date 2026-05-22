//
//  QuickBankingComponent.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

struct QuickBankingComponent: View {
    var titleColor: Color = Color.whiteColor
    var bgColor: Color = Color.blackColor
    var items: [ItemModel] = []

    var body: some View {
        HStack(spacing: 8) {
            ForEach(items) { item in
                HStack(spacing: 6) {
                    if !item.icon.isEmpty {
                        Image(item.icon)
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                    if !item.title.isEmpty {
                        Text(item.title)
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(titleColor)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(bgColor.opacity(0.5))
                )
            }
        }
    }
}

#Preview {
    QuickBankingComponent(
        items: [
           ItemModel(icon: "ic_plus", title: "Quick Banking"),
           ItemModel(icon: "", title: "Accounts"),
           ItemModel(icon: "", title: "Transfers"),
           ItemModel(icon: "", title: "Loan"),
           ItemModel(icon: "", title: "Cards"),
       ]
    )
}
