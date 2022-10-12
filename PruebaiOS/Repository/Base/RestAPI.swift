//
//  RestAPI.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 12/10/22.
//

import Foundation

protocol RestAPI {
    func request<ResponseCodable>(with requestUrl: String,
                                  httpMethod: HttpVerb,
                                  completion: @escaping (ResponseAPI<ResponseCodable>) -> Void) where ResponseCodable: Decodable
}

extension RestAPI {
    func request<ResponseCodable>(with requestUrl: String,
                                  httpMethod: HttpVerb,
                                  completion: @escaping (ResponseAPI<ResponseCodable>) -> Void) where ResponseCodable: Decodable {
        
        
        guard let url = URL(string: requestUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        sessionRequest(with: request, completion: completion)
    }
    
    func sessionRequest<ResponseCodable>(with urlRequest: URLRequest,
                                         completion: @escaping (ResponseAPI<ResponseCodable>) -> Void) where ResponseCodable: Decodable {
        let session = SessionManager.shared.session
        session.dataTask(with: urlRequest) { data, urlResponse, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.dataTaskError(error)))
                    return
                }
                guard let data = data else{
                    return
                }
                
                decode(data: data, completion: completion)
            }
        }.resume()
    }
    
    func decode<ResponseCodable>(data: Data,
                                         completion: @escaping (ResponseAPI<ResponseCodable>) -> Void) where ResponseCodable: Decodable {
        do{
            let responseCodable = try JSONDecoder().decode(ResponseCodable.self, from: data)
            completion(.success(responseCodable))
        }catch {
            completion(.failure(.jsonDecoderError))
        }
    }
}
