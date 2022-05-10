//
//  DashboardView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                TopBarView()
                FilterView()
                    .padding(.bottom, 10)
                ProductGridView()
            }
            AddProductButton {
                
            }
            .padding()
        }
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
