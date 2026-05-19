//
//  homescreenApp.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

struct homescreenApp: View {
    @State private var scrollOffsetY: CGFloat = 0
    @State private var scrollAnchorY: CGFloat? = nil
    @State private var topSafeArea: CGFloat = 0

    var body: some View {
        SafeAreaReader { insets, deviceType in
            ZStack {
                Color.primaryColor.ignoresSafeArea()

                HStack {
                    Spacer()
                    Image("ic_cmcb_bg")
                        .resizable()
                        .frame(width: 300, height: 800)
                }

                VStack(spacing: 0) {
                    HStack(spacing: 15) {
                        Spacer()
                        Button {
                            Navigator.shared.push(to: homescreenApp())
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.whiteColor).opacity(0.2)
                                    .frame(width: 40, height: 40)
                                Image("ic_notification")
                                    .resizable()
                                    .frame(width: 23, height: 25)
                                Image("ic_notification_alert")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .offset(x: 7, y: -7)
                            }
                        }
                        Button { } label: {
                            Image("ic_nbc")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding(.bottom, 8)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            Spacer().frame(height: 60)

                            QuickBankingComponent(
                                items: [
                                    ItemModel(icon: "ic_plus", title: "Quick Banking"),
                                    ItemModel(icon: "", title: "Accounts"),
                                    ItemModel(icon: "", title: "Transfers"),
                                    ItemModel(icon: "", title: "Loan"),
                                    ItemModel(icon: "", title: "Cards"),
                                ]
                            )
                            .padding(.vertical, 12)

                            UserAccountBannerComponent()

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
                            .padding(.vertical, 12)

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

                            Spacer().frame(height: 110 + deviceType.extraBottomPadding)
                        }
                        .background(
                            GeometryReader { geo -> Color in
                                let minY = geo.frame(in: .global).minY
                                DispatchQueue.main.async {
                                    if scrollAnchorY == nil {
                                        scrollAnchorY = minY
                                    }
                                    scrollOffsetY = minY - (scrollAnchorY ?? minY)
                                }
                                return Color.clear
                            }
                        )
                    }
                    .overlay(
                        ProfileUserComponent(
                            topSafeArea: topSafeArea,
                            offsetY: $scrollOffsetY
                        ),
                        alignment: .topLeading
                    )
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 15)
                .padding(.top, insets.top + deviceType.extraTopPadding)
                .ignoresSafeArea()
                .onAppear {
                    topSafeArea = insets.top
                }

                TabBarComponent(
                    items: [
                        ItemModel(icon: "ic_cmcb", title: "Account"),
                        ItemModel(icon: "ic_benefits", title: "Benefits"),
                        ItemModel(icon: "", title: ""),
                        ItemModel(icon: "ic_withdraw", title: "Withdraw"),
                        ItemModel(icon: "ic_support", title: "Support")
                    ]
                )
                .padding(.bottom, deviceType.extraBottomPadding)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
    }
}

#Preview {
    homescreenApp()
}
