//
//  ProductResponse.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import Foundation

typealias ProductResponse = [ProductPosted]

struct ProductPosted: Decodable, Hashable {
    
    static func == (lhs: ProductPosted, rhs: ProductPosted) -> Bool {
        let areEqual = lhs.productoId == rhs.productoId &&
        lhs.nombre == rhs.nombre
        return areEqual
    }
    
    
    let productoId: Double
    let nombre: String
    let tipo: String
    let precio: Int
    let vendidos: Int
    let status: Bool
    let descripcion: String
    let usuarioId: String
    let universidadId: String
    let interesadosId: [String]?
    let fecha: String
    let categorias: String
    let usuario: User
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(productoId)
    }
    
}
