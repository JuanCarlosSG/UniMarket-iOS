//
//  SellerDetailView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct SellerDetailView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Juan Carlos")
                .font(.title)
                .fontWeight(.bold)
            Text("Ingeniería TI")
            Circle()
                .fill(Color.clear)
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Image("Profile")
                        .resizable()
                        .scaledToFill()
                )
                .clipShape(Circle())
                .frame(maxWidth: screenWidth/1.5)
                .padding()
            Spacer()
            VStack(spacing: 20) {
                Text("Medios de Contacto")
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                Divider()
                SocialMediaButton(text: "WhatsApp Chat", color: "Whatsapp") {
                    
                }
                SocialMediaButton(text: "Mandar Mail", color: "Mail") {
                    
                }
                
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding()
        .navigationBarHidden(false)
    }
}

struct SellerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SellerDetailView()
    }
}
