//
//  ListInteractor.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

class ListInteractor: ListInteractorProtocol{
    var repository: GoRestRepositoryProtocol = GoRestRepository()
    weak var presenter: ListPresenterProtocol?
    
    var isLoadingMoreData: Bool = false
    func getData(requestData: RequestModel) {
        guard !isLoadingMoreData else {return}
        isLoadingMoreData = true
        repository.getGoRestData(request: requestData) {[weak self] response in
            defer {self?.isLoadingMoreData = false}
            guard let self = self else {
                self?.presenter?.didReceiveError()
                return
            }
            switch response {
            case .success(let data):
                let listModel = self.mapDataModel(data: data)
                self.setupData(listModel: listModel)
            case .failure:
                self.presenter?.didReceiveError()
            }
            
        }
    }
    
    func setupData(listModel: ListModel) {
        self.presenter?.didReceiveData(dataModel: listModel)
    }
    
    func mapDataModel(data: ListEntity) -> ListModel {
        let dataModel = data.data.map { dataEntity -> DataModel in
            return .init(title: dataEntity.title, body: dataEntity.body)
        }
        
        return .init(data: dataModel,pagination: .init(pageNumber: data.pagination.pageNumber,
                                                       pageSize: data.pagination.pageSize,
                                                       totalPage: data.pagination.totalPage))
    }
    
    
}
