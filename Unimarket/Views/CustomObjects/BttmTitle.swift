//
//  BttmTitle.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import SwiftUI

struct BttmTitle: View {
    @Binding var btmSize : CGSize
    var body: some View {
        VStack {
            Spacer()
            Text("UNIMARKET")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(Color("AccentRed"))
                .frame(maxWidth: .infinity)
                .padding(.bottom, edges?.bottom != 0 ? edges?.bottom : 10)
                .background( Material.ultraThinMaterial )
                .mask(
                    GeometryReader { proxy in
                        Rectangle()
                            .onAppear {
                                btmSize = proxy.size
                            }
                    }
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
