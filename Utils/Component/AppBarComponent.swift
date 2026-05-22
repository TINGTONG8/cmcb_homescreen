//
//  AppBarComponent.swift
//  homescreen
//
//  Created by Kheangsreng.srun on 19/5/26.
//

import SwiftUI

struct AppBarComponent: View {
    var title: String?
    var onBack: (() -> Void)?

    var body: some View {
        if let title = title {
            ZStack {
                Button {
                    onBack?()
                } label: {
                    if !title.isEmpty {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.whiteColor)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.whiteColor)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal, 16)
            .frame(height: 56)
        }
    }
}

#Preview {
    VStack {
        // with title → shows appBar
        AppBarComponent(title: "My Profile") {
            print("back tapped")
        }

        // no title → hidden
        AppBarComponent()
    }
}
