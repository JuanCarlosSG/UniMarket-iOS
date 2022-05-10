//
//  ProductCard.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct ProductCard: View {
    var name: String
    var price: String
    var descr: String
    var body: some View {
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
                Text(name)
                    .fontWeight(.bold)
                Text("$\(price)")
                Text(descr)
                    .multilineTextAlignment(.leading)
            }
            .padding(10)
            
        }
        .frame(maxWidth: .infinity)
        .background(Color(.lightGray).shadow(color: Color(.lightGray), radius: 5, x: 0, y: 0))
        
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(name: "Air Force 1", price: "5000", descr: "This is a Nike show")
            .previewLayout(.sizeThatFits)
    }
}
