//
//  UserAccountBannerComponent.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 16/5/26.
//

import SwiftUI

struct UserAccountBannerComponent: View {

        var body: some View {

                VStack {
                        HStack(spacing: 10) {
                                Image("ic_bank")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                
                                Text("Seavyong’s account")
                                        .font(.system(size: 20, weight: .regular))
                                        .foregroundColor(.blackColor)
                                        .lineLimit(1)
                                        .fixedSize()
                                
                                Text("100088979")
                                        .font(.system(size: 20, weight: .regular))
                                        .foregroundColor(.blackColor)
                                        .lineLimit(1)
                                        .truncationMode(.head)
                                
                                StatusComponent(title: "Default")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack(spacing: 15) {
                                Text("$1168.00")
                                        .font(.system(size: 25, weight: .semibold))
                                        .foregroundColor(.blackColor)
                                
                                Image("ic_close_eye")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                
                                Spacer()
                        }
                        HStack {
                                Spacer()
                                QuickBankingComponent(
                                        titleColor: .primaryColor, bgColor: .primaryContainerColor,
                                        items: [
                                               ItemModel(icon: "ic_pay_and_tranfer", title: "Pay & Transfer")
                                       ]
                                ).fixedSize()
                        }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(
                        RoundedRectangle(cornerRadius: 20)
                                .fill(Color.whiteColor)
                )
        }

}

#Preview {
        UserAccountBannerComponent()
}
