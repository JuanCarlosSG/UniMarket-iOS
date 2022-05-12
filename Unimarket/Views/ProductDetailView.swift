//
//  ProductDetailView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct ProductDetailView: View {
    @State var showSellerDetailView: Bool = false
    var product: ProductPosted
    var body: some View {
        ZStack {
            NavigationLink(isActive: self.$showSellerDetailView) {
                SellerDetailView(seller: product.usuario)
            } label: { EmptyView() }
            VStack(spacing: 30) {
                Image("Product")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading, spacing: 15) {
                    Text(product.nombre)
                        .bold()
                        .font(.title2)
                    Text("$\(product.precio)")
                        .fontWeight(.bold)
                    Divider()
                    Text("Descripción")
                        .font(.footnote)
                    Text(product.descripcion)
                    Divider()
                }
                .padding(.horizontal)
                CustomButton(text: "Contactar al vendedor") {
                    self.showSellerDetailView.toggle()
                }
                Spacer()
            }
        }
    }
}
