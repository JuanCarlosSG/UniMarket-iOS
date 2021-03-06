//
//  MainView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var sVM: SessionViewModel
    var body: some View {
        if sVM.session != nil {
            withAnimation {
                DashboardView()
                    .environmentObject(ProductsViewModel())
            }
        } else {
            withAnimation {
                AuthView()
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
