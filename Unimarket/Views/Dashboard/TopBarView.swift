//
//  TopBarView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import SwiftUI

struct TopBarView: View {
    var action: () -> Void
    var body: some View {
        HStack {
            Text("UNIMARKET")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Button {
                action()
            } label: {
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(.black)
                    .font(.system(size: 30).bold())
            }
        }
        .padding()
    }
}
