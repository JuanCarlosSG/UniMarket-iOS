//
//  MenuButton.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import SwiftUI

struct MenuButton: View {
    var title: String
    var icon: String
    var action : () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 30, weight: .semibold))
                    .padding(.trailing)
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
        }
        .padding()
    }
}
