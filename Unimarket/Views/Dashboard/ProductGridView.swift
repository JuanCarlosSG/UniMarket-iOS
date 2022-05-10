//
//  ProductGridView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import SwiftUI

struct ProductGridView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(spacing: 20), GridItem(spacing: 20)], spacing: 20) {
                ForEach ((0...5), id: \.self) {_ in
                    ProductCard(name: "Air Force 1", price: "5000", descr: "This is a Nike shoe")
                }
            }
            .padding()
        }
    }
}
