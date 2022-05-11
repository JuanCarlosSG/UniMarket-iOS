//
//  SettingsView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Spacer()
            CustomButton(text: "Borrar cuenta") { }
            Spacer()
            Text("UNIMARKET")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
                .foregroundColor(Color("AccentRed"))
        }
        .navigationTitle("Configuración")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
