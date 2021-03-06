//
//  SignupView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct SignupView: View {
    @State var name: String = ""
    @State var major: String = ""
    @State var email: String = ""
    @State var userId: String = ""
    @State var cellphone: String = ""
    @State var password: String = ""
    @State var showAlert: Bool = false
    @State var alertText: String = "Alerta"
    @EnvironmentObject var sVM: SessionViewModel
    var body: some View {
        Group {
            VStack(spacing: 30) {
                Text("UNIMARKET")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(Color("AccentRed"))
                VStack(alignment: .leading, spacing: 30) {
                    Text("Registro")
                        .foregroundColor(Color("AccentGray"))
                        .font(.title3)
                    CustomTextField(placeholder: "Nombre", textValue: self.$name)
                    CustomTextField(placeholder: "Carrera", textValue: self.$major)
                    CustomTextField(placeholder: "Correo", textValue: self.$email)
                        .keyboardType(.emailAddress)
                    CustomTextField(placeholder: "User", textValue: self.$userId)
                    CustomTextField(placeholder: "Teléfono Celular", textValue: self.$cellphone)
                        .keyboardType(.phonePad)
                    CustomTextField(placeholder: "Contraseña", textValue: self.$password)
                }
                CustomButton(text: "Registrarse") {
                    self.register()
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Main"))
        .alert(isPresented: self.$showAlert) {
            Alert(title: Text("Error"), message: Text(self.alertText), dismissButton: .default(Text("Ok")))
        }
    }
    
    func setAlert(message: String) {
        self.alertText = message
        self.showAlert.toggle()
    }
    
    func validateFields() -> Bool {
        return ( self.name != "" && self.major != "" && self.email != "" && self.userId != "" && self.cellphone != "" && self.password != "" )
    }
    
    func register() {
        if self.validateFields() {
            let newUser = User(usuarioId: self.userId, nombre: self.name, carrera: self.major, email: self.email, celular: self.cellphone, constrasena: self.password)
            sVM.singUp(user: newUser) { resp in
                if !resp {
                    self.setAlert(message: "Usuario ya existe")
                }
            }
        } else {
            self.setAlert(message: "Debes llenar todos los campos antes de continuar")
        }
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
