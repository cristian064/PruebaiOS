//
//  ListProtocols.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 11/10/22.
//

import Foundation

protocol ListViewPresenterProtocol: AnyObject {
    var title: String { get }
    var elements: [String] {get}
    func viewDidLoad()
}

protocol ListPresenterViewProtocol: AnyObject {
//    func didReceiveError()
}


protocol ListInteractorPresenterProtocol: AnyObject {
    func didReceiveError()
}

protocol ListPresenterInteractorProtocol: AnyObject {
    func getData()
}

protocol ListPresenterRouterProtocol: AnyObject {
    func presentError()
}
