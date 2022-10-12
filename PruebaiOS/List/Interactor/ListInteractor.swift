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
    var requestData = RequestModel(pageNumber: 1, pageSize: 10, totalPage: 1, text: "")
    var isLoadingMoreData: Bool = false
    func getData() {
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
        setupPagination(paginationModel: listModel.pagination)
        self.presenter?.didReceiveData(dataModel: listModel)

    }
    
    func setupPagination(paginationModel: PaginationModel) {
        requestData.pageSize = paginationModel.pageSize
        requestData.pageNumber = paginationModel.pageNumber
        requestData.totalPage = paginationModel.totalPage
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
