//
//  ListPresenter.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

class ListPresenter: ListViewPresenterProtocol, ListInteractorPresenterProtocol {
    var interactor: ListPresenterInteractorProtocol
    weak var view: ListPresenterViewProtocol?
    var router: ListPresenterRouterProtocol
    var title: String = "Lista"
    var elements: [DataModel] = []
    init(router: ListPresenterRouterProtocol,
         interactor: ListPresenterInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        initialLoadData()
    }
    
    func getData() {
        interactor.getData()
    }
    
    func didReceiveError() {
        self.view?.loading(with: false)
        router.presentError()
    }
    
    func didReceiveData(dataModel: ListModel) {
        if dataModel.pagination.pageNumber == 1 {
            self.elements = dataModel.data
        } else {
            self.elements.append(contentsOf: dataModel.data)
        }
        self.view?.loading(with: false)
        self.view?.didReceiveData()
    }
    
    func search(with title: String) {
        interactor.requestData.text = title
        interactor.requestData.pageNumber = 1
        interactor.getData()
    }
    
    func willDisplay(indexPath: IndexPath) {
        if elements.count.decrement() <= indexPath.row {
            loadMoreData()
        }
    }
    
    func initialLoadData() {
        interactor.requestData.pageNumber = 1
        interactor.getData()
    }
    
    func loadMoreData() {
        let pageNumber = (elements.count / interactor.requestData.pageSize).increment()
        if pageNumber <= interactor.requestData.totalPage {
            interactor.requestData.pageNumber = pageNumber
            interactor.getData()
        }
    }
}
