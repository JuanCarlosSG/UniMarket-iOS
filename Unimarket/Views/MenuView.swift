//
//  MenuView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct MenuView: View {
    var buttons: [String] = ["Mis Publicaciones", "Configuración", "Ayuda", "Cerrar Sesión"]
    var buttonIcons: [String] = ["book.closed.circle", "gearshape.circle", "questionmark.circle", "power.circle"]
    var body: some View {
        VStack(spacing: 20) {
            Image("Profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            Text("Juan Carlos")
                .font(.title)
                .bold()
            CustomButton(text: "Editar Perfil") {
                
            }
            VStack(spacing: 10) {
                ForEach(buttons.indices, id: \.self) { idx in
                    MenuButton(title: buttons[idx], icon: buttonIcons[idx]) {
                        
                    }
                }
            }
            .padding(.horizontal)
            .padding()
            Spacer()
            Text("UNIMARKET")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
                .foregroundColor(Color("AccentRed"))
        }
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
