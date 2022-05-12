//
//  ProductsView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct ProductsView: View {
    @State private var btmSize : CGSize = .zero
    @EnvironmentObject var pVM: ProductsViewModel
    @EnvironmentObject var sVM: SessionViewModel
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    VStack(spacing: 20) {
                        ForEach (pVM.products.filter{ $0.usuarioId == sVM.session!.usuarioId }, id: \.self) { product in
                            ProductPostCard(title: product.nombre, date: getDate(dateL: product.fecha)) {
                                
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
     
    func getDate(dateL: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from:dateL)
        dateFormatter.dateFormat = "dd/LLLL/yyyy"
        let stringDate = dateFormatter.string(from: date!)
        return "\(stringDate)"
    }
    
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
