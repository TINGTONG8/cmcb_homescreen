//
//  AppTabView.swift
//  homescreen
//
//  Created by Kheangsreng.srun on 22/5/26.
//

import SwiftUI

struct AppTabView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case 0: HomeScreen()
                case 1: BenefitsScreen()
                case 3: WithdrawScreen()
                case 4: SupportScreen()
                default: HomeScreen()
                }
            }
            SafeAreaReader { insets, deviceType in
                TabBarComponent(
                    items: [
                        ItemModel(icon: "ic_cmcb",     title: "Account"),
                        ItemModel(icon: "ic_benefits",  title: "Benefits"),
                        ItemModel(icon: "",             title: ""),
                        ItemModel(icon: "ic_withdraw",  title: "Withdraw"),
                        ItemModel(icon: "ic_support",   title: "Support")
                    ],
                    selectedTab: $selectedTab,
                    scanAction: {
                        Navigator.shared.push(to: AccountsScreen(title: "Scan QR"))
                    }
                )
                .padding(.bottom, deviceType.extraBottomPadding)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .ignoresSafeArea()
    }
}
