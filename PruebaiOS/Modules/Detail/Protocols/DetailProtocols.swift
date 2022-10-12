//
//  DetailProtocols.swift
//  PruebaiOS
//
//  Created by Cristian Ayala on 12/10/22.
//

import Foundation

protocol DetailViewPresenterProtocol: AnyObject {
    var title: String { get }
    var data: DataModel { get }
}
