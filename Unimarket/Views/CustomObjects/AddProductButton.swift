//
//  AddProductButton.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import SwiftUI

struct AddProductButton: View {
    var action : () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .padding()
                .background(
                    Circle()
                        .foregroundColor(Color("RedButton"))
                        .shadow(color: Color(.lightGray), radius: 5, x: 0, y: 0)
                )
        }
    }
}
