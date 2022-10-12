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
            guard let self = self else {
                self?.presenter?.didReceiveError()
                return
            }
            switch response {
            case .success(let data):
                let listModel = self.mapDataModel(data: data)
                self.presenter?.didReceiveData(dataModel: listModel)
            case .failure:
                self.presenter?.didReceiveError()
            }
            
        }
    }
    func mapDataModel(data: ListEntity) -> ListModel {
        let dataModel = data.data.map { dataEntity -> DataModel in
            return .init(title: dataEntity.title, body: dataEntity.body)
        }
        
        return .init(data: dataModel)
    }
}
