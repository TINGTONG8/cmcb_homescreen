//
//  BankingServiceComponent.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

struct BankingServiceComponent: View {
    var title: String?
    var titleColor: Color = Color.whiteColor
    var bgColor: Color = Color.blackColor
    var items: [ItemModel] = []
    var extraItems: [ItemModel] = []
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(spacing: 0) {
            if let title = title {
                HStack {
                    Text(title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(titleColor)
                    Spacer()
                }
                .padding(.leading, 22)
                .padding(.vertical, 6)
                .padding(.bottom, 6)
            }

            LazyVGrid(columns: columns, spacing: 6) {
                ForEach(items) { item in
                    Button {
                        item.action?()  
                    } label: {
                        BankingServiceChildComponent(
                            icon: item.icon,
                            title: item.title
                        )
                    }
                }
            }
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.whiteColor)
            )

            if !extraItems.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(extraItems) { item in
                            Button {
                                item.action?()
                            } label: {
                                BankingServiceExtraChildComponent(
                                    icon: item.icon,
                                    title: item.title
                                )
                            }
                        }
                    }
                }
                .padding(.vertical, 8)
                .padding(.top, 8)
           }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(bgColor)
                .opacity(0.5)
        )
    }
}

#Preview {
    BankingServiceComponent(
        title: "Banking Service",
        bgColor: Color.black,
        items: [
            ItemModel(icon: "ic_accounts", title: "Accounts"),
            ItemModel(icon: "ic_payments", title: "Payments"),
            ItemModel(icon: "ic_transfers", title: "Transfers"),
            ItemModel(icon: "ic_loan", title: "Loan"),
            ItemModel(icon: "ic_cards", title: "Cards"),
            ItemModel(icon: "ic_favorites", title: "Favorites"),
        ],
        extraItems: [
            ItemModel(icon: "ic_schedule", title: "Schedule"),
            ItemModel(icon: "ic_exchange_rate", title: "Exchange Rate"),
            ItemModel(icon: "ic_locator", title: "Locator"),
        ]
    )
    .padding(16)
}
