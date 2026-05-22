//
//  AccountsScreen.swift
//  homescreen
//
//  Created by Kheangsreng.srun on 19/5/26.
//

import SwiftUI

struct AccountsScreen: View {
    var title: String? = ""
    
    var body: some View {
        BaseMain(
            title: title,
        ) { insets, deviceType in
            HStack {
                Spacer()
                Image("ic_cmcb_bg")
                    .resizable()
                    .frame(width: 300, height: 800)
            }
        }
    }
}
