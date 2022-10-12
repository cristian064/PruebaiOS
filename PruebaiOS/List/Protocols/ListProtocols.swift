//
//  ListProtocols.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

protocol ListViewPresenterProtocol: AnyObject {
    var title: String { get }
    var elements: [DataModel] {get}
    func viewDidLoad()
}

protocol ListPresenterViewProtocol: AnyObject {
//    func didReceiveError()
    func didReceiveData()
}


protocol ListInteractorPresenterProtocol: AnyObject {
    func didReceiveError()
    func didReceiveData(dataModel: ListModel)
}

protocol ListPresenterInteractorProtocol: AnyObject {
    func getData()
}

protocol ListPresenterRouterProtocol: AnyObject {
    func presentError()
}
