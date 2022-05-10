//
//  ProductDetailView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct ProductDetailView: View {
    @State var showSellerDetailView: Bool = false
    var body: some View {
        ZStack {
            NavigationLink(isActive: self.$showSellerDetailView) {
                SellerDetailView()
            } label: { EmptyView() }
            VStack(spacing: 30) {
                Image("Product")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading, spacing: 15) {
                    Text("Air Force 1")
                        .bold()
                        .font(.title2)
                    Text("$5000")
                        .fontWeight(.bold)
                    Divider()
                    Text("Descripción")
                        .font(.footnote)
                    Text("This is a Nike Shoe")
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

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
