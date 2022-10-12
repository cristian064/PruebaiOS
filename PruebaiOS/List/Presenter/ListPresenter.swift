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
    var elements: [String] = ["1", "2"]
    
    init(router: ListPresenterRouterProtocol,
         interactor: ListPresenterInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor.getData()
    }
    
    func didReceiveError() {
        router.presentError()
    }
    
}
