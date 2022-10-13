//
//  ListPresenter.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

class ListPresenter: ListPresenterProtocol {
    var interactor: ListInteractorProtocol
    weak var view: ListViewProtocol?
    var router: ListPresenterRouterProtocol
    var title: String = Localized.List.title
    var elements: [DataModel] = []
    var requestData = RequestModel(pageNumber: 1, pageSize: 10, totalPage: 1, text: .empty)
    init(router: ListPresenterRouterProtocol,
         interactor: ListInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        initialLoadData()
    }
    
    func getData() {
        interactor.getData(requestData: requestData)
    }
    
    func didReceiveError() {
        self.view?.loading(with: false)
        router.presentError()
    }
    
    func didReceiveData(dataModel: ListModel) {
        requestData.pageSize = dataModel.pagination.pageSize
        requestData.pageNumber = dataModel.pagination.pageNumber
        requestData.totalPage = dataModel.pagination.totalPage
        
        if dataModel.pagination.pageNumber == 1 {
            self.elements = dataModel.data
        } else {
            self.elements.append(contentsOf: dataModel.data)
        }
        self.view?.loading(with: false)
        self.view?.didReceiveData()
    }
    
    func search(with title: String) {
        requestData.text = title
        requestData.pageNumber = 1
        interactor.getData(requestData: requestData)
    }
    
    func willDisplay(indexPath: IndexPath) {
        if elements.count.decrement() <= indexPath.row {
            loadMoreData()
        }
    }
    
    func initialLoadData() {
        requestData.pageNumber = 1
        interactor.getData(requestData: requestData)
    }
    
    func loadMoreData() {
        if requestData.pageNumber < requestData.totalPage {
            requestData.pageNumber += 1
            interactor.getData(requestData: requestData)
        }
    }
    
    func didSelect(at index: Int) {
        let dataModel = elements[index]
        router.pushDetail(with: dataModel)
    }
}
