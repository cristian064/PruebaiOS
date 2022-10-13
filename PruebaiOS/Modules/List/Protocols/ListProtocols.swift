//
//  ListProtocols.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

protocol ListPresenterProtocol: AnyObject {
    var title: String { get }
    var elements: [DataModel] {get}
    func viewDidLoad()
    func initialLoadData()
    func search(with title: String)
    func willDisplay(indexPath: IndexPath)
    func didSelect(at index: Int)
    func didReceiveError()
    func didReceiveData(dataModel: ListModel)

}

protocol ListViewProtocol: AnyObject {
    func didReceiveData()
    func loading(with isLoading: Bool)
}


protocol ListInteractorProtocol: AnyObject {
    func getData(requestData: RequestModel)
}

protocol ListPresenterRouterProtocol: AnyObject {
    func presentError()
    func pushDetail(with data: DataModel)
}
