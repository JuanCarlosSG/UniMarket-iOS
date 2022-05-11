//
//  ProductCard.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct ProductCard: View {
    @State var showProductDetailView: Bool = false
    var product: ProductPosted
    var body: some View {
        ZStack {
            NavigationLink(isActive: self.$showProductDetailView) {
                ProductDetailView(product: self.product)
            } label: { EmptyView() }
            Button {
                self.showProductDetailView.toggle()
            } label: {
                VStack(alignment: .leading, spacing: 0) {
                    Rectangle()
                        .fill(Color.clear)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(
                            Image("Product")
                                .resizable()
                                .scaledToFill()
                        )
                        .clipShape(Rectangle())
                    VStack(alignment: .leading, spacing: 5) {
                        Text(product.nombre)
                            .fontWeight(.bold)
                        Text("$\(product.precio)")
                        Text(product.descripcion)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                    }
                    .padding(10)
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color(.lightGray).shadow(color: Color(.lightGray), radius: 5, x: 0, y: 0))
            }
        }
        
    }
}
