//
//  GoRestRepository.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

protocol GoRestRepositoryProtocol: AnyObject {
    func getGoRestData(completion: @escaping (ResponseAPI<ListEntity>) -> Void)
}

class GoRestRepository: RestAPI, GoRestRepositoryProtocol {
    
    func getGoRestData(completion: @escaping (ResponseAPI<ListEntity>) -> Void) {
        let url = "https://gorest.co.in/public/v1/posts?page=1"
        request(with: url, httpMethod: .get, completion: completion)
        
    }
}

