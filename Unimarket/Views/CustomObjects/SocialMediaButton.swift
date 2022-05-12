//
//  SocialMediaButton.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import SwiftUI

struct SocialMediaButton: View {
    var text: String
    var color: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(15)
                .frame(maxWidth: screenWidth/2)
                .background(
                
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(color))
                
                )
        }

    }
}
