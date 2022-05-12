//
//  ProductsViewModel.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 10/05/22.
//

import Foundation

class ProductsViewModel: ObservableObject {
    
    @Published var products: [ProductPosted] = []
    
    func getProducts() {
        
        guard let url = URL(string: "http://192.168.1.71:3000/posts") else {fatalError()}
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, resp, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else {
                print("No hubo datos")
                return
            }
            
            do {
                
                let finalResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                DispatchQueue.main.async {
                    self.products =  finalResponse
                }
                
            } catch let jerror {
                print(jerror)
            }
            
        }
        dataTask.resume()
        
    }
    
    func addProduct(newProduct: NewProduct, completion: @escaping (Bool) -> () ) {
        
        guard let url = URL(string: "http://192.168.1.71:3000/posts") else {fatalError()}
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try! JSONEncoder().encode(newProduct)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, resp, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else {
                print("No hubo datos")
                return
            }
            
            do {
                
                let finalResponse = try JSONDecoder().decode(MessageResponse.self, from: data)
                DispatchQueue.main.async {
                    print(finalResponse.message)
                    completion(true)
                }
                
            } catch let jerror {
                completion(false)
                print(jerror)
            }
            
        }
        dataTask.resume()
        
    }
    
}
