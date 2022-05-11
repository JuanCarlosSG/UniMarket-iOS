//
//  ProductGridView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import SwiftUI

struct ProductGridView: View {
    @State var showProductDetailView: Bool = false
    @EnvironmentObject var pVM: ProductsViewModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(spacing: 20), GridItem(spacing: 20)], spacing: 20) {
                ForEach (pVM.products, id: \.self) { product in
                    ProductCard(product: product)
                }
            }
            .padding()
        }
        .onAppear {
            pVM.getProducts()
        }
    }
}

struct ProductGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGridView()
    }
}
