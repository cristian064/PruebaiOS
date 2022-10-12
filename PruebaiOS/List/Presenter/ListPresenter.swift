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
        getData()
    }
    
    func getData() {
        interactor.getData()
    }
    
    func didReceiveError() {
        self.view?.loading(with: false)
        router.presentError()
    }
    
    func didReceiveData(dataModel: ListModel) {
        self.elements = dataModel.data
        self.view?.loading(with: false)
        self.view?.didReceiveData()
    }
}
