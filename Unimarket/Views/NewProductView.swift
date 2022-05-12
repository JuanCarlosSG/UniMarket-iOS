//
//  NewProductView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct NewProductView: View {
    var action: () -> Void
    @State var title: String = ""
    @State var type: String = ""
    @State var price: String = ""
    @State var desc: String = ""
    @State var categories: String = ""
    @State var showAlert: Bool = false
    @State var alertText: String = "Alerta"
    @EnvironmentObject var pVM: ProductsViewModel
    @EnvironmentObject var sVM: SessionViewModel
    var body: some View {
        Group {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Button {
                        action()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 22).bold())
                    }

                }
                Text("Agregar un producto")
                    .foregroundColor(Color("AccentGray"))
                    .font(.title3)
                    .padding(.bottom)
                
                CustomTextField(placeholder: "Título", textValue: self.$title)
                CustomTextField(placeholder: "Tipo", textValue: self.$type)
                CustomTextField(placeholder: "Precio", textValue: self.$price)
                    .keyboardType(.numberPad)
                CustomTextField(placeholder: "Descripción", textValue: self.$desc)
                CustomTextField(placeholder: "Categorías", textValue: self.$categories)
                CustomButton(text: "Subir producto") {
                    self.addProduct()
                }
                .frame(maxWidth: .infinity)
                .padding()
                Spacer()
            }
            .padding()
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
        return (self.title != "" && self.type != "" && self.price != "" && self.desc != "" && self.categories != "" )
    }
    
    func addProduct() {
        
        if self.validateFields() {
            let np = NewProduct(nombre: self.title, tipo: self.type, precio: Int(self.price)!, status: true, descripcion: self.desc, usuarioId: sVM.session!.usuarioId, categorias: self.categories)
            pVM.addProduct(newProduct: np) { resp in
                if resp {
                    pVM.getProducts()
                    action()
                } else {
                    self.setAlert(message: "Error al cargar producto")
                }
            }
        } else {
            self.setAlert(message: "Debes llenar todos los campos antes de continuar")
        }
        
    }
}
