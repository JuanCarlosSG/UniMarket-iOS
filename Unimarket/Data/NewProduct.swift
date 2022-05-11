//
//  NewProduct.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

struct NewProduct: Codable {
    
    let nombre: String
    let tipo: String
    let precio: Int
    let status: Bool
    let descripcion: String
    let usuarioId : String
    let categorias: String
    
}
