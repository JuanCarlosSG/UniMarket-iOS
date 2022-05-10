//
//  FilterView.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import SwiftUI

struct FilterView: View {
    var filters: [String] = ["Todo", "Arte", "Hogar", "Deporte", "Calzado"]
    @State var filterSelected: String = "Todo"
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(filters, id: \.self) { filter in
                    Button {
                        if self.filterSelected != filter {
                            withAnimation {
                                self.filterSelected = filter
                            }
                        }
                    } label: {
                        Text(filter)
                            .bold()
                            .opacity(filterSelected != filter ? 0.5 : 1)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color(filterSelected == filter ? "Buttons" : "Main"))
                            )
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        .padding(.bottom, 10)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
            .previewLayout(.sizeThatFits)
    }
}
