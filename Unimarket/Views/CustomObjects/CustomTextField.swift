//
//  CustomTextField.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 08/05/22.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var textValue: String
    var body: some View {
        TextField(placeholder, text: self.$textValue)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
            )
    }
}
