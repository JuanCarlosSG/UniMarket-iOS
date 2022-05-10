//
//  ProductPostCard.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import SwiftUI

struct ProductPostCard: View {
    var title: String
    var date: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 10) {
                HStack {
                    Text(title)
                        .font(.title3)
                        .foregroundColor(.black)
                        .bold()
                        .padding(.leading)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text(date)
                        .foregroundColor(.black)
                        .padding(.trailing)
                }
            }
            .padding()
            .frame(maxWidth: screenWidth/1.2)
            .background(
                
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("Buttons").opacity(0.7))
                
            )
        }
        
    }
}
