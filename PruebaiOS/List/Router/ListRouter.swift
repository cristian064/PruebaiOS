//
//  ListRouter.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation
import UIKit

class ListRouter: UINavigationController, ListPresenterRouterProtocol {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.pushViewController(createModule(), animated: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createModule() -> UIViewController {
        let interactor = ListInteractor()
        let presenter = ListPresenter(router: self,
                                      interactor: interactor)
        let viewController = ListViewController(presenter: presenter)
        
        interactor.presenter = presenter
        presenter.view = viewController
        return viewController
    }
    
    func presentError() {
        let alerView = UIAlertController(title: "Error", message: "Something happen", preferredStyle: .alert)
        alerView.addAction(.init(title: "acept", style: .destructive))
        self.present(alerView, animated: false, completion: nil)
    }
}
