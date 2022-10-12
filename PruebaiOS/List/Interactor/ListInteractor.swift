//
//  ListInteractor.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

class ListInteractor: ListPresenterInteractorProtocol{
    let repository: GoRestRepositoryProtocol = GoRestRepository()
    weak var presenter: ListInteractorPresenterProtocol?
    func getData() {
        repository.getGoRestData {[weak self] response in
//            switch response {
//            case .success(let data):
//                ()
//            case .failure:
//                self?.presenter?.didReceiveError()
//            }
            DispatchQueue.main.async {
                self?.presenter?.didReceiveError()
            }
            
        }
    }
}
