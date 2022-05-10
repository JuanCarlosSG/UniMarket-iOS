//
//  ProductGridView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import SwiftUI

struct ProductGridView: View {
    @State var showProductDetailView: Bool = false
    var body: some View {
        ScrollView(showsIndicators: false) {
            NavigationLink(isActive: self.$showProductDetailView) {
                ProductDetailView()
            } label: { EmptyView() }
            LazyVGrid(columns: [GridItem(spacing: 20), GridItem(spacing: 20)], spacing: 20) {
                ForEach ((0...5), id: \.self) {_ in
                    ProductCard(name: "Air Force 1", price: "5000", descr: "This is a Nike shoe") {
                        self.showProductDetailView.toggle()
                    }
                }
            }
            .padding()
        }
    }
}

struct ProductGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductGridView()
    }
}
