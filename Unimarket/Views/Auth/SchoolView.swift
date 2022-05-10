//
//  SchoolView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct SchoolView: View {
    @State var showCollegeList: Bool = false
    @State var selectedCollge: String = ""
    @State var showLoginView : Bool = false
    var schools: [String] = ["", "Universidad Panamericana", "Tec CSF", "ITAM", "Anáhuac"]
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationLink(isActive: self.$showLoginView) {
                LoginView(collegeName: self.selectedCollge, showLoginView: self.$showLoginView)
                    .navigationBarHidden(true)
                
            } label: { EmptyView() }
            VStack(spacing: 5) {
                Spacer()
                Text("Bienvenido a")
                    .foregroundColor(Color("AccentRed"))
                Text("UNIMARKET")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AccentRed"))
                VStack(spacing: 20) {
                    Text("Escoge la universidad a la que perteneces")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("AccentGray"))
                        .frame(maxWidth: screenWidth/1.2)
                    Button {
                        withAnimation {
                            self.showCollegeList.toggle()
                        }
                    } label: {
                        HStack {
                            Text(self.selectedCollge == "" ? "Universidad" : "\(self.selectedCollge)")
                                .foregroundColor(self.selectedCollge == "" ? .gray : .black)
                                .padding()
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .background(
                    
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                    
                    )
                    .padding(.horizontal)
                    if selectedCollge != "" {
                        CustomButton(text: "Continuar") {
                            self.showLoginView.toggle()
                        }
                    }

                }
                .frame(maxHeight: screenHeight/2)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Main"))
            CustomPicker(options: self.schools, showPicker: self.$showCollegeList, selectedOption: self.$selectedCollge)
        }
    }
}

struct SchoolView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolView()
    }
}
