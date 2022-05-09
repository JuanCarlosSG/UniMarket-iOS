//
//  CustomPicker.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct CustomPicker: View {
    var options : [String]
    @Binding var showPicker : Bool
    @Binding var selectedOption : String
    @State var offset : CGFloat = 0
    var body: some View {
        ZStack (alignment: .bottom) {
            if self.showPicker {
                Color(.black).opacity(0.4)
                    .onTapGesture {
                        withAnimation {
                            self.showPicker.toggle()
                        }
                    }
                    .ignoresSafeArea(.all)
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showPicker.toggle()
                        }
                    }) {
                        Text("Listo")
                            .font(.title3)
                            .foregroundColor(Color("AccentRed"))
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                Divider()
                Picker("", selection: self.$selectedOption) {
                    ForEach(options, id: \.self) { option in
                        Text(option == "" ? "[Selecciona una opción]" : "\(option)")
                    }
                }
                .pickerStyle(.wheel)
            }
            .background(Color(.white).clipShape(CustomCorner(corners: [.topLeft,.topRight], cornerRadius: 28)).ignoresSafeArea(edges: .bottom).shadow(radius: 10))
            .offset(y: offset)
            .offset(y: showPicker ? 0 : screenHeight)
        }
    }
}

struct CustomCorner: Shape {

    var corners : UIRectCorner
    
    var cornerRadius : CGFloat

    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
        
}
