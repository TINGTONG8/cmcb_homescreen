//
//  BenefitsScreen.swift
//  homescreen
//
//  Created by Kheangsreng.srun on 22/5/26.
//

import SwiftUI

struct BenefitsScreen: View {
    var body: some View {
        BaseMain { insets, deviceType in
            HStack {
                Spacer()
                Image("ic_cmcb_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 800)
            }
            Text("Benefits")
        }
    }
}
