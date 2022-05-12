//
//  LoginView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct LoginView: View {
    var collegeName: String
    @State var user: String = ""
    @State var password : String = ""
    @Binding var showLoginView: Bool
    @State var showSignUpView: Bool = false
    @State var showAlert: Bool = false
    @State var alertText: String = "Alerta"
    @EnvironmentObject var sVM: SessionViewModel
    var body: some View {
        ZStack {
            NavigationLink(isActive: self.$showSignUpView) {
                SignupView()
                    .navigationBarHidden(false)
                    .navigationBarTitleDisplayMode(.inline)
            } label: { EmptyView() }
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
                    CustomTextField(placeholder: "Usuario", textValue: self.$user)
                    CustomTextField(placeholder: "Contraseña", textValue: self.$password)
                }
                CustomButton(text: "Iniciar Sesión") {
                    self.signIn()
                }
                VStack(spacing: 20) {
                    HStack {
                        Text("¿No tienens cuenta?")
                            .foregroundColor(Color("AccentGray"))
                        Button {
                            self.showSignUpView.toggle()
                        } label: {
                            Text("Regístrate")
                                .foregroundColor(Color("AccentRed"))
                        }
                        
                    }
                    Button {
                        self.showLoginView.toggle()
                    } label: {
                        Text("Cambiar de Universidad")
                            .foregroundColor(Color("AccentRed"))
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background( Color("Main") )
        .alert(isPresented: self.$showAlert) {
            Alert(title: Text("Eror"), message: Text(self.alertText), dismissButton: .default(Text("Ok")))
        }
    }
    
    func setAlert(message: String) {
        self.alertText = message
        self.showAlert.toggle()
    }
    
    func validateFields() -> Bool {
        return ( self.user != "" && self.password != "" )
    }
    
    func signIn() {
        if validateFields() {
            sVM.signIn(credentials: UserCredentials(usuarioId: self.user, constrasena: self.password)) { res in
                if !res {
                    self.setAlert(message: "Usuario o Contraseña incorrectos")
                }
            }
        } else {
            self.setAlert(message: "Debes llenar todos los campos antes de continuar")
        }
    }
    
}
