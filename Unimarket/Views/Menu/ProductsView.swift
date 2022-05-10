//
//  ProductsView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct ProductsView: View {
    @State private var btmSize : CGSize = .zero
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    VStack(spacing: 20) {
                        ForEach ((0...5), id: \.self) {_ in
                            ProductPostCard(title: "Air Force 1", date: "10 Mayo 2022") {
                                
                            }
                        }
                    }
                    Spacer(minLength: btmSize.height)
                }
                .padding(.top)
            }
            BttmTitle(btmSize: self.$btmSize)
        }
        .navigationTitle("Mis publicaciones")
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
