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
    @State var showProductsView : Bool = false
    @State var showSettingsView : Bool = false
    @State var showHelpView : Bool = false
    @EnvironmentObject var sVM: SessionViewModel
    var body: some View {
        ZStack {
            NavigationLink(isActive: self.$showProductsView) {
                ProductsView()
            } label: { EmptyView() }
            NavigationLink(isActive: self.$showSettingsView) {
                SettingsView()
            } label: { EmptyView() }
            NavigationLink(isActive: self.$showHelpView) {
                HelpView()
            } label: { EmptyView() }
            VStack(spacing: 20) {
                Image("Profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                Text(sVM.session?.nombre ?? "Nombre")
                    .font(.title)
                    .bold()
                CustomButton(text: "Editar Perfil") {
                    
                }
                VStack(spacing: 10) {
                    ForEach(buttons.indices, id: \.self) { idx in
                        MenuButton(title: buttons[idx], icon: buttonIcons[idx]) {
                            self.actionMenuButton(entry: buttons[idx])
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
        }
        .navigationBarHidden(false)
    }
    
    func actionMenuButton(entry: String) {
        switch entry {
        case "Mis Publicaciones":
            self.showProductsView.toggle()
        case "Configuración":
            self.showSettingsView.toggle()
        case "Ayuda":
            self.showHelpView.toggle()
        default:
            print("Closed Sesion")
            sVM.signOut()
        }
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
