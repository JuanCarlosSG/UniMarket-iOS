//
//  Product.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import Foundation

struct Product: Codable {
    
    let productoId: Int
    let nombre: String
    let tipo: String
    let precio: Float
    let vendidos: Int
    let status: Bool
    let descripcion: String
    let usuarioId: String
    let universidadId: String
    let interesadosId: [String]
    let fecha: Date
    let categorias: String
    
}
