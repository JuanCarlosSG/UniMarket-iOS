//
//  LoginView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct LoginView: View {
    var collegeName: String = "Universidad Panamericana"
    @State var email: String = ""
    @State var password : String = ""
    var body: some View {
        Group {
            VStack(spacing: 50) {
                VStack(spacing: 30) {
                    Text("UNIMARKET")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                    Text(collegeName)
                        .font(.title2)
                        .fontWeight(.light)
                }
                .foregroundColor(Color("AccentRed"))
                VStack(alignment: .leading,spacing: 20) {
                    Text("Inicia Sesión")
                        .foregroundColor(Color("AccentGray"))
                        .font(.title3)
                    CustomTextField(placeholder: "Correo", textValue: self.$email)
                    CustomTextField(placeholder: "Contraseña", textValue: self.$password)
                }
                CustomButton(text: "Iniciar Sesión") { }
                VStack(spacing: 20) {
                    HStack {
                        Text("¿No tienens cuenta?")
                            .foregroundColor(Color("AccentGray"))
                        Button {
                            
                        } label: {
                            Text("Regístrate")
                                .foregroundColor(Color("AccentRed"))
                        }
                        
                    }
                    Text("Cambiar de Universidad")
                        .foregroundColor(Color("AccentRed"))
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background( Color("Main") )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
