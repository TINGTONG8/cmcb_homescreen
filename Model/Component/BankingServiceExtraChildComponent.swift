//
//  BankingServiceExtraChildComponent.swift
//  homescreen
//
//  Created by Srun Kheangsreng on 17/5/26.
//

import SwiftUI

struct BankingServiceExtraChildComponent: View {
        var icon: String?
        var title: String?
        var titleColor: Color = Color.blackColor

        var body: some View {

                HStack(spacing: 8) {
                        if let icon = icon {
                                Image(icon)
                                        .resizable()
                                        .frame(width: 25, height: 25)
                        }

                        if let title = title {
                                Text(title)
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundColor(titleColor)
                        }
                }
                .padding(12)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }

}

#Preview {
        BankingServiceExtraChildComponent(icon: "ic_schedule", title: "Schedule")
}
