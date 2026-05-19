//
//  FrequentlyUsedComponent.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

struct FrequentlyUsedComponent: View {
        
        var items: [ItemModel] = []
        
        var body: some View {
                VStack(alignment: .leading) {
                        Text("Frequently Used")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.whiteColor)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                        ForEach(items) { item in
                                                BankingServiceChildComponent(
                                                        icon: item.icon,
                                                        title: item.title,
                                                        isBorder: true,
                                                        titleColor: Color.whiteColor
                                                )
                                        }
                                }
                        }
                }
                .padding(12)
                .background(Color.blackColor.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
}

#Preview {
        FrequentlyUsedComponent(
                items: [
                        ItemModel(icon: "ic_accounts", title: "Accounts"),
                        ItemModel(icon: "ic_payments", title: "Payments"),
                        ItemModel(icon: "ic_transfers", title: "Transfers"),
                        ItemModel(icon: "ic_loan", title: "Loan"),
                        ItemModel(icon: "ic_cards", title: "Cards"),
                        ItemModel(icon: "ic_favorites", title: "Favorites"),
                ]
        )
}
