//
//  SellerDetailView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct SellerDetailView: View {
    var seller : User
    var body: some View {
        VStack(spacing: 10) {
            Text(seller.nombre)
                .font(.title)
                .fontWeight(.bold)
            Text(seller.carrera)
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
                    let email = seller.email
                    if let url = URL(string: "mailto:\(email)") {
                      if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url)
                      } else {
                        UIApplication.shared.openURL(url)
                      }
                    }
                }
                
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding()
        .navigationBarHidden(false)
    }
}
