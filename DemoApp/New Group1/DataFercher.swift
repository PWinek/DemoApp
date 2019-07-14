//
//  DataFercher.swift
//  DemoApp
//
//  Created by Amelia Płatek on 11/07/2019.
//  Copyright © 2019 paw. All rights reserved.
//

import Foundation

class DataFetcher {
    
    private init() {}
    static let shared = DataFetcher()
    
    let mainUrl = "https://api.github.com/"
    
    func getResolts(query: String, page: Int, completion: @escaping (Resoult?, Error?) -> Void) {
        
        let url = mainUrl + "search/repositories?q=\(query)&per_page=100&page=\(page)"
        
        genericGetFetcher(urlString: url, completion: { completion($0, $1) })
    }
    
    
    private func genericGetFetcher<T: Codable>(urlString: String, completion: @escaping (T?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(nil, FetcherError.wrongURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // 1. Pierwsze sprawdzenie
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            // 1. Drugie sprawdzenie
            guard let data = data else {
                completion(nil, FetcherError.wrongData)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                // conver from snake case to camel case
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let model = try jsonDecoder.decode(T.self, from: data)
                completion(model, nil)
            } catch let err {
                completion(nil, err)
            }
        }
        
        task.resume()
    }
    
    enum FetcherError: Error {
        case wrongURL
        case wrongData
    }
}


