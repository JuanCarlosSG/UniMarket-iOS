//
//  CustomButton.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.headline)
                .foregroundColor(.white)
                .padding(15)
                .background(
                
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color("Buttons"))
                
                )
        }

    }
}
