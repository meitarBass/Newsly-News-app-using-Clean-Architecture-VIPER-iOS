//
//  NetworkService.swift
//  Newsly
//
//  Created by Ebubechukwu Dimobi on 05.10.2020.
//

import Foundation

struct NetworkServices {
    
    static let shared = NetworkServices()
    private init() {}
    
    func networkRequest<T: Codable> (url: String, modelType: T.Type, completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = URL(string: "\(url)") else {
            completion(.failure(NSError(domain: "empty", code: 0, userInfo: [:])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                completion(.failure(error))
            }
            
            guard let data = data else {
            completion(.failure(NSError(domain: "data is empty", code: 0, userInfo: [:])))
                return
            }
            
            completion(self.parseData(data: data, modelType: T.self))
        }
        task.resume()
    }
    
    private func parseData< T: Codable>(data: Data, modelType: T.Type) -> Result<T, Error> {
        let decoder = JSONDecoder()
        
        do {
            let result = try decoder.decode(T.self, from: data)
            return .success(result)
        } catch {
            print("error while decoding data", error)
            return .failure(error)
        }
    }
}
