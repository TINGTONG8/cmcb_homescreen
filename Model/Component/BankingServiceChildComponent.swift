//
//  BankingServiceChildComponent.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

struct BankingServiceChildComponent: View {
        var icon: String?
        var title: String?
        var isBorder: Bool = false
        var titleColor: Color = Color.blackColor

        var body: some View {

                VStack {
                        if let icon = icon {
                                ZStack {
                                        if isBorder {
                                                RoundedRectangle(cornerRadius: 28)
                                                        .fill(Color.whiteColor.opacity(0.5))
                                                        .frame(width: 68, height: 68)
                                                        .padding(.bottom, 5)
                                        }
                                        
                                        Image(icon)
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .padding(.bottom, 5)
                                }
                        }

                        if let title = title {
                                Text(title)
                                        .font(.system(size: 13, weight: .medium))
                                        .foregroundColor(titleColor)
                        }
                }
                .padding(.horizontal, 12)
                .padding(.vertical,  8)
        }

}

#Preview {
        BankingServiceChildComponent(icon: "ic_accounts", title: "Account")
}
