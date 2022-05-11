//
//  HelpView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            CustomButton(text: "Reportar un problema") { }
            CustomButton(text: "Enviar comentarios") { }
            Spacer()
            Text("UNIMARKET")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
                .foregroundColor(Color("AccentRed"))
        }
        .navigationTitle("Ayuda")
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
