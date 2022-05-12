//
//  SessionViewModel.swift
//  Unimarket
//
//  Created by Juan Carlos Sánchez Gutiérrez on 11/05/22.
//

import Foundation

class SessionViewModel: ObservableObject {
    
    @Published var session: User? = nil
    
    func signIn(credentials: UserCredentials) {
        
        guard let url = URL(string: "http://192.168.1.71:3000/login") else {fatalError()}
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try! JSONEncoder().encode(credentials)
        print(urlRequest.httpBody!)
        
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
                
                let finalResponse = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    self.session = finalResponse
                }
                
            } catch let jerror {
                print(jerror)
            }
            
        }
        dataTask.resume()
        
    }
    
    func singUp(user: User, completion: @escaping (Bool) -> ()) {
        guard let url = URL(string: "http://192.168.1.71:3000/register") else {fatalError()}
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try! JSONEncoder().encode(user)
        
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
                    self.signIn(credentials: UserCredentials(usuarioId: user.usuarioId, constrasena: user.constrasena))
                    completion(true)
                }
                
            } catch let jerror {
                completion(false)
                print(jerror)
            }
            
        }
        dataTask.resume()
    }
    
    func signOut() {
        if self.session != nil {
            self.session = nil
        }
    }
    
}
