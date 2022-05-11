//
//  DashboardView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct DashboardView: View {
    @State var showNewProductView: Bool = false
    @State var showMenuView: Bool = false
    @EnvironmentObject var pVM: ProductsViewModel
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                NavigationLink(isActive: self.$showMenuView) {
                    MenuView()
                    
                } label: { EmptyView() }
                VStack {
                    TopBarView {
                        self.showMenuView.toggle()
                    }
                    FilterView()
                    ProductGridView()
                }
                AddProductButton {
                    self.showNewProductView.toggle()
                }
            }
            .sheet(isPresented: self.$showNewProductView) {
                NewProductView {
                    self.showNewProductView.toggle()
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
