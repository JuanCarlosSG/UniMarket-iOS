//
//  AuthView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 09/05/22.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        NavigationView {
            SchoolView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
