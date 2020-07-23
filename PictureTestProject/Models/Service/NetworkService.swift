//
//  NetworkService.swift
//  PictureTestProject
//
//  Created by Admin on 7/22/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    private let baseURL = "https://pryaniky.com/static/json"
    
    typealias GenericCompletion<T> = (T?, Error?) -> ()
    
    enum HttpRequestType : String {
        case Get = "GET", Post = "POST"
    }
    
    func getTypesToView(_ completion:  GenericCompletion<TypesToView>?) {
        
        let link = "/sample.json"
        request(url: link) { (typesToView : TypesToView?, error) in
            DispatchQueue.main.async {
                completion?(typesToView, error)
            }
        }
        
    }
    
    // Send parametr in url
    private func request<T: Decodable>(url : String, parametrs : String = "", type : HttpRequestType = .Get, _ completion: GenericCompletion<T>?) {
        
        let stringToUrl = baseURL + url + parametrs
        guard let url = URL(string: stringToUrl) else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = type.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                completion?(nil, error)
            }
            
            do {
                
                let some = try JSONDecoder().decode(T.self, from: data!)
                completion?(some, nil)
                
            } catch let error {
                completion?(nil, error)
            }
            
        }.resume()
        
    }
    
}
