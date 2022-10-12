//
//  GoRestRepository.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

protocol GoRestRepositoryProtocol: AnyObject {
    func getGoRestData(request model: RequestModel, completion: @escaping (ResponseAPI<ListEntity>) -> Void)
}

class GoRestRepository: RestAPI, GoRestRepositoryProtocol {
    
    func getGoRestData(request model: RequestModel, completion: @escaping (ResponseAPI<ListEntity>) -> Void) {
        let url = "https://gorest.co.in/public/v1/posts?page=\(model.pageNumber)&limit=\(model.pageSize)&title=\(model.text)"
        request(with: url, httpMethod: .get, completion: completion)
        
    }
}

