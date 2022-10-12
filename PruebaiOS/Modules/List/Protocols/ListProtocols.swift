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
    func initialLoadData()
    func search(with title: String)
    func willDisplay(indexPath: IndexPath)
    func didSelect(at index: Int)
}

protocol ListPresenterViewProtocol: AnyObject {
    func didReceiveData()
    func loading(with isLoading: Bool)
}


protocol ListInteractorPresenterProtocol: AnyObject {
    func didReceiveError()
    func didReceiveData(dataModel: ListModel)
}

protocol ListPresenterInteractorProtocol: AnyObject {
    func getData()
    var requestData: RequestModel {get set}
}

protocol ListPresenterRouterProtocol: AnyObject {
    func presentError()
    func pushDetail(with data: DataModel)
}
