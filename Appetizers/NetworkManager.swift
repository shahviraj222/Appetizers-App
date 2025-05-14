//
//  NetworkManager.swift
//  Appetizers
//
//  Created by viraj shah on 14/05/25.
//

import Foundation

final class NetworkManager{
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
//    this init confirms that we are using singlton design pattern   Steps :  make constructor private s
    private init(){
        
    }
    
    
//    we are calling the closuer
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            // ✅ Step 1: Check for networking error
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
                completed(.failure(.unableToComplete))
                return
            }
            
            // ✅ Step 2: Check for valid HTTP response (status code 200)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            // ✅ Step 3: Check if we got data
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            // ✅ Step 4: Decode the JSON
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            
                completed(.success(decodedResponse.request))
                
//                here the data that is written in success is passed to  the result  <Appetizers>
            } catch {
                print("❌ Decoding error: \(error.localizedDescription)")
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }

}
